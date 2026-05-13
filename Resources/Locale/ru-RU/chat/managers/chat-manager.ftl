### UI

<<<<<<< Updated upstream
chat-manager-max-message-length = Ваше сообщение превышает лимит в { $maxMessageLength } символов
=======
chat-manager-max-message-length = Ваше сообщение превышает лимит в {$maxMessageLength} символов
>>>>>>> Stashed changes
chat-manager-ooc-chat-enabled-message = OOC чат был включён.
chat-manager-ooc-chat-disabled-message = OOC чат был отключён.
chat-manager-looc-chat-enabled-message = LOOC чат был включён.
chat-manager-looc-chat-disabled-message = LOOC чат был отключён.
<<<<<<< Updated upstream
chat-manager-dead-looc-chat-enabled-message = Мёртвые игроки теперь могут говорить в LOOC.
chat-manager-dead-looc-chat-disabled-message = Мёртвые игроки больше не могут говорить в LOOC.
chat-manager-crit-looc-chat-enabled-message = Игроки в критическом состоянии теперь могут говорить в LOOC.
chat-manager-crit-looc-chat-disabled-message = Игроки в критическом состоянии больше не могут говорить в LOOC.
chat-manager-admin-ooc-chat-enabled-message = Админ OOC чат был включён.
chat-manager-admin-ooc-chat-disabled-message = Админ OOC чат был выключен.

chat-manager-max-message-length-exceeded-message = Ваше сообщение превышает лимит в { $limit } символов
chat-manager-no-headset-on-message = У вас нет гарнитуры!
chat-manager-no-radio-key = Не задан ключ канала!
chat-manager-no-such-channel = Нет канала с ключём '{ $key }'!
chat-manager-whisper-headset-on-message = Вы не можете шептать в радио!
=======
chat-manager-dead-looc-chat-enabled-message = Мёртвые игроки теперь могут использовать LOOC.
chat-manager-dead-looc-chat-disabled-message = Мёртвые игроки больше не могут использовать LOOC.
chat-manager-crit-looc-chat-enabled-message = Игроки в критическом состоянии теперь могут использовать LOOC.
chat-manager-crit-looc-chat-disabled-message = Игроки в критическом состоянии больше не могут использовать LOOC.
chat-manager-admin-ooc-chat-enabled-message = Admin OOC чат был включён.
chat-manager-admin-ooc-chat-disabled-message = Admin OOC чат был отключён.

chat-manager-max-message-length-exceeded-message = Ваше сообщение превысило лимит в {$limit} символов
chat-manager-no-headset-on-message = На вас нет гарнитуры!
chat-manager-no-radio-key = Не указан ключ радиоканала!
chat-manager-no-such-channel = Нет канала с ключом '{$key}'!
chat-manager-whisper-headset-on-message = Нельзя шептать по радио!
>>>>>>> Stashed changes

chat-manager-server-wrap-message = [bold]{ $message }[/bold]
chat-manager-sender-announcement = Центральное командование
chat-manager-sender-announcement-wrap-message = [font size=14][bold]Объявление { $sender }:[/font][font size=12]
                                                { $message }[/bold][/font]
chat-manager-entity-say-wrap-message = [BubbleHeader][bold][Name]{ $entityName }[/Name][/bold][/BubbleHeader] { $verb }, [font={ $fontType } size={ $fontSize } ]"[BubbleContent]{ $message }[/BubbleContent]"[/font]
chat-manager-entity-say-bold-wrap-message = [BubbleHeader][bold][Name]{ $entityName }[/Name][/bold][/BubbleHeader] { $verb }, [font={ $fontType } size={ $fontSize }]"[BubbleContent][bold]{ $message }[/bold][/BubbleContent]"[/font]

<<<<<<< Updated upstream
chat-manager-entity-whisper-wrap-message = [font size=11][italic][BubbleHeader][Name]{ $entityName }[/Name][/BubbleHeader] шепчет,"[BubbleContent]{ $message }[/BubbleContent]"[/italic][/font]
chat-manager-entity-whisper-unknown-wrap-message = [font size=11][italic][BubbleHeader]Кто-то[/BubbleHeader] шепчет, "[BubbleContent]{ $message }[/BubbleContent]"[/italic][/font]

# THE() is not used here because the entity and its name can technically be disconnected if a nameOverride is passed...
chat-manager-entity-me-wrap-message = [italic]{ CAPITALIZE($entityName) } { $message }[/italic]
=======
chat-manager-server-wrap-message = [bold]{$message}[/bold]
chat-manager-sender-announcement-wrap-message = [font size=14][bold]{$sender} объявляет:[/font][font size=12]
                                                {$message}[/bold][/font]

