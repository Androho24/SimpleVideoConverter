// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get qualityLabel => 'Kvalitet';

  @override
  String get quality2160pHigh => '2160p Hög';

  @override
  String get quality2160pMedium => '2160p Medel';

  @override
  String get quality2160pLow => '2160p Låg';

  @override
  String get quality2160pVeryLow => '2160p Mycket låg';

  @override
  String get quality1440pHigh => '1440p Hög';

  @override
  String get quality1440pMedium => '1440p Medel';

  @override
  String get quality1440pLow => '1440p Låg';

  @override
  String get quality1440pVeryLow => '1440p Mycket låg';

  @override
  String get quality1080pHigh => '1080p Hög';

  @override
  String get quality1080pMedium => '1080p Medel';

  @override
  String get quality1080pLow => '1080p Låg';

  @override
  String get quality1080pVeryLow => '1080p Mycket låg';

  @override
  String get quality720pHigh => '720p Hög';

  @override
  String get quality720pMedium => '720p Medel';

  @override
  String get quality720pLow => '720p Låg';

  @override
  String get quality720pVeryLow => '720p Mycket låg';

  @override
  String get quality480pHigh => '480p Hög';

  @override
  String get quality480pMedium => '480p Medel';

  @override
  String get quality480pLow => '480p Låg';

  @override
  String get quality480pVeryLow => '480p Mycket låg';

  @override
  String get quality360pHigh => '360p Hög';

  @override
  String get quality360pMedium => '360p Medel';

  @override
  String get quality360pLow => '360p Låg';

  @override
  String get quality360pVeryLow => '360p Mycket låg';

  @override
  String get mute => 'Ta bort ljud';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Välj video';

  @override
  String get videoLoading => 'Läser in video…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Välj en giltig videofil.';

  @override
  String get fileLoadError => 'Filen kunde inte läsas in. Välj en videofil.';

  @override
  String get previewNotAvailable =>
      'Förhandsgranskning saknas. Videon kan fortfarande konverteras.';

  @override
  String get previewNotAvailableLabel =>
      'Förhandsgranskning saknas\n(För hög upplösning för den här enheten)';

  @override
  String get noVideoLoaded => 'Läs in en video först.';

  @override
  String get cancelConversionTitle => 'Avbryta konverteringen?';

  @override
  String get cancelConversionContent =>
      'Konverteringen måste då göras om från början.';

  @override
  String get continueConversion => 'Fortsätt';

  @override
  String get cancel => 'Avbryt';

  @override
  String get discardVideoTitle => 'Kasta videon?';

  @override
  String get discardVideoContent =>
      'Den konverterade videon raderas utan att sparas.';

  @override
  String get keep => 'Behåll';

  @override
  String get discard => 'Kasta';

  @override
  String get save => 'Spara';

  @override
  String get saveVideoDialogTitle => 'Spara video';

  @override
  String get savedSuccess => 'Sparat!';

  @override
  String get open => 'Öppna';

  @override
  String get openGallery => 'Öppna galleriet';

  @override
  String get openVideo => 'Öppna videon';

  @override
  String get autoSaveTitle => 'Spara videor automatiskt i galleriet';

  @override
  String get autoSaveSubtitle =>
      'Videor sparas automatiskt efter konverteringen.';

  @override
  String get videoCodecTitle => 'Videokodek';

  @override
  String get videoCodecSubtitle => 'Videokodek för konvertering i normalläget';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC eller AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 ger bäst kompatibilitet och konverterar oftast snabbare.\n\nH.265/HEVC kan ge mindre filer med jämförbar bildkvalitet, men konverteringen tar längre tid. Äldre enheter eller appar kanske inte kan spela upp resultatet.\n\nAV1 är en modern kodek utformad för små filer. Äldre enheter och appar kan ofta inte spela upp resultatet.\n\nAlla kodare ingår i appen och är inte beroende av kodekar som är installerade på enheten.';

  @override
  String get saveError =>
      'Det gick inte att spara. Det kanske inte finns tillräckligt med lagringsutrymme.';

  @override
  String get saveErrorOutOfMemory =>
      'Det finns inte tillräckligt med arbetsminne för att spara filen. Prova ett kortare klipp eller lägre kvalitet.';

  @override
  String get conversionDone => 'Klart!';

  @override
  String conversionProgress(String percent) {
    return 'Konverterar: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konverteringen misslyckades: $error';
  }

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get licensesTitle => 'Licenser';

  @override
  String get licensesSubtitle => 'Appens licenser för öppen källkod';

  @override
  String get gplLicenseTitle => 'Licenstext för GPL-3.0';

  @override
  String get sourceCodeTitle => 'Källkod (GitHub)';

  @override
  String get privacyPolicyTitle => 'Integritetspolicy';

  @override
  String get adConsentTitle => 'Integritetsinställningar';

  @override
  String get imprintTitle => 'Utgivaruppgifter';

  @override
  String get linkOpenError => 'Länken kunde inte öppnas.';

  @override
  String get muteTooltip => 'Om att ta bort ljud';

  @override
  String get muteInfoContent =>
      'Tar bort allt ljud från den konverterade videon.\n\nAnvändbart för att till exempel ta bort bakgrundsljud eller minska filstorleken.';

  @override
  String estimatedSize(String size) {
    return 'Uppskattad storlek: $size MB';
  }

  @override
  String get convertButton => 'Konvertera';

  @override
  String get crfLabel => 'Videokvalitet (CRF)';

  @override
  String get crfInfoTitle => 'CRF — videokvalitet';

  @override
  String get crfInfoContent =>
      '0 → förlustfri (mycket stor fil)\n18 → nästan ingen synlig kvalitetsförlust\n23 → standard (bra balans)\n28 → synlig kvalitetsförlust\n51 → lägst kvalitet\n\nRekommenderat: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → förlustfri (mycket stor fil)\n25 → nästan ingen synlig kvalitetsförlust\n30 → standard (bra balans)\n38 → synlig kvalitetsförlust\n63 → lägst kvalitet\n\nRekommenderat: 25–38\n\nVP9 och AV1 använder skalan 0–63: samma värde motsvarar en annan kvalitet än med H.264/H.265.';

  @override
  String get resolutionLabel => 'Upplösning';

  @override
  String get resolutionInfoTitle => 'Vanliga upplösningar';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTips: Lämna ett fält tomt = det andra beräknas proportionellt.';

  @override
  String get widthLabel => 'Bredd';

  @override
  String get heightLabel => 'Höjd';

  @override
  String get emptyEqualsOriginal => 'Tomt = original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Bilder per sekund';

  @override
  String get fpsInfoContent =>
      'Orig  → Behåll originalvideons FPS\n24    → Biostandard\n25    → PAL/TV-standard (Europa)\n30    → NTSC/TV, sociala medier\n60    → Mjuka rörelser, spel, sport';

  @override
  String get audioBitrateLabel => 'Ljudbithastighet';

  @override
  String get silent => 'Utan ljud';

  @override
  String get audioBitrateInfoContent =>
      'Utan ljud   → inget ljud\n64 kbps  → tal, poddar\n96 kbps  → bra talkvalitet\n128 kbps → standard för musik\n192 kbps → hög ljudkvalitet\n320 kbps → högsta MP3-kvalitet';

  @override
  String get audioCodecLabel => 'Ljudkodek';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → bäst kompatibilitet och oftast snabbare kodning\nH.265 → mindre filer med jämförbar kvalitet, långsammare kodning\nVP9 → effektiv öppen kodek för WebM och MKV, långsammare mjukvarukodning\nAV1 → modern kodek för små filer, endast mjukvarukodning\nXvid → äldre MPEG-4-kodek för AVI och äldre spelare\n\nUtdataformaten nedan aktiveras utifrån de valda video- och ljudkodekarna.';

  @override
  String get xvidLegacyLabel => 'Xvid (äldre)';

  @override
  String get av1SlowHint =>
      'AV1 använder endast mjukvarukodning och är mycket långsammare än H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Vid upplösningar över 720p kan du överväga att först skala ned videon.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard för MP4, bäst kompatibilitet\nMP3 → äldre kodek som används i stor utsträckning\nOpus → modern och effektiv, idealisk för WebM och MKV\nAC3 → Dolby Digital, visas bara för källor med surroundljud (≥ 3 kanaler)\nVorbis → öppen kodek för WebM och MKV\n\nInkompatibla utdataformat inaktiveras automatiskt.';

  @override
  String get outputFormatLabel => 'Utdataformat';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universellt, bäst kompatibilitet\nMKV → flexibel behållare för alla tillgängliga kodekar\nMOV → arbetsflöden med Apple/QuickTime\nAVI → äldre format med Xvid\nMPEG-TS → transportström för TV och strömning\nWebM → modernt webbformat med VP9 och Opus eller Vorbis\n\nInkompatibla format är nedtonade. Om du väljer ett sådant format används automatiskt dess standardvideokodek och vid behov en kompatibel ljudkodek.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec stöds av: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Utdataformatet har ändrats till $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Vad betyder upplösningarna?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → mycket liten fil,\nt.ex. för WhatsApp\n\n480p  (854×480)   → standardupplösning (SD)\n\n720p  (1280×720)  → HD, bra för mobila enheter\n\n1080p (1920×1080) → Full HD, standard för\n                          YouTube & TV\n\nHög/Medel/Låg beskriver kvaliteten vid samma upplösning — högre = större fil.';

  @override
  String get resolutionTooltip => 'Om upplösningar';

  @override
  String get trimArea => 'Trimningsintervall';

  @override
  String trimStartLabel(String time) {
    return 'Start: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Slut: $time';
  }

  @override
  String get adLoading => 'Läser in annons…';

  @override
  String get convertedPrefix => 'konverterad_';

  @override
  String get removeAdsTitle => 'Ta bort annonser';

  @override
  String removeAdsSubtitle(String price) {
    return 'Engångsköp – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Annonsfri ✓';

  @override
  String get removeAdsActiveSubtitle => 'Tack för ditt stöd!';

  @override
  String get restorePurchasesTitle => 'Återställ köp';

  @override
  String get purchaseButton => 'Köp';

  @override
  String get purchaseError => 'Köpet misslyckades. Försök igen.';

  @override
  String get purchaseSuccess => 'Tack! Annonserna har tagits bort.';

  @override
  String get appName => 'Videokonverter';

  @override
  String get audioOnly => 'Endast ljud';

  @override
  String get audioOnlyTooltip => 'Om endast ljud';

  @override
  String get audioOnlyInfoContent =>
      'Extraherar bara ljudspåret från videon — ingen bild.\n\nNormalläge: MP3 med 192 kbps.\nExpertläge: Kodek och bithastighet från ljudinställningarna.\n\nAnvändbart för att till exempel spara musik eller poddar från videor.';

  @override
  String get aspectLocked => 'Bildförhållandet är låst';

  @override
  String get aspectUnlocked => 'Bildförhållandet är upplåst';

  @override
  String get cpuWarningTitle => 'Stor fil';

  @override
  String get cpuWarningContent =>
      'Den här videon är längre än 5 minuter. På äldre enheter kan konverteringen belasta processorn kraftigt — det är normalt.\n\nDu kan lägga telefonen åt sidan. Appen fortsätter att köras i bakgrunden.';

  @override
  String get cpuWarningCheckbox => 'Visa inte igen';

  @override
  String get storageWarningTitle => 'Otillräckligt lagringsutrymme';

  @override
  String storageWarningContent(String available, String required) {
    return 'Enheten har bara $available MB ledigt. Konverteringen kräver ungefär $required MB. Frigör lite utrymme först.';
  }

  @override
  String get feedbackTitle => 'Feedback och support';

  @override
  String get feedbackSubtitle => 'Skicka felrapporter, förslag eller feedback';

  @override
  String get feedbackCategoryLabel => 'Kategori';

  @override
  String get feedbackCategoryBug => 'Rapportera ett fel';

  @override
  String get feedbackCategoryFeature => 'Föreslå en funktion';

  @override
  String get feedbackCategoryFeedback => 'Allmän feedback';

  @override
  String get feedbackMessageHint => 'Beskriv ditt problem…';

  @override
  String get feedbackSendButton => 'Skicka';

  @override
  String get notificationPermissionTitle => 'Konvertering i bakgrunden';

  @override
  String get notificationPermissionContent =>
      'Tillåt aviseringar så att konverteringen kan fortsätta medan du använder andra appar. Annars måste appen vara öppen.';

  @override
  String get notificationPermissionNotNow => 'Inte nu';

  @override
  String get notificationPermissionAllow => 'Tillåt';

  @override
  String get notificationPermissionDenied =>
      'Aktivera aviseringar i Inställningar för att konvertera i bakgrunden.';

  @override
  String get notificationPermissionOpenSettings => 'Inställningar';

  @override
  String get backButton => 'Tillbaka';

  @override
  String get appSettingsTitle => 'Appinställningar';

  @override
  String get appSettingsSubtitle =>
      'Automatiskt sparande och integritetsinställningar';

  @override
  String get openSourceTitle => 'Öppen källkod';

  @override
  String get openSourceSubtitle => 'Licenser och källkod';

  @override
  String get openSourceLicensesTitle => 'Licenser för öppen källkod';

  @override
  String get legalSectionTitle => 'Juridisk information';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Kodningsläge';

  @override
  String get encodingModeCrf => 'Kvalitet (CRF)';

  @override
  String get encodingModeBitrate => 'Bithastighet';

  @override
  String get audioChannelsLabel => 'Ljudkanaler';

  @override
  String get audioChannelsInfoContent =>
      'Original → behåll källans kanallayout\nStereo → 2.0 (nedmixning vid behov)\nMono → 1 kanal (minsta filen)\n5.1 → 6-kanaligt surroundljud (endast för källor med surroundljud)\n\nNedmixning (t.ex. 5.1 → Stereo) stöds. Uppmixning erbjuds inte.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Målbithastighet';

  @override
  String get targetBitrateInfoTitle => 'Målbithastighet';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → kraftig komprimering, meddelandeappar\n4–8 Mbps → standard/bra kvalitet vid 1080p\n12 Mbps → hög kvalitet vid 1080p / låg kvalitet vid 4K\n20 Mbps → strömningskvalitet för 4K\n\nEget värde: använd pennikonen (500–100000 kbps)\n\nTill skillnad från CRF kan kvaliteten variera mellan scener. Använd CRF för bättre resultat vid samma filstorlek.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 och AV1 når samma kvalitet vid ungefär hälften av dessa bithastigheter.';

  @override
  String get rateAppTitle => 'Betygsätt appen';

  @override
  String get proHintTitle => 'Använd utan annonser';

  @override
  String get proHintBody =>
      'Med ett engångsköp kan du ta bort annonserna i appen permanent.';

  @override
  String get proHintLater => 'Senare';

  @override
  String get restoreError =>
      'Det gick inte att återställa köp. Play Butik är inte tillgänglig just nu — försök igen.';

  @override
  String get restoreNoPurchases => 'Inga tidigare köp hittades.';

  @override
  String get hdrCodecSwitched =>
      'HDR-video upptäckt — H.265 används för den här videon så att färgerna bevaras.';

  @override
  String get themeTitle => 'Utseende';

  @override
  String get themeSubtitle =>
      'Följ systemet eller välj ett ljust eller mörkt tema';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Ljust';

  @override
  String get themeDark => 'Mörkt';

  @override
  String get targetBitrateEditTooltip => 'Ange bithastighet';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Tillåtet intervall: $range';
  }

  @override
  String get hwEncoderTitle => 'Hårdvarukodare (snabb)';

  @override
  String get hwEncoderSubtitle =>
      'Mycket snabbare, men kräver ungefär dubbla bithastigheten för samma kvalitet. Endast i bithastighetsläget.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-video — konverteras med mjukvarukodaren så att HDR bevaras.';

  @override
  String get hwEncoderFallback =>
      'Hårdvarukodaren misslyckades — konverterar med mjukvarukodaren i stället.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format stöds inte av hårdvarukodaren — det här formatet konverteras med mjukvarukodaren.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hårdvarukodaren har stängts av — den stöder bara bithastighetsläget.';

  @override
  String get resolutionPresetLabel => 'Förinställning';

  @override
  String get resolutionOriginal => 'Original';

  @override
  String get resolutionCustom => 'Anpassad';

  @override
  String get aspectRatioLabel => 'Bildförhållande';

  @override
  String get aspectOriginal => 'Original';

  @override
  String get aspectCustom => 'Anpassat';

  @override
  String get fitModeLabel => 'Anpassning';

  @override
  String get fitPad => 'Svarta fält';

  @override
  String get fitCrop => 'Beskär';

  @override
  String get fitStretch => 'Sträck ut';

  @override
  String get fitModeInfoContent =>
      'Målformatet har ett annat bildförhållande än videon.\n\nSvarta fält → hela bilden syns, resten fylls med svarta fält\nBeskär → mittdelen behålls, kanterna skärs bort\nSträck ut → bilden förvrängs för att fylla bildrutan';

  @override
  String get deleteOriginal => 'Radera originalet';

  @override
  String get originalTrashed =>
      'Originalet har flyttats till papperskorgen — du kan återställa det därifrån.';

  @override
  String get originalTrashFailed => 'Originalet kunde inte raderas.';

  @override
  String get burnInSubtitlesLabel => 'Lägg till undertexter';

  @override
  String get burnInSubtitlesInfoContent =>
      'Inbrända: Undertexterna blir en del av videobilden. De syns i alla spelare och kan inte stängas av i efterhand. I videor som behåller HDR kan de se mycket ljusa ut.\n\nValbara: Undertexterna läggs till som ett separat spår som kan slås på eller av i spelaren. Alla spelare visar dem inte, och de försvinner ofta när videon delas. Inte tillgängligt för AVI och MPEG-TS.\n\nStöder SRT- och ASS-filer. ASS-formatering och positioner bevaras helt med läget Inbrända och i MKV-filer. Andra format behåller bara delar av formateringen och inga positioner.';

  @override
  String get subtitleModeBurnIn => 'Inbrända';

  @override
  String get subtitleModeTrack => 'Valbara';

  @override
  String get subtitleTrackEmpty =>
      'Det finns inga undertexter i den valda delen av videon.';

  @override
  String get sharedVideoBusy =>
      'Slutför den pågående konverteringen först och dela sedan videon igen.';

  @override
  String get burnInSubtitlesSelect => 'Välj SRT- eller ASS-fil';

  @override
  String get burnInSubtitlesRemove => 'Ta bort undertextfil';

  @override
  String get burnInSubtitlesUnsupported => 'Välj en .srt- eller .ass-fil.';

  @override
  String get burnInSubtitlesInvalid =>
      'Undertextfilen kunde inte läsas eller innehåller inga giltiga undertexter.';

  @override
  String get burnInSubtitlesMissing =>
      'Undertextfilen är inte längre tillgänglig. Välj den igen.';

  @override
  String get subtitleTextSizeLabel => 'Textstorlek';

  @override
  String get subtitleTextSizeSmall => 'Liten';

  @override
  String get subtitleTextSizeMedium => 'Medel';

  @override
  String get subtitleTextSizeLarge => 'Stor';

  @override
  String get subtitlePositionLabel => 'Placering';

  @override
  String get subtitlePositionBottom => 'Nedtill';

  @override
  String get subtitlePositionTop => 'Upptill';

  @override
  String get subtitleBackgroundTitle => 'Grå bakgrund';
}
