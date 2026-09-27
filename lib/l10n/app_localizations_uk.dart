// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get qualityLabel => 'Якість';

  @override
  String get quality2160pHigh => '2160p, висока якість';

  @override
  String get quality2160pMedium => '2160p, середня якість';

  @override
  String get quality2160pLow => '2160p, низька якість';

  @override
  String get quality2160pVeryLow => '2160p — дуже низька якість';

  @override
  String get quality1440pHigh => '1440p, висока якість';

  @override
  String get quality1440pMedium => '1440p, середня якість';

  @override
  String get quality1440pLow => '1440p, низька якість';

  @override
  String get quality1440pVeryLow => '1440p — дуже низька якість';

  @override
  String get quality1080pHigh => '1080p, висока якість';

  @override
  String get quality1080pMedium => '1080p, середня якість';

  @override
  String get quality1080pLow => '1080p, низька якість';

  @override
  String get quality1080pVeryLow => '1080p, дуже низька якість';

  @override
  String get quality720pHigh => '720p, висока якість';

  @override
  String get quality720pMedium => '720p, середня якість';

  @override
  String get quality720pLow => '720p, низька якість';

  @override
  String get quality720pVeryLow => '720p — дуже низька якість';

  @override
  String get quality480pHigh => '480p, висока якість';

  @override
  String get quality480pMedium => '480p, середня якість';

  @override
  String get quality480pLow => '480p, низька якість';

  @override
  String get quality480pVeryLow => '480p — дуже низька якість';

  @override
  String get quality360pHigh => '360p, висока якість';

  @override
  String get quality360pMedium => '360p, середня якість';

  @override
  String get quality360pLow => '360p, низька якість';

  @override
  String get quality360pVeryLow => '360p — дуже низька якість';

  @override
  String get mute => 'Вимкнути звук';

  @override
  String get ok => 'Гаразд';

  @override
  String get selectVideo => 'Вибрати відео';

  @override
  String get videoLoading => 'Відео завантажується…';

  @override
  String get modeNormal => 'Звичайний';

  @override
  String get modeExpert => 'Експерт';

  @override
  String get invalidVideoFile => 'Будь ласка, виберіть дійсний відеофайл.';

  @override
  String get fileLoadError =>
      'Файл не вдалося завантажити. Будь ласка, виберіть відеофайл.';

  @override
  String get previewNotAvailable =>
      'Попередній перегляд недоступний. Проте відео можна конвертувати.';

  @override
  String get previewNotAvailableLabel =>
      'Попередній перегляд недоступний\n(роздільна здатність занадто висока для цього пристрою)';

  @override
  String get noVideoLoaded => 'Будь ласка, спочатку завантажте відео.';

  @override
  String get cancelConversionTitle => 'Скасувати конвертацію?';

  @override
  String get cancelConversionContent =>
      'Попередні дані обробки будуть втрачені.';

  @override
  String get continueConversion => 'Продовжити';

  @override
  String get cancel => 'Скасувати';

  @override
  String get discardVideoTitle => 'Видалити відео?';

  @override
  String get discardVideoContent =>
      'Конвертоване відео видаляється і не зберігається.';

  @override
  String get keep => 'Залишити';

  @override
  String get discard => 'Відкинути';

  @override
  String get save => 'Зберегти';

  @override
  String get saveVideoDialogTitle => 'Зберегти відео';

  @override
  String get savedSuccess => 'Збережено!';

  @override
  String get open => 'Відкрити';

  @override
  String get openGallery => 'Відкрити галерею';

  @override
  String get openVideo => 'Відкрити відео';

  @override
  String get autoSaveTitle => 'Автоматично зберігати відео в галереї';

  @override
  String get autoSaveSubtitle =>
      'Після конвертації відео автоматично зберігаються.';

  @override
  String get videoCodecTitle => 'Відеокодек';

  @override
  String get videoCodecSubtitle =>
      'Відеокодек для конвертації у звичайному режимі';

  @override
  String get videoCodecInfoTitle => 'H.264 чи H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 забезпечує найкращу сумісність і зазвичай швидше конвертування.\n\nH.265/HEVC може створювати менші файли за порівнянної якості зображення, але конвертування триває довше. Старіші пристрої або застосунки можуть не відтворити результат.\n\nОбидва кодери включені в застосунок і не залежать від кодеків, установлених на пристрої.';

  @override
  String get saveError =>
      'Помилка під час збереження. Можливо, недостатньо місця на диску.';

  @override
  String get saveErrorOutOfMemory =>
      'Недостатньо оперативної пам\'яті для збереження. Спробуй коротший кліп або нижчу якість.';

  @override
  String get conversionDone => 'Готово!';

  @override
  String conversionProgress(String percent) {
    return 'Конвертація: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Конвертація не вдалася: $error';
  }

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get licensesTitle => 'Ліцензії';

  @override
  String get licensesSubtitle => 'Ліцензії з відкритим кодом цього додатка';

  @override
  String get gplLicenseTitle => 'Текст ліцензії GPL-3.0';

  @override
  String get sourceCodeTitle => 'Вихідний код (GitHub)';

  @override
  String get privacyPolicyTitle => 'Політика конфіденційності';

  @override
  String get adConsentTitle => 'Налаштування конфіденційності';

  @override
  String get imprintTitle => 'Вихідні дані';

  @override
  String get linkOpenError => 'Посилання не вдалося відкрити.';

  @override
  String get muteTooltip => 'Як вимкнути звук';

  @override
  String get muteInfoContent =>
      'Повністю видаляє звук із конвертованого відео.\n\nЦе корисно, наприклад, для видалення фонових шумів або зменшення розміру файлу.';

  @override
  String estimatedSize(String size) {
    return 'Приблизний розмір: $size МБ';
  }

  @override
  String get convertButton => 'Конвертувати';

  @override
  String get crfLabel => 'Якість відео (CRF)';

  @override
  String get crfInfoTitle => 'CRF — якість відео';

  @override
  String get crfInfoContent =>
      '0 → без втрат (дуже великий файл)\n18 → візуально майже без втрат\n23 → стандарт (хороший баланс)\n28 → помітне погіршення якості\n51 → найнижча якість\n\nРекомендація: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → без втрат (дуже великий файл)\n25 → візуально майже без втрат\n30 → стандарт (хороший баланс)\n38 → помітне погіршення якості\n63 → найнижча якість\n\nРекомендація: 25–38\n\nVP9 і AV1 використовують шкалу 0–63: те саме число означає іншу якість, ніж у H.264/H.265.';

  @override
  String get resolutionLabel => 'Роздільна здатність';

  @override
  String get resolutionInfoTitle => 'Поширені роздільні здатності';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nПорада: залиште одне поле порожнім — інше буде обчислено пропорційно.';

  @override
  String get widthLabel => 'Ширина';

  @override
  String get heightLabel => 'Висота';

  @override
  String get emptyEqualsOriginal => 'Порожньо = оригінал';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Кадрів на секунду';

  @override
  String get fpsInfoContent =>
      'Orig  → Зберегти FPS вихідного відео\n24    → Кіностандарт\n25    → Стандарт PAL/ТВ (Європа)\n30    → NTSC/ТВ, соцмережі\n60    → Плавне відтворення, ігри, спорт';

  @override
  String get audioBitrateLabel => 'Бітрейт аудіо';

  @override
  String get silent => 'Без звуку';

  @override
  String get audioBitrateInfoContent =>
      'Без звуку    → без аудіо\n64 кбіт/с  → мова, подкасти\n96 кбіт/с  → хороша якість мови\n128 кбіт/с → стандартна музика\n192 кбіт/с → висока якість аудіо\n320 кбіт/с → максимальна якість MP3';

  @override
  String get audioCodecLabel => 'Аудіокодек';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → найкраща сумісність і зазвичай швидше кодування\nH.265 → менші файли за порівнянної якості, повільніше кодування\nVP9 → ефективний відкритий кодек для WebM і MKV, повільніше програмне кодування\nAV1 → найкраще стиснення, лише програмне кодування, експериментальний\nXvid → застарілий кодек MPEG-4 для AVI і старих програвачів\n\nДоступні формати виводу залежать від вибраних відео- й аудіокодеків.';

  @override
  String get xvidLegacyLabel => 'Xvid (застарілий)';

  @override
  String get av1SlowHint =>
      'AV1 кодується лише програмно й помітно повільніший за H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Понад 720p варто спершу зменшити роздільну здатність.';

  @override
  String get av1ExperimentalTitle => 'AV1 (експериментальний)';

  @override
  String get av1ExperimentalSubtitle =>
      'Додає AV1 до вибору кодеків у звичайному та експертному режимах. Сучасний високоефективний кодек, який ще не повністю протестовано.';

  @override
  String get audioCodecInfoContent =>
      'AAC → стандарт для MP4, найкраща сумісність\nMP3 → поширений застарілий кодек\nOpus → сучасний та ефективний, ідеальний для WebM і MKV\nAC3 → Dolby Digital, лише для джерел з об’ємним звуком (≥ 3 канали)\nVorbis → відкритий кодек для WebM і MKV\n\nНесумісні формати виводу автоматично вимикаються.';

  @override
  String get outputFormatLabel => 'Формат виводу';

  @override
  String get outputFormatInfoContent =>
      'MP4 → універсальний, найкраща сумісність\nMKV → гнучкий контейнер для всіх запропонованих кодеків\nMOV → робочі процеси Apple/QuickTime\nAVI → застарілий формат із Xvid\nMPEG-TS → транспортний потік для ТБ і стрімінгу\nWebM → сучасний вебформат із VP9 та Opus або Vorbis\n\nНесумісні формати відображаються притлушеними. Після вибору автоматично встановлюється відеокодек за замовчуванням і, за потреби, сумісний аудіокодек.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec підтримують: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Формат виводу змінено на $format.';
  }

  @override
  String get orig => 'Оригінал';

  @override
  String get resolutionExplainTitle => 'Що означають ці роздільні здатності?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → дуже невеликий файл,\nнаприклад, для WhatsApp\n\n480p  (854×480)   → стандартна роздільна здатність (SD)\n\n720p  (1280×720)  → HD, добре підходить для мобільних пристроїв\n\n1080p (1920×1080) → Full HD, стандарт для\n                          YouTube та телебачення\n\n«Висока/Середня/Низька» описує якість при однаковій роздільній здатності — чим вища якість, тим більший файл.';

  @override
  String get resolutionTooltip => 'Пояснення до роздільної здатності';

  @override
  String get trimArea => 'Діапазон обрізання';

  @override
  String trimStartLabel(String time) {
    return 'Початок: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Кінець: $time';
  }

  @override
  String get adLoading => 'Завантажується реклама…';

  @override
  String get convertedPrefix => 'конвертовано_';

  @override
  String get removeAdsTitle => 'Видалити рекламу';

  @override
  String removeAdsSubtitle(String price) {
    return 'Одноразова покупка — $price';
  }

  @override
  String get removeAdsActiveTitle => 'Без реклами ✓';

  @override
  String get removeAdsActiveSubtitle => 'Дякую за твою підтримку!';

  @override
  String get restorePurchasesTitle => 'Відновити покупку';

  @override
  String get purchaseButton => 'Купити';

  @override
  String get purchaseError => 'Покупка не вдалася. Спробуйте ще раз.';

  @override
  String get purchaseSuccess => 'Дякую! Реклама вимкнена.';

  @override
  String get appName => 'Відеоконвертер';

  @override
  String get audioOnly => 'Тільки аудіо';

  @override
  String get audioOnlyTooltip => 'Пояснення режиму лише аудіо';

  @override
  String get audioOnlyInfoContent =>
      'Витягує лише аудіодоріжку з відео — без зображення.\n\nЗвичайний режим: MP3 з бітрейтом 192 кбіт/с.\nЕкспертний режим: кодек і бітрейт з налаштувань аудіо.\n\nКорисно, наприклад, для збереження музики або подкастів із відео.';

  @override
  String get aspectLocked => 'Співвідношення сторін заблоковано';

  @override
  String get aspectUnlocked => 'Співвідношення сторін розблоковано';

  @override
  String get cpuWarningTitle => 'Великий файл';

  @override
  String get cpuWarningContent =>
      'Тривалість цього відео перевищує 5 хвилин. На старих пристроях конвертація може спричинити значне навантаження на процесор — це нормально. \n \n Ти можеш просто покласти телефон поруч — додаток продовжить працювати у фоновому режимі.';

  @override
  String get cpuWarningCheckbox => 'Більше не показувати';

  @override
  String get storageWarningTitle => 'Недостатньо місця на диску';

  @override
  String storageWarningContent(String available, String required) {
    return 'На твоєму пристрої залишилося лише $available МБ вільного місця. Для конвертації знадобиться приблизно $required МБ. Спочатку, будь ласка, звільни місце на диску.';
  }

  @override
  String get feedbackTitle => 'Відгуки та підтримка';

  @override
  String get feedbackSubtitle =>
      'Надіслати повідомлення про помилки, пропозиції щодо вдосконалення або відгуки';

  @override
  String get feedbackCategoryLabel => 'Категорія';

  @override
  String get feedbackCategoryBug => 'Повідомити про помилку';

  @override
  String get feedbackCategoryFeature => 'Пропозиція щодо вдосконалення';

  @override
  String get feedbackCategoryFeedback => 'Загальні відгуки';

  @override
  String get feedbackMessageHint => 'Опишіть свою проблему…';

  @override
  String get feedbackSendButton => 'Надіслати';

  @override
  String get notificationPermissionTitle => 'Фонова конвертація';

  @override
  String get notificationPermissionContent =>
      'Увімкніть сповіщення, щоб конвертація могла продовжуватися, поки ви користуєтеся іншими програмами. Без цього дозволу програма має залишатися відкритою.';

  @override
  String get notificationPermissionNotNow => 'Не зараз';

  @override
  String get notificationPermissionAllow => 'Дозволити';

  @override
  String get notificationPermissionDenied =>
      'Увімкніть сповіщення в налаштуваннях, щоб конвертувати у фоновому режимі.';

  @override
  String get notificationPermissionOpenSettings => 'Налаштування';

  @override
  String get backButton => 'Назад';

  @override
  String get appSettingsTitle => 'Налаштування додатка';

  @override
  String get appSettingsSubtitle => 'Автозбереження та конфіденційність';

  @override
  String get openSourceTitle => 'Відкрите програмне забезпечення';

  @override
  String get openSourceSubtitle => 'Ліцензії та вихідний код';

  @override
  String get openSourceLicensesTitle => 'Ліцензії з відкритим кодом';

  @override
  String get legalSectionTitle => 'Юридична інформація';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Режим кодування';

  @override
  String get encodingModeCrf => 'Якість (CRF)';

  @override
  String get encodingModeBitrate => 'Бітрейт';

  @override
  String get audioChannelsLabel => 'Аудіоканали';

  @override
  String get audioChannelsInfoContent =>
      'Оригінал → зберегти схему каналів джерела\nСтерео → 2.0 (даунмікс, якщо потрібно)\nМоно → 1 канал (найменший файл)\n5.1 → 6-канальний об\'ємний звук (лише для джерел з об\'ємним звуком)\n\nПідтримується даунміксинг (наприклад, 5.1 → стерео). Апміксинг не підтримується.';

  @override
  String get audioChannelOriginal => 'Оригінал';

  @override
  String get targetBitrateLabel => 'Цільовий бітрейт';

  @override
  String get targetBitrateInfoTitle => 'Цільовий бітрейт';

  @override
  String get targetBitrateInfoContent =>
      '500 кбіт/с–2 Мбіт/с → сильне стиснення, для месенджерів\n4–8 Мбіт/с → нормальна/хороша якість у 1080p\n12 Мбіт/с → висока якість у 1080p / низька у 4K\n20 Мбіт/с → якість потокового відео у 4K\n\nВласне значення: через значок олівця (500–100000 кбіт/с)\n\nНа відміну від CRF, якість може варіюватися залежно від сцени. Для кращих результатів при однаковому розмірі файлу використовуйте CRF.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 і AV1 досягають тієї самої якості приблизно за вдвічі нижчого бітрейту.';

  @override
  String get rateAppTitle => 'Оцініть додаток';

  @override
  String get proHintTitle => 'Користуватися без реклами';

  @override
  String get proHintBody =>
      'Позбудьтеся реклами назавжди, зробивши одноразову покупку. Щиро дякуємо за вашу підтримку.';

  @override
  String get proHintLater => 'Пізніше';

  @override
  String get restoreError =>
      'Покупки не вдалося відновити. Наразі Play Store недоступний — спробуйте ще раз.';

  @override
  String get restoreNoPurchases => 'Попередні покупки не знайдено.';

  @override
  String get hdrCodecSwitched =>
      'Виявлено HDR-відео — для нього буде використано H.265, щоб зберегти кольори.';

  @override
  String get themeTitle => 'Оформлення';

  @override
  String get themeSubtitle =>
      'Дотримуватися системних налаштувань або вибрати світлу/темну тему';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get targetBitrateEditTooltip => 'Ввести бітрейт';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Допустимий діапазон: $range';
  }

  @override
  String get hwEncoderTitle => 'Апаратний кодувальник (швидко)';

  @override
  String get hwEncoderSubtitle =>
      'Набагато швидше, але для тієї ж якості потрібен приблизно вдвічі більший бітрейт. Лише в режимі бітрейту.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-відео — буде конвертовано програмним кодувальником, щоб зберегти HDR.';

  @override
  String get hwEncoderFallback =>
      'Збій апаратного кодувальника — конвертування програмним кодувальником.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Апаратний кодувальник не підтримує $format — цей формат буде конвертовано програмним кодувальником.';
  }
}