# Форматирование сообщений в чате и речевых пузырях
chat-manager-entity-say-wrap-message = [BubbleHeader][Name][font size=11][color={$color}][bold]{$language}[/bold][/color][/font][bold]{$entityName}[/bold][/Name][/BubbleHeader] {$verb}, [font="{$fontType}" size={$fontSize} ][color={$color}]"[BubbleContent][font="{$fontType}" size={$fontSize}][color={$color}]{$message}[/color][/font][/BubbleContent]"[/color][/font]
chat-manager-entity-say-bold-wrap-message = [BubbleHeader][Name][font size=11][color={$color}][bold]{$language}[/bold][/color][/font][bold]{$entityName}[/bold][/Name][/BubbleHeader] {$verb}, [font="{$fontType}" size={$fontSize} ][color={$color}][bold]"[BubbleContent][font="{$fontType}" size={$fontSize}][color={$color}][bold]{$message}[/bold][/color][/font][/BubbleContent]"[/bold][/color][/font]

chat-manager-entity-whisper-wrap-message = [BubbleHeader][Name][font size=10][color={$color}][bold]{$language}[/bold][/color][/font][font size=11][italic]{$entityName}[/Name][/BubbleHeader] шепчет, [font="{$fontType}"][color={$color}][italic]"[BubbleContent][font="{$fontType}"][color={$color}][italic]{$message}[/italic][/color][/font][/BubbleContent]"[/italic][/color][/font][/italic][/font]
chat-manager-entity-whisper-unknown-wrap-message = [BubbleHeader][font size=10][color={$color}][bold]{$language}[/bold][/color][/font][font size=11][italic]Кто-то[/BubbleHeader] шепчет, [font="{$fontType}"][color={$color}][italic]"[BubbleContent][font="{$fontType}"][color={$color}][italic]{$message}[/italic][/color][/font][/BubbleContent]"[/italic][/color][/font][/italic][/font]

# Форматирование эмоций
# #Misfits Change - wrap name in [Name] tags so client can apply chat name color
# #Misfits Fix - Capitalize "The" for sentence-start emote messages when no ID is present
chat-manager-entity-me-wrap-message = [italic]{ PROPER($entity) ->
    *[false] [Name]{$entityName}[/Name] {$message}[/italic]
     [true] [Name]{$entityName}[/Name] {$message}[/italic]
    }
>>>>>>> Stashed changes

chat-manager-entity-looc-wrap-message = LOOC: [bold]{ $entityName }:[/bold] { $message }
chat-manager-send-ooc-wrap-message = OOC: [bold]{ $playerName }:[/bold] { $message }
chat-manager-send-ooc-patron-wrap-message = OOC: [bold][color={ $patronColor }]{ $playerName }[/color]:[/bold] { $message }

<<<<<<< Updated upstream
chat-manager-send-dead-chat-wrap-message = { $deadChannelName }: [bold][BubbleHeader]{ $playerName }[/BubbleHeader]:[/bold] [BubbleContent]{ $message }[/BubbleContent]
chat-manager-send-admin-dead-chat-wrap-message = { $adminChannelName }: [bold]([BubbleHeader]{ $userName }[/BubbleHeader]):[/bold] [BubbleContent]{ $message }[/BubbleContent]
chat-manager-send-admin-chat-wrap-message = { $adminChannelName }: [bold]{ $playerName }:[/bold] { $message }
chat-manager-send-admin-announcement-wrap-message = [bold]{ $adminChannelName }: { $message }[/bold]
=======
chat-manager-entity-looc-wrap-message = LOOC: {$entityName}: {$message}
chat-manager-send-ooc-wrap-message = OOC: {$playerName}: {$message}
chat-manager-send-ooc-patron-wrap-message = OOC: [color={$patronColor}]{$playerName}[/color]: {$message}
# #Misfits - Supporter OOC formats: with and without title prefix
chat-manager-send-ooc-supporter-wrap-message = OOC: [color={$supporterColor}][bold]\[{$supporterTitle}][/bold] {$playerName}[/color]: {$message}
chat-manager-send-ooc-supporter-notitle-wrap-message = OOC: [color={$supporterColor}]{$playerName}[/color]: {$message}
>>>>>>> Stashed changes

chat-manager-send-hook-ooc-wrap-message = OOC: [bold](D){ $senderName }:[/bold] { $message }
chat-manager-send-hook-admin-wrap-message = АДМИН: [bold](D){ $senderName }:[/bold] { $message }

<<<<<<< Updated upstream
chat-manager-dead-channel-name = МЁРТВЫЕ
chat-manager-admin-channel-name = АДМИН

chat-manager-rate-limited = Вы отправляете сообщения слишком быстро!
chat-manager-rate-limit-admin-announcement = Предупреждение о превышении ограничения скорости: { $player }
=======
chat-manager-send-hook-ooc-wrap-message = OOC: (D){$senderName}: {$message}

