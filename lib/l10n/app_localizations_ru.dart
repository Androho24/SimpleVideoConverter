// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get qualityLabel => 'Качество';

  @override
  String get quality2160pHigh => '2160p Высокое';

  @override
  String get quality2160pMedium => '2160p Среднее';

  @override
  String get quality2160pLow => '2160p Низкое';

  @override
  String get quality2160pVeryLow => '2160p Очень низкое';

  @override
  String get quality1440pHigh => '1440p Высокое';

  @override
  String get quality1440pMedium => '1440p Среднее';

  @override
  String get quality1440pLow => '1440p Низкое';

  @override
  String get quality1440pVeryLow => '1440p Очень низкое';

  @override
  String get quality1080pHigh => '1080p Высокое';

  @override
  String get quality1080pMedium => '1080p Среднее';

  @override
  String get quality1080pLow => '1080p Низкое';

  @override
  String get quality1080pVeryLow => '1080p Очень низкое';

  @override
  String get quality720pHigh => '720p Высокое';

  @override
  String get quality720pMedium => '720p Среднее';

  @override
  String get quality720pLow => '720p Низкое';

  @override
  String get quality720pVeryLow => '720p Очень низкое';

  @override
  String get quality480pHigh => '480p Высокое';

  @override
  String get quality480pMedium => '480p Среднее';

  @override
  String get quality480pLow => '480p Низкое';

  @override
  String get quality480pVeryLow => '480p Очень низкое';

  @override
  String get quality360pHigh => ' 360p Высокое';

  @override
  String get quality360pMedium => '360p Среднее';

  @override
  String get quality360pLow => '360p Низкое';

  @override
  String get quality360pVeryLow => '360p Очень низкое';

  @override
  String get mute => 'Отключить звук';

  @override
  String get ok => 'ОК';

  @override
  String get selectVideo => 'Выбрать видео';

  @override
  String get videoLoading => 'Загрузка видео…';

  @override
  String get modeNormal => 'Обычный';

  @override
  String get modeExpert => 'Экспертный';

  @override
  String get invalidVideoFile => 'Пожалуйста, выберите допустимый видеофайл.';

  @override
  String get fileLoadError =>
      'Не удалось загрузить файл. Пожалуйста, выберите видеофайл.';

  @override
  String get previewNotAvailable =>
      'Предварительный просмотр недоступен. Видео все равно можно конвертировать.';

  @override
  String get previewNotAvailableLabel =>
      'Предварительный просмотр недоступен\n(разрешение слишком высокое для этого устройства)';

  @override
  String get noVideoLoaded => 'Сначала загрузите видео.';

  @override
  String get cancelConversionTitle => 'Отменить конвертацию?';

  @override
  String get cancelConversionContent => 'Текущая обработка будет утеряна.';

  @override
  String get continueConversion => 'Продолжить';

  @override
  String get cancel => 'Отменить';

  @override
  String get discardVideoTitle => 'Отбросить видео?';

  @override
  String get discardVideoContent =>
      'Конвертированное видео будет удалено и не сохранится.';

  @override
  String get keep => 'Сохранить';

  @override
  String get discard => 'Отклонить';

  @override
  String get save => 'Сохранить';

  @override
  String get saveVideoDialogTitle => 'Сохранить видео';

  @override
  String get savedSuccess => 'Сохранено!';

  @override
  String get open => 'Открыть';

  @override
  String get openGallery => 'Открыть галерею';

  @override
  String get openVideo => 'Открыть видео';

  @override
  String get autoSaveTitle => 'Автосохранение видео в галерее';

  @override
  String get autoSaveSubtitle =>
      'Видео автоматически сохраняются после конвертации.';

  @override
  String get videoCodecTitle => 'Видеокодек';

  @override
  String get videoCodecSubtitle =>
      'Видеокодек для конвертации в обычном режиме';

  @override
  String get videoCodecInfoTitle => 'H.264 или H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 обеспечивает наилучшую совместимость и обычно более быструю конвертацию.\n\nH.265/HEVC позволяет создавать файлы меньшего размера при сопоставимом качестве изображения, но конвертация занимает больше времени. Старые устройства или приложения могут не воспроизвести результат.\n\nОба кодировщика включены в приложение и не зависят от кодеков, установленных на устройстве.';

  @override
  String get saveError =>
      'Ошибка при сохранении. Возможно, недостаточно места на диске.';

  @override
  String get saveErrorOutOfMemory =>
      'Не хватает памяти для сохранения этого файла. Попробуйте сократить длительность ролика или снизить качество.';

  @override
  String get conversionDone => 'Готово!';

  @override
  String conversionProgress(String percent) {
    return 'Конвертация: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Ошибка конвертации: $error';
  }

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get licensesTitle => 'Лицензии';

  @override
  String get licensesSubtitle =>
      'Лицензии с открытым исходным кодом этого приложения';

  @override
  String get gplLicenseTitle => 'Текст лицензии GPL-3.0';

  @override
  String get sourceCodeTitle => 'Исходный код (GitHub)';

  @override
  String get privacyPolicyTitle => 'Политика конфиденциальности';

  @override
  String get adConsentTitle => 'Настройки конфиденциальности';

  @override
  String get imprintTitle => 'Выходные данные';

  @override
  String get linkOpenError => 'Не удалось открыть ссылку.';

  @override
  String get muteTooltip => 'Объяснение функции отключения звука';

  @override
  String get muteInfoContent =>
      'Полностью удаляет звук из конвертированного видео.\n\nПолезно, например, для удаления фоновых шумов или уменьшения размера файла.';

  @override
  String estimatedSize(String size) {
    return 'Примерный размер: $size МБ';
  }

  @override
  String get convertButton => 'Конвертировать';

  @override
  String get crfLabel => 'Качество видео (CRF)';

  @override
  String get crfInfoTitle => 'CRF — качество видео';

  @override
  String get crfInfoContent =>
      '0 → без потерь (очень большой файл)\n18 → визуально практически без потерь\n23 → стандарт (хороший баланс)\n28 → заметное снижение качества\n51 → самое низкое качество\n\nРекомендация: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → без потерь (очень большой файл)\n25 → визуально практически без потерь\n30 → стандарт (хороший баланс)\n38 → заметное снижение качества\n63 → самое низкое качество\n\nРекомендация: 25–38\n\nVP9 и AV1 используют шкалу 0–63: то же число означает иное качество, чем у H.264/H.265.';

  @override
  String get resolutionLabel => 'Разрешение';

  @override
  String get resolutionInfoTitle => 'Распространенные разрешения';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nСовет: Оставьте одно поле пустым = другое будет рассчитано пропорционально.';

  @override
  String get widthLabel => 'Ширина';

  @override
  String get heightLabel => 'Высота';

  @override
  String get emptyEqualsOriginal => 'Пустое поле = исходное';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Кадры в секунду';

  @override
  String get fpsInfoContent =>
      'Orig → Сохранить FPS исходного видео\n24 → Киностандарт\n25 → Стандарт PAL/ТВ (Европа)\n30 → NTSC/ТВ, социальные сети\n60 → Плавная прокрутка, игры, спорт';

  @override
  String get audioBitrateLabel => 'Битрейт аудио';

  @override
  String get silent => 'Без звука';

  @override
  String get audioBitrateInfoContent =>
      'Без звука → нет аудио\n64 кбит/с → речь, подкасты\n96 кбит/с → хорошее качество речи\n128 кбит/с → стандартная музыка\n192 кбит/с → высокое качество аудио\n320 кбит/с → максимальное качество MP3';

  @override
  String get audioCodecLabel => 'Аудиокодек';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → лучшая совместимость и обычно более быстрое кодирование\nH.265 → меньшие файлы при сопоставимом качестве, более медленное кодирование\nVP9 → эффективный открытый кодек для WebM и MKV, более медленное программное кодирование\nAV1 → лучшее сжатие, только программное кодирование, экспериментальный\nXvid → устаревший кодек MPEG-4 для AVI и старых проигрывателей\n\nДоступные форматы вывода зависят от выбранных видео- и аудиокодеков.';

  @override
  String get xvidLegacyLabel => 'Xvid (устаревший)';

  @override
  String get av1SlowHint =>
      'AV1 кодируется только программно и работает значительно медленнее, чем H.264/H.265.';

  @override
  String get av1HighResHint => 'Выше 720p стоит сначала уменьшить разрешение.';

  @override
  String get av1ExperimentalTitle => 'AV1 (экспериментальный)';

  @override
  String get av1ExperimentalSubtitle =>
      'Добавляет AV1 в выбор кодеков в обычном и экспертном режимах. Современный высокоэффективный кодек, который ещё не полностью протестирован.';

  @override
  String get audioCodecInfoContent =>
      'AAC → стандарт для MP4, лучшая совместимость\nMP3 → широко используемый устаревший кодек\nOpus → современный и эффективный, идеален для WebM и MKV\nAC3 → Dolby Digital, только для источников с объёмным звуком (≥ 3 каналов)\nVorbis → открытый кодек для WebM и MKV\n\nНесовместимые форматы вывода отключаются автоматически.';

  @override
  String get outputFormatLabel => 'Формат вывода';

  @override
  String get outputFormatInfoContent =>
      'MP4 → универсальный, лучшая совместимость\nMKV → гибкий контейнер для всех предлагаемых кодеков\nMOV → рабочие процессы Apple/QuickTime\nAVI → устаревший формат с Xvid\nMPEG-TS → транспортный поток для ТВ и стриминга\nWebM → современный веб-формат с VP9 и Opus или Vorbis\n\nНесовместимые форматы отображаются приглушёнными. При выборе автоматически устанавливается видеокодек по умолчанию и, при необходимости, совместимый аудиокодек.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec поддерживают: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Формат вывода изменён на $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Что означают разрешения?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → очень маленький файл,\n например, для WhatsApp\n\n480p (854×480) → стандартное разрешение (SD)\n\n720p (1280×720) → HD, подходит для мобильных устройств\n\n1080p (1920×1080) → Full HD, стандарт для\n YouTube и ТВ\n\nВысокое/Среднее/Низкое описывает качество при одинаковом разрешении — выше = файл больше.';

  @override
  String get resolutionTooltip => 'Объяснение разрешений';

  @override
  String get trimArea => 'Область обрезки';

  @override
  String trimStartLabel(String time) {
    return 'Начало: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Конец: $time';
  }

  @override
  String get adLoading => 'Загрузка рекламы…';

  @override
  String get convertedPrefix => 'конвертировано_';

  @override
  String get removeAdsTitle => 'Удалить рекламу';

  @override
  String removeAdsSubtitle(String price) {
    return 'Одноразовая покупка – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Без рекламы ✓';

  @override
  String get removeAdsActiveSubtitle => 'Спасибо за поддержку!';

  @override
  String get restorePurchasesTitle => 'Восстановить покупку';

  @override
  String get purchaseButton => 'Купить';

  @override
  String get purchaseError =>
      'Покупка не удалась. Пожалуйста, попробуйте еще раз.';

  @override
  String get purchaseSuccess => 'Спасибо! Реклама отключена.';

  @override
  String get appName => 'Видео конвертер';

  @override
  String get audioOnly => 'Только аудио';

  @override
  String get audioOnlyTooltip => 'Объяснение режима Только аудио';

  @override
  String get audioOnlyInfoContent =>
      'Извлекает из видео только аудиодорожку — без изображения.\n\nОбычный режим: MP3 с битрейтом 192 кбит/с.\nРежим Эксперт: кодек и битрейт из настроек аудио.\n\nПолезно, например, для сохранения музыки или подкастов из видео.';

  @override
  String get aspectLocked => 'Соотношение сторон заблокировано';

  @override
  String get aspectUnlocked => 'Соотношение сторон свободно';

  @override
  String get cpuWarningTitle => 'Большой файл';

  @override
  String get cpuWarningContent =>
      'Длительность этого видео превышает 5 минут. На старых устройствах конвертация может привести к высокой загрузке процессора — это нормально.\n\nВы можете просто положить телефон рядом, приложение продолжит работать в фоновом режиме.';

  @override
  String get cpuWarningCheckbox => 'Больше не показывать';

  @override
  String get storageWarningTitle => 'Недостаточно места';

  @override
  String storageWarningContent(String available, String required) {
    return 'На вашем устройстве осталось всего $available МБ свободного места. Для конвертации требуется около $required МБ. Пожалуйста, сначала освободите место.';
  }

  @override
  String get feedbackTitle => 'Отзывы и поддержка';

  @override
  String get feedbackSubtitle =>
      'Отправлять ошибки, предложения по улучшению или отзывы';

  @override
  String get feedbackCategoryLabel => 'Категория';

  @override
  String get feedbackCategoryBug => 'Сообщить об ошибке';

  @override
  String get feedbackCategoryFeature => 'Предложение по улучшению';

  @override
  String get feedbackCategoryFeedback => 'Общие отзывы';

  @override
  String get feedbackMessageHint => 'Опиши свою проблему…';

  @override
  String get feedbackSendButton => 'Отправить';

  @override
  String get notificationPermissionTitle => 'Конвертация в фоновом режиме';

  @override
  String get notificationPermissionContent =>
      'Разрешите уведомления, чтобы конвертация продолжалась, пока вы используете другие приложения. Без этого разрешения приложение должно оставаться открытым.';

  @override
  String get notificationPermissionNotNow => 'Не сейчас';

  @override
  String get notificationPermissionAllow => 'Разрешить';

  @override
  String get notificationPermissionDenied =>
      'Включите уведомления в настройках конвертации в фоновом режиме.';

  @override
  String get notificationPermissionOpenSettings => 'Настройки';

  @override
  String get backButton => 'Назад';

  @override
  String get appSettingsTitle => 'Настройки приложения';

  @override
  String get appSettingsSubtitle =>
      'Настройки автосохранения и конфиденциальности';

  @override
  String get openSourceTitle => 'Открытый исходный код';

  @override
  String get openSourceSubtitle => 'Лицензии и исходный код';

  @override
  String get openSourceLicensesTitle => 'Лицензии на открытый исходный код';

  @override
  String get legalSectionTitle => 'Юридическая информация';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Режим кодирования';

  @override
  String get encodingModeCrf => 'Качество (CRF)';

  @override
  String get encodingModeBitrate => 'Битрейт';

  @override
  String get audioChannelsLabel => 'Аудиоканалы';

  @override
  String get audioChannelsInfoContent =>
      'Оригинал → сохранить расположение каналов источника\nСтерео → 2.0 (даунмикс при необходимости)\nМоно → 1 канал (наименьший размер файла)\n5.1 → 6-канальный объемный звук (только для объемных источников)\n\nДаунмиксинг (например, 5.1 → Стерео) поддерживается. Апмиксинг не предлагается.';

  @override
  String get audioChannelOriginal => 'Исходный';

  @override
  String get targetBitrateLabel => 'Целевой битрейт';

  @override
  String get targetBitrateInfoTitle => 'Целевой битрейт';

  @override
  String get targetBitrateInfoContent =>
      '500 кбит/с–2 Мбит/с → сильное сжатие, для мессенджеров\n4–8 Мбит/с → нормальное/хорошее качество в 1080p\n12 Мбит/с → высокое качество в 1080p / низкое в 4K\n20 Мбит/с → качество потокового видео в 4K\n\nСвоё значение: через значок карандаша (500–100000 кбит/с)\n\nВ отличие от CRF, качество может варьироваться между сценами. Используйте CRF для получения лучших результатов при том же размере файла.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 и AV1 достигают того же качества примерно при вдвое меньшем битрейте.';

  @override
  String get rateAppTitle => 'Оценить приложение';

  @override
  String get proHintTitle => 'Использовать без рекламы';

  @override
  String get proHintBody =>
      'Оплатив приложение один раз, вы навсегда избавитесь от рекламы.';

  @override
  String get proHintLater => 'Позже';

  @override
  String get restoreError =>
      'Не удалось восстановить покупки. В настоящее время Play Store недоступен — попробуйте позже.';

  @override
  String get restoreNoPurchases => 'Предыдущие покупки не найдены.';

  @override
  String get hdrCodecSwitched =>
      'Обнаружено HDR-видео — для него будет использован H.265, чтобы сохранить цвета.';

  @override
  String get themeTitle => 'Оформление';

  @override
  String get themeSubtitle =>
      'Следовать настройке системы или выбрать светлую/тёмную тему';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get targetBitrateEditTooltip => 'Ввести битрейт';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Допустимый диапазон: $range';
  }

  @override
  String get hwEncoderTitle => 'Аппаратный кодировщик (быстро)';

  @override
  String get hwEncoderSubtitle =>
      'Намного быстрее, но для того же качества нужен примерно вдвое больший битрейт. Только в режиме битрейта.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-видео — будет преобразовано программным кодировщиком, чтобы сохранить HDR.';

  @override
  String get hwEncoderFallback =>
      'Сбой аппаратного кодировщика — преобразование программным кодировщиком.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Аппаратный кодировщик не поддерживает $format — этот формат будет преобразован программным кодировщиком.';
  }
}
