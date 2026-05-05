using Content.Goobstation.Common.DeviceNetwork;
using Content.Goobstation.Shared.StationRadio.Components;
using Content.Server.DeviceNetwork;
using Content.Server.DeviceNetwork.Components;
using Content.Server.DeviceNetwork.Systems;
using Content.Shared.DeviceLinking.Events;
using Content.Shared.DeviceNetwork;
using Robust.Shared.Audio;
using Robust.Shared.Audio.Components;
using Robust.Shared.Audio.Systems;
using Robust.Shared.Timing;

namespace Content.Server._Goobstation.StationRadio.Systems;

public sealed class StationRadioSystem : EntitySystem
{
    // Vinyl -> Server -> Receivers commands
    public const string PlayAudioCommand = "station_radio_play_audio";
    public const string StopAudioCommand = "station_radio_stop_audio";
    public const string SetAudioStateCommand = "station_radio_set_audio_state";

    // Request that is sent backwards from a receiver to vinyl player to get info about the audio.
    // In a perfect world this wouldn't
    public const string AudioRequestCommand = "station_radio_request_audio";
    public const string AudioPathData = "station_radio_data_audio_path";
    public const string AudioPlaybackData = "station_radio_data_audio_playback";
    public const string AudioStateData = "station_radio_data_audio_state";

    [Dependency] private readonly SharedAudioSystem _audio = default!;
    [Dependency] private readonly DeviceNetworkSystem _device = default!;
    [Dependency] private readonly IGameTiming _timing = default!;

    public override void Initialize()
    {
        base.Initialize();
        SubscribeLocalEvent<StationRadioServerComponent, NewLinkEvent>(OnNewLink);
        SubscribeLocalEvent<StationRadioServerComponent, DeviceNetworkPacketEvent>(OnServerRelay);
        SubscribeLocalEvent<StationRadioServerComponent, DeviceNetworkFrequencyChangedEvent>(OnServerChangeFrequency);
        SubscribeLocalEvent<StationRadioReceiverComponent, DeviceNetworkPacketEvent>(OnReceive);
        SubscribeLocalEvent<StationRadioReceiverComponent, DeviceNetworkFrequencyChangedEvent>(OnReceiverChangeFrequency);
    }

    private void OnNewLink(Entity<StationRadioServerComponent> ent, ref NewLinkEvent args)
    {
        if (args.SourcePort != ent.Comp.MusicOutputPort)
            return;

        ent.Comp.VinylPlayer = args.Source;
    }

    private void OnServerChangeFrequency(Entity<StationRadioServerComponent> ent, ref DeviceNetworkFrequencyChangedEvent args)
    {
        // Tell all old listeners to stop playing
        var payload = new NetworkPayload
        {
            [DeviceNetworkConstants.Command] = StopAudioCommand
        };
        _device.QueuePacket(ent.Owner, null, payload, args.OldFrequency);

        // Tell all new listeners to start playing
        if (ent.Comp.VinylPlayer == null || !TryComp<VinylPlayerComponent>(ent.Comp.VinylPlayer, out var vinyl))
            return;
        if (!TryComp<AudioComponent>(vinyl.SoundEntity, out var audio))
            return;

        var currentSong = new SoundPathSpecifier(audio.FileName, audio.Params);
        var position = CalculateAudioPosition(audio);
        var startPayload = new NetworkPayload()
        {
            [DeviceNetworkConstants.Command] = PlayAudioCommand,
            [AudioPathData] = currentSong,
            [AudioPlaybackData] = position
        };
        _device.QueuePacket(ent.Owner, null, startPayload, args.NewFrequency);
    }

    private void OnReceiverChangeFrequency(Entity<StationRadioReceiverComponent> ent, ref DeviceNetworkFrequencyChangedEvent args)
    {
        // Send a request to get currently playing music and it's playback position
        ent.Comp.SoundEntity = _audio.Stop(ent.Comp.SoundEntity);
        var payload = new NetworkPayload
        {
            [DeviceNetworkConstants.Command] = AudioRequestCommand
        };
        _device.QueuePacket(ent.Owner, null, payload, args.NewFrequency);
    }

