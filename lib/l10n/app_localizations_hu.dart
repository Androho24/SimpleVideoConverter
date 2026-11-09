// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get qualityLabel => 'Minőség';

  @override
  String get quality2160pHigh => '2160p Magas';

  @override
  String get quality2160pMedium => '2160p Közepes';

  @override
  String get quality2160pLow => '2160p Alacsony';

  @override
  String get quality2160pVeryLow => '2160p Nagyon alacsony';

  @override
  String get quality1440pHigh => '1440p Magas';

  @override
  String get quality1440pMedium => '1440p Közepes';

  @override
  String get quality1440pLow => '1440p Alacsony';

  @override
  String get quality1440pVeryLow => '1440p Nagyon alacsony';

  @override
  String get quality1080pHigh => '1080p Magas';

  @override
  String get quality1080pMedium => '1080p Közepes';

  @override
  String get quality1080pLow => '1080p Alacsony';

  @override
  String get quality1080pVeryLow => '1080p Nagyon alacsony';

  @override
  String get quality720pHigh => '720p Magas';

  @override
  String get quality720pMedium => '720p Közepes';

  @override
  String get quality720pLow => '720p Alacsony';

  @override
  String get quality720pVeryLow => '720p Nagyon alacsony';

  @override
  String get quality480pHigh => '480p Magas';

  @override
  String get quality480pMedium => '480p Közepes';

  @override
  String get quality480pLow => '480p Alacsony';

  @override
  String get quality480pVeryLow => '480p Nagyon alacsony';

  @override
  String get quality360pHigh => '360p Magas';

  @override
  String get quality360pMedium => '360p Közepes';

  @override
  String get quality360pLow => '360p Alacsony';

  @override
  String get quality360pVeryLow => '360p Nagyon alacsony';

  @override
  String get mute => 'Némítás';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Videó kiválasztása';

  @override
  String get videoLoading => 'Videó betöltése…';

  @override
  String get modeNormal => 'Normál';

  @override
  String get modeExpert => 'Szakértői';

  @override
  String get invalidVideoFile => 'Válassz érvényes videófájlt.';

  @override
  String get fileLoadError =>
      'Nem sikerült betölteni a fájlt. Válassz egy videófájlt.';

  @override
  String get previewNotAvailable =>
      'Az előnézet nem érhető el. A videó ettől még átalakítható.';

  @override
  String get previewNotAvailableLabel =>
      'Az előnézet nem érhető el\n(A felbontás túl nagy ehhez a készülékhez)';

  @override
  String get noVideoLoaded => 'Előbb tölts be egy videót.';

  @override
  String get cancelConversionTitle => 'Megszakítod az átalakítást?';

  @override
  String get cancelConversionContent =>
      'Az átalakítás eddigi eredménye elvész.';

  @override
  String get continueConversion => 'Folytatás';

  @override
  String get cancel => 'Mégse';

  @override
  String get discardVideoTitle => 'Elveted a videót?';

  @override
  String get discardVideoContent =>
      'Az átalakított videó mentés nélkül törlődik.';

  @override
  String get keep => 'Megtartás';

  @override
  String get discard => 'Elvetés';

  @override
  String get save => 'Mentés';

  @override
  String get saveVideoDialogTitle => 'Videó mentése';

  @override
  String get savedSuccess => 'Mentve!';

  @override
  String get open => 'Megnyitás';

  @override
  String get openGallery => 'Galéria megnyitása';

  @override
  String get openVideo => 'Videó megnyitása';

  @override
  String get autoSaveTitle => 'Videók automatikus mentése a galériába';

  @override
  String get autoSaveSubtitle =>
      'Az alkalmazás az átalakítás után automatikusan menti a videókat.';

  @override
  String get videoCodecTitle => 'Videokodek';

  @override
  String get videoCodecSubtitle =>
      'Videokodek a normál módban végzett átalakításokhoz';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC vagy AV1?';

  @override
  String get videoCodecInfoContent =>
      'A H.264 biztosítja a legjobb kompatibilitást, és általában gyorsabb az átalakítás.\n\nA H.265/HEVC hasonló képminőség mellett kisebb fájlokat eredményezhet, de az átalakítás tovább tart. Előfordulhat, hogy a régebbi készülékek vagy alkalmazások nem tudják lejátszani az eredményt.\n\nAz AV1 egy modern, kis fájlmérethez tervezett kodek. A régebbi készülékek és alkalmazások gyakran nem tudják lejátszani az eredményt.\n\nAz alkalmazás minden kódolót tartalmaz, így nem függ a készülékre telepített kodekektől.';

  @override
  String get saveError =>
      'Hiba történt a mentéskor. Lehet, hogy nincs elég tárhely.';

  @override
  String get saveErrorOutOfMemory =>
      'Nincs elég memória a fájl mentéséhez. Próbálkozz rövidebb részlettel vagy alacsonyabb minőséggel.';

  @override
  String get conversionDone => 'Kész!';

  @override
  String conversionProgress(String percent) {
    return 'Átalakítás: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Az átalakítás sikertelen: $error';
  }

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get licensesTitle => 'Licencek';

  @override
  String get licensesSubtitle => 'Az alkalmazás nyílt forráskódú licencei';

  @override
  String get gplLicenseTitle => 'A GPL-3.0 licenc szövege';

  @override
  String get sourceCodeTitle => 'Forráskód (GitHub)';

  @override
  String get privacyPolicyTitle => 'Adatvédelmi tájékoztató';

  @override
  String get adConsentTitle => 'Adatvédelmi beállítások';

  @override
  String get imprintTitle => 'Impresszum';

  @override
  String get linkOpenError => 'Nem sikerült megnyitni a hivatkozást.';

  @override
  String get muteTooltip => 'Tudnivalók a némításról';

  @override
  String get muteInfoContent =>
      'Teljesen eltávolítja a hangot az átalakított videóból.\n\nHasznos például a háttérzaj eltávolításához vagy a fájlméret csökkentéséhez.';

  @override
  String estimatedSize(String size) {
    return 'Becsült méret: $size MB';
  }

  @override
  String get convertButton => 'Átalakítás';

  @override
  String get crfLabel => 'Videóminőség (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Videóminőség';

  @override
  String get crfInfoContent =>
      '0 → veszteségmentes (nagyon nagy fájl)\n18 → szemre szinte veszteségmentes\n23 → szokásos (jó egyensúly)\n28 → látható minőségromlás\n51 → legalacsonyabb minőség\n\nAjánlott: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → veszteségmentes (nagyon nagy fájl)\n25 → szemre szinte veszteségmentes\n30 → szokásos (jó egyensúly)\n38 → látható minőségromlás\n63 → legalacsonyabb minőség\n\nAjánlott: 25–38\n\nA VP9 és az AV1 0–63 közötti skálát használ: ugyanaz az érték más minőséget jelent, mint a H.264/H.265 esetén.';

  @override
  String get resolutionLabel => 'Felbontás';

  @override
  String get resolutionInfoTitle => 'Gyakori felbontások';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTipp: Hagyd üresen az egyik mezőt = a másik értékét arányosan kiszámítjuk.';

  @override
  String get widthLabel => 'Szélesség';

  @override
  String get heightLabel => 'Magasság';

  @override
  String get emptyEqualsOriginal => 'Üres = Eredeti';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Képkockák másodpercenként';

  @override
  String get fpsInfoContent =>
      'Eredeti  → A forrásvideó FPS-értékének megtartása\n24    → Moziszabvány\n25    → PAL/TV-szabvány (Európa)\n30    → NTSC/TV, közösségi média\n60    → Folyamatos mozgás, játékok, sport';

  @override
  String get audioBitrateLabel => 'Hangbitráta';

  @override
  String get silent => 'Néma';

  @override
  String get audioBitrateInfoContent =>
      'Néma   → nincs hang\n64 kbps  → beszéd, podcastok\n96 kbps  → jó beszédminőség\n128 kbps → szokásos zenei minőség\n192 kbps → magas hangminőség\n320 kbps → maximális MP3-minőség';

  @override
  String get audioCodecLabel => 'Hangkodek';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → legjobb kompatibilitás és általában gyorsabb kódolás\nH.265 → kisebb fájlok hasonló minőség mellett, lassabb kódolás\nVP9 → hatékony, nyílt kodek WebM és MKV formátumhoz, lassabb szoftveres kódolás\nAV1 → modern kodek kis fájlokhoz, kizárólag szoftveres kódolás\nXvid → régi MPEG-4 kodek AVI formátumhoz és régebbi lejátszókhoz\n\nAz alábbi kimeneti formátumok a kiválasztott video- és hangkodeknek megfelelően érhetők el.';

  @override
  String get xvidLegacyLabel => 'Xvid (régi)';

  @override
  String get av1SlowHint =>
      'Az AV1 kizárólag szoftveres kódolást használ, és sokkal lassabb, mint a H.264/H.265.';

  @override
  String get av1HighResHint =>
      '720p feletti felbontásnál érdemes előbb csökkenteni a felbontást.';

  @override
  String get audioCodecInfoContent =>
      'AAC → szokásos választás MP4-hez, legjobb kompatibilitás\nMP3 → széles körben használt régi kodek\nOpus → modern és hatékony, ideális WebM és MKV formátumhoz\nAC3 → Dolby Digital, csak térhatású hangforrásnál jelenik meg (≥ 3 csatorna)\nVorbis → nyílt kodek WebM és MKV formátumhoz\n\nA nem kompatibilis kimeneti formátumok automatikusan letiltásra kerülnek.';

  @override
  String get outputFormatLabel => 'Kimeneti formátum';

  @override
  String get outputFormatInfoContent =>
      'MP4 → általánosan használható, legjobb kompatibilitás\nMKV → rugalmas konténer az összes kínált kodekhez\nMOV → Apple/QuickTime-munkafolyamatokhoz\nAVI → régi formátum Xvid használatával\nMPEG-TS → adatfolyam tévéadáshoz és streameléshez\nWebM → modern webes formátum VP9 és Opus vagy Vorbis használatával\n\nA nem kompatibilis formátumok halványítva jelennek meg. Ha kiválasztasz egyet, automatikusan annak alapértelmezett videokodekje és szükség esetén egy kompatibilis hangkodek lép érvénybe.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec — támogatott formátumok: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'A kimeneti formátum módosult: $format.';
  }

  @override
  String get orig => 'Eredeti';

  @override
  String get resolutionExplainTitle => 'Mit jelentenek a felbontások?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → nagyon kis fájl,\npl. WhatsApphoz\n\n480p  (854×480)   → normál felbontás (SD)\n\n720p  (1280×720)  → HD, jó választás mobilkészülékekhez\n\n1080p (1920×1080) → Full HD, szokásos felbontás\n                          YouTube-hoz és tévéhez\n\nA Magas/Közepes/Alacsony az azonos felbontás melletti minőséget jelzi — magasabb = nagyobb fájl.';

  @override
  String get resolutionTooltip => 'Tudnivalók a felbontásokról';

  @override
  String get trimArea => 'Vágási tartomány';

  @override
  String trimStartLabel(String time) {
    return 'Kezdet: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Vég: $time';
  }

  @override
  String get adLoading => 'Hirdetés betöltése…';

  @override
  String get convertedPrefix => 'atalakitott_';

  @override
  String get removeAdsTitle => 'Hirdetések eltávolítása';

  @override
  String removeAdsSubtitle(String price) {
    return 'Egyszeri vásárlás – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Hirdetésmentes ✓';

  @override
  String get removeAdsActiveSubtitle => 'Köszönjük a támogatásodat!';

  @override
  String get restorePurchasesTitle => 'Vásárlás visszaállítása';

  @override
  String get purchaseButton => 'Vásárlás';

  @override
  String get purchaseError => 'A vásárlás sikertelen. Próbáld újra.';

  @override
  String get purchaseSuccess => 'Köszönjük! A hirdetéseket kikapcsoltuk.';

  @override
  String get appName => 'Videókonvertáló';

  @override
  String get audioOnly => 'Csak hang';

  @override
  String get audioOnlyTooltip => 'Tudnivalók a hang kinyeréséről';

  @override
  String get audioOnlyInfoContent =>
      'Csak a hangsávot nyeri ki a videóból, kép nélkül.\n\nNormál mód: MP3, 192 kbps.\nSzakértői mód: A hangbeállításokban megadott kodek és bitráta.\n\nHasznos például zene vagy podcastok mentéséhez videókból.';

  @override
  String get aspectLocked => 'Képarány rögzítve';

  @override
  String get aspectUnlocked => 'Képarány feloldva';

  @override
  String get cpuWarningTitle => 'Nagy fájl';

  @override
  String get cpuWarningContent =>
      'Ez a videó hosszabb 5 percnél. Régebbi készülékeken az átalakítás nagy processzorterhelést okozhat — ez normális.\n\nNyugodtan félreteheted a telefonodat; az alkalmazás a háttérben tovább fut.';

  @override
  String get cpuWarningCheckbox => 'Ne jelenjen meg újra';

  @override
  String get storageWarningTitle => 'Nincs elég tárhely';

  @override
  String storageWarningContent(String available, String required) {
    return 'A készülékeden csak $available MB szabad hely van. Az átalakításhoz körülbelül $required MB szükséges. Előbb szabadíts fel tárhelyet.';
  }

  @override
  String get feedbackTitle => 'Visszajelzés és támogatás';

  @override
  String get feedbackSubtitle =>
      'Hibák, javaslatok vagy visszajelzések küldése';

  @override
  String get feedbackCategoryLabel => 'Kategória';

  @override
  String get feedbackCategoryBug => 'Hibabejelentés';

  @override
  String get feedbackCategoryFeature => 'Funkciójavaslat';

  @override
  String get feedbackCategoryFeedback => 'Általános visszajelzés';

  @override
  String get feedbackMessageHint => 'Írd le a problémádat…';

  @override
  String get feedbackSendButton => 'Küldés';

  @override
  String get notificationPermissionTitle => 'Átalakítás a háttérben';

  @override
  String get notificationPermissionContent =>
      'Engedélyezd az értesítéseket, hogy az átalakítás más alkalmazások használata közben is folytatódhasson. Enélkül az alkalmazást nyitva kell tartanod.';

  @override
  String get notificationPermissionNotNow => 'Most nem';

  @override
  String get notificationPermissionAllow => 'Engedélyezés';

  @override
  String get notificationPermissionDenied =>
      'A háttérben végzett átalakításhoz engedélyezd az értesítéseket a Beállításokban.';

  @override
  String get notificationPermissionOpenSettings => 'Beállítások';

  @override
  String get backButton => 'Vissza';

  @override
  String get appSettingsTitle => 'Alkalmazásbeállítások';

  @override
  String get appSettingsSubtitle =>
      'Automatikus mentés és adatvédelmi beállítások';

  @override
  String get openSourceTitle => 'Nyílt forráskód';

  @override
  String get openSourceSubtitle => 'Licencek és forráskód';

  @override
  String get openSourceLicensesTitle => 'Nyílt forráskódú licencek';

  @override
  String get legalSectionTitle => 'Jogi tudnivalók';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Kódolási mód';

  @override
  String get encodingModeCrf => 'Minőség (CRF)';

  @override
  String get encodingModeBitrate => 'Bitráta';

  @override
  String get audioChannelsLabel => 'Hangcsatornák';

  @override
  String get audioChannelsInfoContent =>
      'Eredeti → a forrás csatornakiosztásának megtartása\nSztereó → 2.0 (szükség esetén lekeveréssel)\nMonó → 1 csatorna (a legkisebb fájl)\n5.1 → 6 csatornás térhangzás (csak térhatású hangforrásoknál)\n\nA lekeverés (pl. 5.1 → Sztereó) támogatott. Több csatornára keverés nem érhető el.';

  @override
  String get audioChannelOriginal => 'Eredeti';

  @override
  String get targetBitrateLabel => 'Célbitráta';

  @override
  String get targetBitrateInfoTitle => 'Célbitráta';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → erős tömörítés, üzenetküldő alkalmazásokhoz\n4–8 Mbps → szokásos/jó minőség 1080p felbontásnál\n12 Mbps → magas minőség 1080p / alacsony minőség 4K felbontásnál\n20 Mbps → 4K streamingminőség\n\nEgyéni érték: használd a ceruza ikont (500–100000 kbps)\n\nA CRF-től eltérően a minőség jelenetenként változhat. Azonos fájlméret mellett jobb eredményhez használd a CRF-et.';

  @override
  String get targetBitrateWideScaleHint =>
      'A VP9 és az AV1 nagyjából ezeknek a bitrátáknak a felével éri el ugyanazt a minőséget.';

  @override
  String get rateAppTitle => 'Az alkalmazás értékelése';

  @override
  String get proHintTitle => 'Használat hirdetések nélkül';

  @override
  String get proHintBody =>
      'Egyszeri vásárlással végleg eltávolíthatod a hirdetéseket az alkalmazásból.';

  @override
  String get proHintLater => 'Később';

  @override
  String get restoreError =>
      'Nem sikerült visszaállítani a vásárlásokat. A Play Áruház jelenleg nem érhető el — próbáld újra.';

  @override
  String get restoreNoPurchases => 'Nem található korábbi vásárlás.';

  @override
  String get hdrCodecSwitched =>
      'HDR-videót észleltünk — ennél a videónál H.265-öt használunk a színek megőrzéséhez.';

  @override
  String get themeTitle => 'Megjelenés';

  @override
  String get themeSubtitle =>
      'A rendszer követése, illetve világos vagy sötét téma választása';

  @override
  String get themeSystem => 'Rendszer';

  @override
  String get themeLight => 'Világos';

  @override
  String get themeDark => 'Sötét';

  @override
  String get targetBitrateEditTooltip => 'Bitráta megadása';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Megengedett tartomány: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardveres kódoló (gyors)';

  @override
  String get hwEncoderSubtitle =>
      'Sokkal gyorsabb, de azonos minőséghez körülbelül kétszeres bitráta szükséges. Csak bitrátamódban használható.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-videó — a HDR megőrzéséhez szoftveres kódolóval lesz átalakítva.';

  @override
  String get hwEncoderFallback =>
      'A hardveres kódolás sikertelen — az átalakítás szoftveres kódolóval folytatódik.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'A hardveres kódoló nem támogatja ezt a formátumot: $format — az átalakítás szoftveres kódolóval történik.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'A hardveres kódoló kikapcsolva — csak a bitrátamódot támogatja.';

  @override
  String get resolutionPresetLabel => 'Előbeállítás';

  @override
  String get resolutionOriginal => 'Eredeti';

  @override
  String get resolutionCustom => 'Egyéni';

  @override
  String get aspectRatioLabel => 'Képarány';

  @override
  String get aspectOriginal => 'Eredeti';

  @override
  String get aspectCustom => 'Egyéni';

  @override
  String get fitModeLabel => 'Illesztés';

  @override
  String get fitPad => 'Sávok';

  @override
  String get fitCrop => 'Körbevágás';

  @override
  String get fitStretch => 'Nyújtás';

  @override
  String get fitModeInfoContent =>
      'A cél képaránya eltér a videóétól.\n\nSávok → a teljes kép látható marad, a többi részt fekete sávok töltik ki\nKörbevágás → a kép középső része marad meg, a szélei elvesznek\nNyújtás → a kép torzul, hogy kitöltse a keretet';

  @override
  String get deleteOriginal => 'Eredeti törlése';

  @override
  String get originalTrashed =>
      'Az eredeti a kukába került — onnan visszaállíthatod.';

  @override
  String get originalTrashFailed => 'Nem sikerült törölni az eredetit.';

  @override
  String get burnInSubtitlesLabel => 'Feliratok hozzáadása';

  @override
  String get burnInSubtitlesInfoContent =>
      'Beégetett: A feliratok végleg a videókép részévé válnak. Minden lejátszóban láthatók, és később nem kapcsolhatók ki. A HDR-ben maradó videókon nagyon fényesnek tűnhetnek.\n\nKapcsolható: A feliratok külön sávként kerülnek a videóba, amelyet a lejátszóban be- és kikapcsolhatsz. Nem minden lejátszó jeleníti meg őket, és a videó megosztásakor gyakran elvesznek. AVI és MPEG-TS esetén nem érhető el.\n\nSRT és ASS fájlokat támogat. Az ASS formázása és pozíciói a Beégetett módban és MKV fájlokban teljesen megmaradnak. Más formátumokban a formázás csak részben marad meg, a pozíciók pedig elvesznek.';

  @override
  String get subtitleModeBurnIn => 'Beégetett';

  @override
  String get subtitleModeTrack => 'Kapcsolható';

  @override
  String get subtitleTrackEmpty =>
      'A videó kiválasztott részében nincsenek feliratok.';

  @override
  String get burnInSubtitlesSelect => 'SRT vagy ASS fájl kiválasztása';

  @override
  String get burnInSubtitlesRemove => 'Feliratfájl eltávolítása';

  @override
  String get burnInSubtitlesUnsupported => 'Válassz .srt vagy .ass fájlt.';

  @override
  String get burnInSubtitlesInvalid =>
      'Ez a feliratfájl nem olvasható, vagy nem tartalmaz érvényes feliratokat.';

  @override
  String get burnInSubtitlesMissing =>
      'A feliratfájl már nem érhető el. Válaszd ki újra.';

  @override
  String get subtitleTextSizeLabel => 'Szövegméret';

  @override
  String get subtitleTextSizeSmall => 'Kicsi';

  @override
  String get subtitleTextSizeMedium => 'Közepes';

  @override
  String get subtitleTextSizeLarge => 'Nagy';

  @override
  String get subtitlePositionLabel => 'Pozíció';

  @override
  String get subtitlePositionBottom => 'Alul';

  @override
  String get subtitlePositionTop => 'Felül';

  @override
  String get subtitleBackgroundTitle => 'Szürke háttér';
}