chat-manager-dead-channel-name = МЁРТВ
chat-manager-admin-channel-name = АДМИН

chat-manager-rate-limited = Вы отправляете сообщения слишком быстро!
chat-manager-rate-limit-admin-announcement = Игрок { $player } превысил лимит сообщений. Следите за ним, если это происходит регулярно.

chat-manager-send-empathy-chat-wrap-message = {$source}: {$message}

chat-manager-send-cult-chat-wrap-message = [bold]\[{ $channelName }\] [BubbleHeader]{ $player }[/BubbleHeader]:[/bold] [BubbleContent]{ $message }[/BubbleContent]
chat-manager-cult-channel-name = Культ Крови
>>>>>>> Stashed changes

## Глаголы речи

chat-speech-verb-suffix-exclamation = !
chat-speech-verb-suffix-exclamation-strong = !!
chat-speech-verb-suffix-question = ?
chat-speech-verb-suffix-stutter = -
chat-speech-verb-suffix-mumble = ..

chat-speech-verb-name-none = Нет
<<<<<<< Updated upstream
chat-speech-verb-name-default = По умолчанию
chat-speech-verb-default = говорит
chat-speech-verb-name-exclamation = Восклицание
chat-speech-verb-exclamation = восклицает
chat-speech-verb-name-exclamation-strong = Крик
chat-speech-verb-exclamation-strong = кричит
chat-speech-verb-name-question = Вопрос
chat-speech-verb-question = спрашивает
chat-speech-verb-name-stutter = Заикание
chat-speech-verb-stutter = запинается
chat-speech-verb-name-mumble = Бубнёж
chat-speech-verb-mumble = бубнит

chat-speech-verb-name-arachnid = Арахнид
chat-speech-verb-insect-1 = стрекочет
chat-speech-verb-insect-2 = жужжит
chat-speech-verb-insect-3 = щёлкает

chat-speech-verb-name-moth = Моль
chat-speech-verb-winged-1 = свистит
chat-speech-verb-winged-2 = хлопает
chat-speech-verb-winged-3 = клокочет

chat-speech-verb-name-slime = Слаймолюд
chat-speech-verb-slime-1 = шлёпает
chat-speech-verb-slime-2 = бурлит
chat-speech-verb-slime-3 = булькает

chat-speech-verb-name-plant = Диона
chat-speech-verb-plant-1 = шелестит
chat-speech-verb-plant-2 = шуршит
chat-speech-verb-plant-3 = скрипит

chat-speech-verb-name-robotic = Робот
chat-speech-verb-robotic-1 = докладывает
chat-speech-verb-robotic-2 = пищит
chat-speech-verb-robotic-3 = информирует
=======
chat-speech-verb-name-default = Обычный
chat-speech-verb-default = говорит
chat-speech-verb-name-exclamation = Восклицающий
chat-speech-verb-exclamation = восклицает
chat-speech-verb-name-exclamation-strong = Кричащий
chat-speech-verb-exclamation-strong = кричит
chat-speech-verb-name-question = Спрашивающий
chat-speech-verb-question = спрашивает
chat-speech-verb-name-stutter = Заикающийся
chat-speech-verb-stutter = заикается
chat-speech-verb-name-mumble = Бормочущий
chat-speech-verb-mumble = бормочет

chat-speech-verb-name-arachnid = Арахнид
chat-speech-verb-insect-1 = стрекочет
chat-speech-verb-insect-2 = щебечет
chat-speech-verb-insect-3 = щёлкает

chat-speech-verb-name-moth = Мотылёк
chat-speech-verb-winged-1 = трепещет
chat-speech-verb-winged-2 = хлопает
chat-speech-verb-winged-3 = жужжит

chat-speech-verb-name-slime = Слайм
chat-speech-verb-slime-1 = хлюпает
chat-speech-verb-slime-2 = булькает
chat-speech-verb-slime-3 = сочится

chat-speech-verb-name-plant = Диона
chat-speech-verb-plant-1 = шелестит
chat-speech-verb-plant-2 = колышется
chat-speech-verb-plant-3 = скрипит

chat-speech-verb-name-robotic = Робот
chat-speech-verb-robotic-1 = констатирует
chat-speech-verb-robotic-2 = пищит
chat-speech-verb-robotic-3 = гудит
>>>>>>> Stashed changes

chat-speech-verb-name-reptilian = Рептилия
chat-speech-verb-reptilian-1 = шипит
chat-speech-verb-reptilian-2 = фыркает
chat-speech-verb-reptilian-3 = пыхтит