    private void OnServerRelay(Entity<StationRadioServerComponent> ent, ref DeviceNetworkPacketEvent args)
    {
        if (!TryComp<DeviceNetworkComponent>(ent.Owner, out var network)) return;
        if (args.Data.TryGetValue(DeviceNetworkConstants.Command, out string? command))
        {
            switch (command)
            {
                case PlayAudioCommand:
                    if (args.Data.TryGetValue(AudioPathData, out SoundSpecifier? sound)
                    && args.Data.TryGetValue(AudioPlaybackData, out float playback))
                    {
                        var startPayload = new NetworkPayload()
                        {
                            [DeviceNetworkConstants.Command] = PlayAudioCommand,
                            [AudioPathData] = sound,
                            [AudioPlaybackData] = playback
                        };
                        _device.QueuePacket(ent.Owner, null, startPayload, network.TransmitFrequency);
                    }
                    break;
                case StopAudioCommand:
                    var stopPayload = new NetworkPayload()
                    {
                        [DeviceNetworkConstants.Command] = StopAudioCommand
                    };
                    _device.QueuePacket(ent.Owner, null, stopPayload, args.Frequency);
                    break;
                case AudioRequestCommand:
                    if (ent.Comp.VinylPlayer == null || !TryComp<VinylPlayerComponent>(ent.Comp.VinylPlayer, out var vinyl))
                        break;
                    if (vinyl.SoundEntity == null || !TryComp<AudioComponent>(vinyl.SoundEntity, out var audio))
                        break;

                    var currentSong = new SoundPathSpecifier(audio.FileName, audio.Params);
                    var position = CalculateAudioPosition(audio);
                    var startPayload2 = new NetworkPayload()
                    {
                        [DeviceNetworkConstants.Command] = PlayAudioCommand,
                        [AudioPathData] = currentSong,
                        [AudioPlaybackData] = position
                    };
                    _device.QueuePacket(ent.Owner, args.SenderAddress, startPayload2, args.Frequency);
                    break;
            }
        }
    }

    private void OnReceive(Entity<StationRadioReceiverComponent> ent, ref DeviceNetworkPacketEvent args)
    {
        if (!TryComp<DeviceNetworkComponent>(ent.Owner, out var network))
            return;

        if (args.Address != null && args.Address != network.Address)
            return;

        if (!args.Data.TryGetValue(DeviceNetworkConstants.Command, out string? command))
            return;

        switch (command)
        {
            case PlayAudioCommand:
                if (args.Data.TryGetValue(AudioPathData, out SoundSpecifier? sound)
                && args.Data.TryGetValue(AudioPlaybackData, out float playback))
                    PlayAudio(ent, sound, playback);
                break;
            case StopAudioCommand:
                ent.Comp.SoundEntity = _audio.Stop(ent.Comp.SoundEntity);
                break;
            case SetAudioStateCommand:
                if (args.Data.TryGetValue(AudioStateData, out AudioState state))
                    _audio.SetState(ent.Comp.SoundEntity, state);
                break;
        }
    }

    private void PlayAudio(Entity<StationRadioReceiverComponent> ent, SoundSpecifier? sound, float playback = 0)
    {
        // Remove the previous audio entity if it existed
        if (ent.Comp.SoundEntity != null)
            ent.Comp.SoundEntity = _audio.Stop(ent.Comp.SoundEntity);

        var audio = _audio.PlayPvs(sound,
            ent.Owner,
            ent.Comp.DefaultParams);
        if (audio != null)
            ent.Comp.SoundEntity = audio.Value.Entity;

        _audio.SetPlaybackPosition(audio, playback);
    }

    // Why is this not exposed in the Audio API robust tools ugh
    private float CalculateAudioPosition(AudioComponent audio, float? length = null, float? position = null)
    {
        position ??= (float) ((audio.PauseTime ?? _timing.CurTime) - audio.AudioStart).TotalSeconds;
        length ??= (float) _audio.GetAudioLength(audio.FileName).TotalSeconds;

        if (audio.Params.Loop)
            position %= length;

        var maxOffset = Math.Max((float) length - 0.01f, 0f);
        position = Math.Clamp(position.Value, 0f, maxOffset);

        return position.Value;
    }
}
