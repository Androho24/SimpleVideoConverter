// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get qualityLabel => 'Kvalita';

  @override
  String get quality2160pHigh => '2160p Vysoká';

  @override
  String get quality2160pMedium => '2160p Stredná';

  @override
  String get quality2160pLow => '2160p Nízka';

  @override
  String get quality2160pVeryLow => '2160p Veľmi nízka';

  @override
  String get quality1440pHigh => '1440p Vysoká';

  @override
  String get quality1440pMedium => '1440p Stredná';

  @override
  String get quality1440pLow => '1440p Nízka';

  @override
  String get quality1440pVeryLow => '1440p Veľmi nízka';

  @override
  String get quality1080pHigh => '1080p Vysoká';

  @override
  String get quality1080pMedium => '1080p Stredná';

  @override
  String get quality1080pLow => '1080p Nízka';

  @override
  String get quality1080pVeryLow => '1080p Veľmi nízka';

  @override
  String get quality720pHigh => '720p Vysoká';

  @override
  String get quality720pMedium => '720p Stredná';

  @override
  String get quality720pLow => '720p Nízka';

  @override
  String get quality720pVeryLow => '720p Veľmi nízka';

  @override
  String get quality480pHigh => '480p Vysoká';

  @override
  String get quality480pMedium => '480p Stredná';

  @override
  String get quality480pLow => '480p Nízka';

  @override
  String get quality480pVeryLow => '480p Veľmi nízka';

  @override
  String get quality360pHigh => '360p Vysoká';

  @override
  String get quality360pMedium => '360p Stredná';

  @override
  String get quality360pLow => '360p Nízka';

  @override
  String get quality360pVeryLow => '360p Veľmi nízka';

  @override
  String get mute => 'Stlmiť';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Vybrať video';

  @override
  String get videoLoading => 'Načítava sa video…';

  @override
  String get modeNormal => 'Normálny';

  @override
  String get modeExpert => 'Expertný';

  @override
  String get invalidVideoFile => 'Vyberte platný videosúbor.';

  @override
  String get fileLoadError =>
      'Súbor sa nepodarilo načítať. Vyberte videosúbor.';

  @override
  String get previewNotAvailable =>
      'Náhľad nie je k dispozícii. Video sa aj tak dá konvertovať.';

  @override
  String get previewNotAvailableLabel =>
      'Náhľad nie je k dispozícii\n(Rozlíšenie je pre toto zariadenie príliš vysoké)';

  @override
  String get noVideoLoaded => 'Najprv načítajte video.';

  @override
  String get cancelConversionTitle => 'Zrušiť konverziu?';

  @override
  String get cancelConversionContent =>
      'Doterajší priebeh konverzie sa stratí.';

  @override
  String get continueConversion => 'Pokračovať';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get discardVideoTitle => 'Zahodiť video?';

  @override
  String get discardVideoContent =>
      'Konvertované video sa odstráni bez uloženia.';

  @override
  String get keep => 'Ponechať';

  @override
  String get discard => 'Zahodiť';

  @override
  String get save => 'Uložiť';

  @override
  String get saveVideoDialogTitle => 'Uložiť video';

  @override
  String get savedSuccess => 'Uložené!';

  @override
  String get open => 'Otvoriť';

  @override
  String get openGallery => 'Otvoriť galériu';

  @override
  String get openVideo => 'Otvoriť video';

  @override
  String get autoSaveTitle => 'Automaticky ukladať videá do galérie';

  @override
  String get autoSaveSubtitle => 'Videá sa po konverzii automaticky uložia.';

  @override
  String get videoCodecTitle => 'Kodek videa';

  @override
  String get videoCodecSubtitle =>
      'Kodek videa pre konverzie v normálnom režime';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC alebo AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 ponúka najlepšiu kompatibilitu a zvyčajne aj rýchlejšiu konverziu.\n\nH.265/HEVC dokáže vytvoriť menšie súbory pri porovnateľnej kvalite obrazu, konverzia však trvá dlhšie. Staršie zariadenia alebo aplikácie nemusia výsledok prehrať.\n\nAV1 je moderný kodek navrhnutý na vytváranie malých súborov. Staršie zariadenia a aplikácie často nedokážu výsledok prehrať.\n\nVšetky enkodéry sú súčasťou aplikácie a nezávisia od kodekov nainštalovaných v zariadení.';

  @override
  String get saveError =>
      'Chyba pri ukladaní. Možno nie je dostatok miesta v úložisku.';

  @override
  String get saveErrorOutOfMemory =>
      'Na uloženie tohto súboru nie je dostatok pamäte. Skúste kratší klip alebo nižšiu kvalitu.';

  @override
  String get conversionDone => 'Hotovo!';

  @override
  String conversionProgress(String percent) {
    return 'Konvertuje sa: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konverzia zlyhala: $error';
  }

  @override
  String get settingsTitle => 'Nastavenia';

  @override
  String get licensesTitle => 'Licencie';

  @override
  String get licensesSubtitle =>
      'Licencie otvoreného zdrojového kódu tejto aplikácie';

  @override
  String get gplLicenseTitle => 'Text licencie GPL-3.0';

  @override
  String get sourceCodeTitle => 'Zdrojový kód (GitHub)';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany súkromia';

  @override
  String get adConsentTitle => 'Nastavenia súkromia';

  @override
  String get imprintTitle => 'Údaje o prevádzkovateľovi';

  @override
  String get linkOpenError => 'Odkaz sa nepodarilo otvoriť.';

  @override
  String get muteTooltip => 'Informácie o stlmení';

  @override
  String get muteInfoContent =>
      'Úplne odstráni zvuk z konvertovaného videa.\n\nHodí sa napríklad na odstránenie hluku v pozadí alebo zmenšenie súboru.';

  @override
  String estimatedSize(String size) {
    return 'Odhadovaná veľkosť: $size MB';
  }

  @override
  String get convertButton => 'Konvertovať';

  @override
  String get crfLabel => 'Kvalita videa (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Kvalita videa';

  @override
  String get crfInfoContent =>
      '0 → bezstratová (veľmi veľký súbor)\n18 → vizuálne takmer bezstratová\n23 → štandardná (dobrý kompromis)\n28 → viditeľná strata kvality\n51 → najnižšia kvalita\n\nOdporúčané: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → bezstratová (veľmi veľký súbor)\n25 → vizuálne takmer bezstratová\n30 → štandardná (dobrý kompromis)\n38 → viditeľná strata kvality\n63 → najnižšia kvalita\n\nOdporúčané: 25–38\n\nVP9 a AV1 používajú stupnicu 0–63: rovnaká hodnota zodpovedá inej kvalite než pri H.264/H.265.';

  @override
  String get resolutionLabel => 'Rozlíšenie';

  @override
  String get resolutionInfoTitle => 'Bežné rozlíšenia';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTip: Nechajte jedno pole prázdne = druhý rozmer sa vypočíta podľa pomeru strán.';

  @override
  String get widthLabel => 'Šírka';

  @override
  String get heightLabel => 'Výška';

  @override
  String get emptyEqualsOriginal => 'Prázdne = pôvodné';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Počet snímok za sekundu';

  @override
  String get fpsInfoContent =>
      'Pôv.  → Zachovať snímkovú frekvenciu zdrojového videa\n24    → Filmový štandard\n25    → Štandard PAL/TV (Európa)\n30    → NTSC/TV, sociálne siete\n60    → Plynulý obraz, hry, šport';

  @override
  String get audioBitrateLabel => 'Dátový tok zvuku';

  @override
  String get silent => 'Bez zvuku';

  @override
  String get audioBitrateInfoContent =>
      'Bez zvuku → žiadny zvuk\n64 kbps  → hlas, podcasty\n96 kbps  → dobrá kvalita hlasu\n128 kbps → štandardná kvalita hudby\n192 kbps → vysoká kvalita zvuku\n320 kbps → maximálna kvalita MP3';

  @override
  String get audioCodecLabel => 'Kodek zvuku';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → najlepšia kompatibilita a zvyčajne rýchlejšie kódovanie\nH.265 → menšie súbory pri porovnateľnej kvalite, pomalšie kódovanie\nVP9 → efektívny otvorený kodek pre WebM a MKV, pomalšie softvérové kódovanie\nAV1 → moderný kodek pre malé súbory, iba softvérové kódovanie\nXvid → starší kodek MPEG-4 pre AVI a staršie prehrávače\n\nDostupnosť výstupných formátov nižšie závisí od vybraných kodekov videa a zvuku.';

  @override
  String get xvidLegacyLabel => 'Xvid (starší)';

  @override
  String get av1SlowHint =>
      'AV1 používa iba softvérové kódovanie a je oveľa pomalší než H.264/H.265.';

  @override
  String get av1HighResHint => 'Pri rozlíšení nad 720p zvážte jeho zníženie.';

  @override
  String get audioCodecInfoContent =>
      'AAC → štandard pre MP4, najlepšia kompatibilita\nMP3 → rozšírený starší kodek\nOpus → moderný a efektívny, ideálny pre WebM a MKV\nAC3 → Dolby Digital, zobrazuje sa len pri zdrojoch s priestorovým zvukom (≥ 3 kanály)\nVorbis → otvorený kodek pre WebM a MKV\n\nNekompatibilné výstupné formáty sa automaticky deaktivujú.';

  @override
  String get outputFormatLabel => 'Výstupný formát';

  @override
  String get outputFormatInfoContent =>
      'MP4 → univerzálny, najlepšia kompatibilita\nMKV → flexibilný kontajner pre všetky ponúkané kodeky\nMOV → práca v prostredí Apple/QuickTime\nAVI → starší formát využívajúci Xvid\nMPEG-TS → transportný tok pre TV a streamovanie\nWebM → moderný webový formát využívajúci VP9 s Opus alebo Vorbis\n\nNekompatibilné formáty sú sivé. Výberom takého formátu sa automaticky nastaví jeho predvolený kodek videa a v prípade potreby aj kompatibilný kodek zvuku.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec podporujú tieto formáty: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Výstupný formát sa zmenil na $format.';
  }

  @override
  String get orig => 'Pôv.';

  @override
  String get resolutionExplainTitle => 'Čo znamenajú jednotlivé rozlíšenia?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → veľmi malý súbor,\nnapr. pre WhatsApp\n\n480p  (854×480)   → štandardné rozlíšenie (SD)\n\n720p  (1280×720)  → HD, vhodné pre mobilné zariadenia\n\n1080p (1920×1080) → Full HD, štandard pre\n                          YouTube a TV\n\nVysoká/Stredná/Nízka označuje kvalitu pri rovnakom rozlíšení — vyššia = väčší súbor.';

  @override
  String get resolutionTooltip => 'Informácie o rozlíšeniach';

  @override
  String get trimArea => 'Rozsah orezania';

  @override
  String trimStartLabel(String time) {
    return 'Začiatok: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Koniec: $time';
  }

  @override
  String get adLoading => 'Načítava sa reklama…';

  @override
  String get convertedPrefix => 'konvertovane_';

  @override
  String get removeAdsTitle => 'Odstrániť reklamy';

  @override
  String removeAdsSubtitle(String price) {
    return 'Jednorazový nákup – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Bez reklám ✓';

  @override
  String get removeAdsActiveSubtitle => 'Ďakujeme za podporu!';

  @override
  String get restorePurchasesTitle => 'Obnoviť nákup';

  @override
  String get purchaseButton => 'Kúpiť';

  @override
  String get purchaseError => 'Nákup zlyhal. Skúste to znova.';

  @override
  String get purchaseSuccess => 'Ďakujeme! Reklamy boli vypnuté.';

  @override
  String get appName => 'Konvertor videa';

  @override
  String get audioOnly => 'Iba zvuk';

  @override
  String get audioOnlyTooltip => 'Informácie o extrakcii zvuku';

  @override
  String get audioOnlyInfoContent =>
      'Extrahuje z videa iba zvukovú stopu — bez obrazu.\n\nNormálny režim: MP3 pri 192 kbps.\nExpertný režim: Kodek a dátový tok z nastavení zvuku.\n\nHodí sa napríklad na uloženie hudby alebo podcastov z videí.';

  @override
  String get aspectLocked => 'Pomer strán je uzamknutý';

  @override
  String get aspectUnlocked => 'Pomer strán je odomknutý';

  @override
  String get cpuWarningTitle => 'Veľký súbor';

  @override
  String get cpuWarningContent =>
      'Toto video je dlhšie než 5 minút. Na starších zariadeniach môže konverzia výrazne zaťažiť procesor — je to normálne.\n\nTelefón môžete pokojne odložiť, aplikácia bude ďalej pracovať na pozadí.';

  @override
  String get cpuWarningCheckbox => 'Viac nezobrazovať';

  @override
  String get storageWarningTitle => 'Nedostatok miesta v úložisku';

  @override
  String storageWarningContent(String available, String required) {
    return 'V zariadení je voľných iba $available MB. Konverzia potrebuje približne $required MB. Najprv uvoľnite miesto.';
  }

  @override
  String get feedbackTitle => 'Spätná väzba a podpora';

  @override
  String get feedbackSubtitle =>
      'Pošlite hlásenie o chybe, návrh alebo spätnú väzbu';

  @override
  String get feedbackCategoryLabel => 'Kategória';

  @override
  String get feedbackCategoryBug => 'Nahlásiť chybu';

  @override
  String get feedbackCategoryFeature => 'Návrh na novú funkciu';

  @override
  String get feedbackCategoryFeedback => 'Všeobecná spätná väzba';

  @override
  String get feedbackMessageHint => 'Opíšte svoj problém…';

  @override
  String get feedbackSendButton => 'Odoslať';

  @override
  String get notificationPermissionTitle => 'Konverzia na pozadí';

  @override
  String get notificationPermissionContent =>
      'Povoľte upozornenia, aby konverzia mohla pokračovať aj pri používaní iných aplikácií. Bez tohto povolenia musí aplikácia zostať otvorená.';

  @override
  String get notificationPermissionNotNow => 'Teraz nie';

  @override
  String get notificationPermissionAllow => 'Povoliť';

  @override
  String get notificationPermissionDenied =>
      'Ak chcete konvertovať na pozadí, povoľte upozornenia v nastaveniach.';

  @override
  String get notificationPermissionOpenSettings => 'Nastavenia';

  @override
  String get backButton => 'Späť';

  @override
  String get appSettingsTitle => 'Nastavenia aplikácie';

  @override
  String get appSettingsSubtitle =>
      'Automatické ukladanie a nastavenia súkromia';

  @override
  String get openSourceTitle => 'Otvorený zdrojový kód';

  @override
  String get openSourceSubtitle => 'Licencie a zdrojový kód';

  @override
  String get openSourceLicensesTitle => 'Licencie otvoreného zdrojového kódu';

  @override
  String get legalSectionTitle => 'Právne informácie';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Režim kódovania';

  @override
  String get encodingModeCrf => 'Kvalita (CRF)';

  @override
  String get encodingModeBitrate => 'Dátový tok';

  @override
  String get audioChannelsLabel => 'Zvukové kanály';

  @override
  String get audioChannelsInfoContent =>
      'Pôvodné → zachovať rozloženie kanálov zdroja\nStereo → 2.0 (v prípade potreby zmiešať kanály)\nMono → 1 kanál (najmenší súbor)\n5.1 → 6-kanálový priestorový zvuk (iba pri zdrojoch s priestorovým zvukom)\n\nZmiešanie do menšieho počtu kanálov (napr. 5.1 → Stereo) je podporované. Rozšírenie na viac kanálov nie je k dispozícii.';

  @override
  String get audioChannelOriginal => 'Pôvodné';

  @override
  String get targetBitrateLabel => 'Cieľový dátový tok';

  @override
  String get targetBitrateInfoTitle => 'Cieľový dátový tok';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → silná kompresia, aplikácie na posielanie správ\n4–8 Mbps → štandardná/dobrá kvalita pri 1080p\n12 Mbps → vysoká kvalita pri 1080p / nízka kvalita pri 4K\n20 Mbps → kvalita na streamovanie v 4K\n\nVlastná hodnota: použite ikonu ceruzky (500–100000 kbps)\n\nNa rozdiel od CRF sa kvalita môže meniť podľa scény. CRF poskytuje lepšie výsledky pri rovnakej veľkosti súboru.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 a AV1 dosahujú rovnakú kvalitu približne pri polovičnom dátovom toku.';

  @override
  String get rateAppTitle => 'Ohodnotiť aplikáciu';

  @override
  String get proHintTitle => 'Používanie bez reklám';

  @override
  String get proHintBody =>
      'Jednorazovým nákupom môžete natrvalo odstrániť reklamy z aplikácie.';

  @override
  String get proHintLater => 'Neskôr';

  @override
  String get restoreError =>
      'Nákupy sa nepodarilo obnoviť. Obchod Play je momentálne nedostupný — skúste to znova.';

  @override
  String get restoreNoPurchases => 'Nenašli sa žiadne predchádzajúce nákupy.';

  @override
  String get hdrCodecSwitched =>
      'Zistilo sa video HDR — pre toto video sa použije H.265, aby sa zachovali farby.';

  @override
  String get themeTitle => 'Vzhľad';

  @override
  String get themeSubtitle =>
      'Použiť systémový vzhľad alebo vybrať svetlý či tmavý motív';

  @override
  String get themeSystem => 'Systém';

  @override
  String get themeLight => 'Svetlý';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get targetBitrateEditTooltip => 'Zadať dátový tok';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Povolený rozsah: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardvérový enkodér (rýchly)';

  @override
  String get hwEncoderSubtitle =>
      'Oveľa rýchlejší, ale na rovnakú kvalitu potrebuje približne dvojnásobný dátový tok. Iba v režime dátového toku.';

  @override
  String get hwEncoderHdrHint =>
      'Video HDR — na zachovanie HDR sa konvertuje softvérovým enkodérom.';

  @override
  String get hwEncoderFallback =>
      'Hardvérový enkodér zlyhal — konverzia pokračuje so softvérovým enkodérom.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Hardvérový enkodér nepodporuje $format — pri tomto formáte sa použije softvérový enkodér.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hardvérový enkodér sa vypol — podporuje iba režim dátového toku.';

  @override
  String get resolutionPresetLabel => 'Predvoľba';

  @override
  String get resolutionOriginal => 'Pôvodné';

  @override
  String get resolutionCustom => 'Vlastné';

  @override
  String get aspectRatioLabel => 'Pomer strán';

  @override
  String get aspectOriginal => 'Pôvodný';

  @override
  String get aspectCustom => 'Vlastný';

  @override
  String get fitModeLabel => 'Prispôsobenie';

  @override
  String get fitPad => 'Pruhy';

  @override
  String get fitCrop => 'Orezať';

  @override
  String get fitStretch => 'Roztiahnuť';

  @override
  String get fitModeInfoContent =>
      'Cieľový pomer strán sa líši od pomeru strán videa.\n\nPruhy → celý obraz zostane viditeľný, zvyšok vyplnia čierne pruhy\nOrezať → zachová sa stred obrazu, okraje sa odstránia\nRoztiahnuť → obraz sa zdeformuje, aby vyplnil celý rám';

  @override
  String get deleteOriginal => 'Odstrániť originál';

  @override
  String get originalTrashed =>
      'Originál sa presunul do koša — odtiaľ ho môžete obnoviť.';

  @override
  String get originalTrashFailed => 'Originál sa nepodarilo odstrániť.';

  @override
  String get burnInSubtitlesLabel => 'Pridať titulky';

  @override
  String get burnInSubtitlesInfoContent =>
      'Natrvalo: Titulky sa vložia priamo do obrazu videa. Sú viditeľné v každom prehrávači a neskôr ich už nemožno vypnúť. Vo videách, ktoré zostanú v HDR, môžu pôsobiť veľmi jasne.\n\nPrepínateľné: Titulky sa pridajú ako samostatná stopa, ktorú možno v prehrávači zapnúť alebo vypnúť. Nie každý prehrávač ich zobrazí a pri zdieľaní videa sa často stratia. Nie je k dispozícii pre AVI a MPEG-TS.\n\nPodporuje súbory SRT a ASS. Štýly a umiestnenie titulkov ASS sa plne zachovajú v režime Natrvalo a v súboroch MKV. Ostatné formáty zachovajú iba časť štýlov a nezachovajú umiestnenie.';

  @override
  String get subtitleModeBurnIn => 'Natrvalo';

  @override
  String get subtitleModeTrack => 'Prepínateľné';

  @override
  String get subtitleTrackEmpty =>
      'Vo vybranej časti videa nie sú žiadne titulky.';

  @override
  String get burnInSubtitlesSelect => 'Vybrať súbor SRT alebo ASS';

  @override
  String get burnInSubtitlesRemove => 'Odstrániť súbor s titulkami';

  @override
  String get burnInSubtitlesUnsupported => 'Vyberte súbor .srt alebo .ass.';

  @override
  String get burnInSubtitlesInvalid =>
      'Tento súbor s titulkami sa nepodarilo prečítať alebo neobsahuje platné titulky.';

  @override
  String get burnInSubtitlesMissing =>
      'Súbor s titulkami už nie je k dispozícii. Vyberte ho znova.';

  @override
  String get subtitleTextSizeLabel => 'Veľkosť textu';

  @override
  String get subtitleTextSizeSmall => 'Malá';

  @override
  String get subtitleTextSizeMedium => 'Stredná';

  @override
  String get subtitleTextSizeLarge => 'Veľká';

  @override
  String get subtitlePositionLabel => 'Umiestnenie';

  @override
  String get subtitlePositionBottom => 'Dole';

  @override
  String get subtitlePositionTop => 'Hore';

  @override
  String get subtitleBackgroundTitle => 'Sivé pozadie';
}