<<<<<<< Updated upstream
chat-speech-verb-name-skeleton = Скелет
chat-speech-verb-skeleton-1 = гремит
chat-speech-verb-skeleton-2 = клацает
chat-speech-verb-skeleton-3 = скрежещет

chat-speech-verb-name-vox = Вокс
chat-speech-verb-vox-1 = скрипит
chat-speech-verb-vox-2 = визжит
chat-speech-verb-vox-3 = каркает

chat-speech-verb-name-canine = Собака
chat-speech-verb-canine-1 = гавкает
chat-speech-verb-canine-2 = лает
=======
chat-speech-verb-name-skeleton = Скелет / Плазмамен
chat-speech-verb-skeleton-1 = гремит
chat-speech-verb-skeleton-2 = постукивает
chat-speech-verb-skeleton-3 = лязгает
chat-speech-verb-skeleton-4 = клацает
chat-speech-verb-skeleton-5 = трещит

chat-speech-verb-name-vox = Вокс
chat-speech-verb-vox-1 = визжит
chat-speech-verb-vox-2 = вопит
chat-speech-verb-vox-3 = каркает

chat-speech-verb-name-oni = Они
chat-speech-verb-oni-1 = ворчит
chat-speech-verb-oni-2 = ревёт
chat-speech-verb-oni-3 = гремит
chat-speech-verb-oni-4 = грохочет

chat-speech-verb-name-canine = Пёс
chat-speech-verb-canine-1 = лает
chat-speech-verb-canine-2 = гавкает
>>>>>>> Stashed changes
chat-speech-verb-canine-3 = воет

chat-speech-verb-name-goat = Коза
chat-speech-verb-goat-1 = блеет
chat-speech-verb-goat-2 = кряхтит
chat-speech-verb-goat-3 = кричит

chat-speech-verb-name-small-mob = Мышь
<<<<<<< Updated upstream
chat-speech-verb-small-mob-1 = скрипит
chat-speech-verb-small-mob-2 = пищит

chat-speech-verb-name-large-mob = Карп
chat-speech-verb-large-mob-1 = ревёт
chat-speech-verb-large-mob-2 = рычит

chat-speech-verb-name-monkey = Обезьяна
chat-speech-verb-monkey-1 = обезьяничает
chat-speech-verb-monkey-2 = визжит

chat-speech-verb-name-cluwne = Клувень

chat-speech-verb-name-parrot = Попугай
chat-speech-verb-parrot-1 = кричит
=======
chat-speech-verb-small-mob-1 = пищит
chat-speech-verb-small-mob-2 = попискивает

chat-speech-verb-name-large-mob = Карп
chat-speech-verb-large-mob-1 = рычит
chat-speech-verb-large-mob-2 = growls

chat-speech-verb-name-monkey = Обезьяна
chat-speech-verb-monkey-1 = ухает
chat-speech-verb-monkey-2 = визжит

chat-speech-verb-name-cluwne = Клувн

chat-speech-verb-name-parrot = Попугай
chat-speech-verb-parrot-1 = скрежещет
>>>>>>> Stashed changes
chat-speech-verb-parrot-2 = чирикает
chat-speech-verb-parrot-3 = щебечет

chat-speech-verb-cluwne-1 = хихикает
<<<<<<< Updated upstream
chat-speech-verb-cluwne-2 = хехекает
chat-speech-verb-cluwne-3 = смеётся

chat-speech-verb-name-ghost = Призрак
chat-speech-verb-ghost-1 = жалуется
chat-speech-verb-ghost-2 = дышит
chat-speech-verb-ghost-3 = воет
chat-speech-verb-ghost-4 = бормочет

chat-speech-verb-name-electricity = Электричество
chat-speech-verb-electricity-1 = трещит
chat-speech-verb-electricity-2 = гудит
chat-speech-verb-electricity-3 = скрипит

chat-speech-verb-name-wawa = Вава
chat-speech-verb-wawa-1 = произносит
chat-speech-verb-wawa-2 = заявляет
chat-speech-verb-wawa-3 = объявляет
chat-speech-verb-wawa-4 = размышляет
=======
chat-speech-verb-cluwne-2 = ржёт
chat-speech-verb-cluwne-3 = хохочет

chat-speech-verb-name-ghost = Призрак
chat-speech-verb-ghost-1 = жалуется
chat-speech-verb-ghost-2 = вздыхает
chat-speech-verb-ghost-3 = напевает
chat-speech-verb-ghost-4 = бормочет

chat-speech-verb-name-electricity = Электричество
chat-speech-verb-electricity-1 = потрескивает
chat-speech-verb-electricity-2 = жужжит
chat-speech-verb-electricity-3 = скрежещет

chat-speech-verb-marish = Марс
>>>>>>> Stashed changes
