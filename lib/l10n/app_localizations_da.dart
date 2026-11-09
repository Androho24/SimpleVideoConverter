// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get qualityLabel => 'Kvalitet';

  @override
  String get quality2160pHigh => '2160p Høj';

  @override
  String get quality2160pMedium => '2160p Middel';

  @override
  String get quality2160pLow => '2160p Lav';

  @override
  String get quality2160pVeryLow => '2160p Meget lav';

  @override
  String get quality1440pHigh => '1440p Høj';

  @override
  String get quality1440pMedium => '1440p Middel';

  @override
  String get quality1440pLow => '1440p Lav';

  @override
  String get quality1440pVeryLow => '1440p Meget lav';

  @override
  String get quality1080pHigh => '1080p Høj';

  @override
  String get quality1080pMedium => '1080p Middel';

  @override
  String get quality1080pLow => '1080p Lav';

  @override
  String get quality1080pVeryLow => '1080p Meget lav';

  @override
  String get quality720pHigh => '720p Høj';

  @override
  String get quality720pMedium => '720p Middel';

  @override
  String get quality720pLow => '720p Lav';

  @override
  String get quality720pVeryLow => '720p Meget lav';

  @override
  String get quality480pHigh => '480p Høj';

  @override
  String get quality480pMedium => '480p Middel';

  @override
  String get quality480pLow => '480p Lav';

  @override
  String get quality480pVeryLow => '480p Meget lav';

  @override
  String get quality360pHigh => '360p Høj';

  @override
  String get quality360pMedium => '360p Middel';

  @override
  String get quality360pLow => '360p Lav';

  @override
  String get quality360pVeryLow => '360p Meget lav';

  @override
  String get mute => 'Fjern lyd';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Vælg video';

  @override
  String get videoLoading => 'Indlæser video…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Ekspert';

  @override
  String get invalidVideoFile => 'Vælg en gyldig videofil.';

  @override
  String get fileLoadError => 'Filen kunne ikke indlæses. Vælg en videofil.';

  @override
  String get previewNotAvailable =>
      'Forhåndsvisning er ikke tilgængelig. Videoen kan stadig konverteres.';

  @override
  String get previewNotAvailableLabel =>
      'Forhåndsvisning er ikke tilgængelig\n(Opløsningen er for høj til denne enhed)';

  @override
  String get noVideoLoaded => 'Indlæs først en video.';

  @override
  String get cancelConversionTitle => 'Annullér konverteringen?';

  @override
  String get cancelConversionContent =>
      'Du mister det, der allerede er konverteret.';

  @override
  String get continueConversion => 'Fortsæt';

  @override
  String get cancel => 'Annullér';

  @override
  String get discardVideoTitle => 'Kassér videoen?';

  @override
  String get discardVideoContent =>
      'Den konverterede video slettes uden at blive gemt.';

  @override
  String get keep => 'Behold';

  @override
  String get discard => 'Kassér';

  @override
  String get save => 'Gem';

  @override
  String get saveVideoDialogTitle => 'Gem video';

  @override
  String get savedSuccess => 'Gemt!';

  @override
  String get open => 'Åbn';

  @override
  String get openGallery => 'Åbn galleri';

  @override
  String get openVideo => 'Åbn video';

  @override
  String get autoSaveTitle => 'Gem videoer automatisk i galleriet';

  @override
  String get autoSaveSubtitle =>
      'Videoer gemmes automatisk efter konvertering.';

  @override
  String get videoCodecTitle => 'Videocodec';

  @override
  String get videoCodecSubtitle =>
      'Videocodec til konvertering i normal tilstand';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC eller AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 giver den bedste kompatibilitet og konverterer normalt hurtigere.\n\nH.265/HEVC kan give mindre filer med tilsvarende billedkvalitet, men konverteringen tager længere tid. Ældre enheder eller apps kan muligvis ikke afspille resultatet.\n\nAV1 er en moderne codec udviklet til små filer. Ældre enheder og apps kan ofte ikke afspille resultatet.\n\nAlle kodere er inkluderet i appen og er ikke afhængige af codecs installeret på enheden.';

  @override
  String get saveError =>
      'Kunne ikke gemme. Der er muligvis ikke nok lagerplads.';

  @override
  String get saveErrorOutOfMemory =>
      'Der er ikke nok hukommelse til at gemme denne fil. Prøv et kortere klip eller en lavere kvalitet.';

  @override
  String get conversionDone => 'Færdig!';

  @override
  String conversionProgress(String percent) {
    return 'Konverterer: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konverteringen mislykkedes: $error';
  }

  @override
  String get settingsTitle => 'Indstillinger';

  @override
  String get licensesTitle => 'Licenser';

  @override
  String get licensesSubtitle => 'Appens licenser til åben kildekode';

  @override
  String get gplLicenseTitle => 'GPL-3.0-licenstekst';

  @override
  String get sourceCodeTitle => 'Kildekode (GitHub)';

  @override
  String get privacyPolicyTitle => 'Privatlivspolitik';

  @override
  String get adConsentTitle => 'Privatlivsindstillinger';

  @override
  String get imprintTitle => 'Udgiveroplysninger';

  @override
  String get linkOpenError => 'Linket kunne ikke åbnes.';

  @override
  String get muteTooltip => 'Om at fjerne lyd';

  @override
  String get muteInfoContent =>
      'Fjerner lyden helt fra den konverterede video.\n\nNyttigt til f.eks. at fjerne baggrundsstøj eller reducere filstørrelsen.';

  @override
  String estimatedSize(String size) {
    return 'Anslået størrelse: $size MB';
  }

  @override
  String get convertButton => 'Konvertér';

  @override
  String get crfLabel => 'Videokvalitet (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Videokvalitet';

  @override
  String get crfInfoContent =>
      '0 → tabsfri (meget stor fil)\n18 → visuelt næsten tabsfri\n23 → standard (god balance)\n28 → synligt kvalitetstab\n51 → laveste kvalitet\n\nAnbefalet: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → tabsfri (meget stor fil)\n25 → visuelt næsten tabsfri\n30 → standard (god balance)\n38 → synligt kvalitetstab\n63 → laveste kvalitet\n\nAnbefalet: 25–38\n\nVP9 og AV1 bruger en skala fra 0–63: Den samme værdi svarer til en anden kvalitet end med H.264/H.265.';

  @override
  String get resolutionLabel => 'Opløsning';

  @override
  String get resolutionInfoTitle => 'Almindelige opløsninger';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTip: Lad ét felt stå tomt = det andet beregnes ud fra billedformatet.';

  @override
  String get widthLabel => 'Bredde';

  @override
  String get heightLabel => 'Højde';

  @override
  String get emptyEqualsOriginal => 'Tomt = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Billeder pr. sekund';

  @override
  String get fpsInfoContent =>
      'Orig  → Behold originalvideoens billedhastighed\n24    → Biografstandard\n25    → PAL/TV-standard (Europa)\n30    → NTSC/TV, sociale medier\n60    → Flydende, spil, sport';

  @override
  String get audioBitrateLabel => 'Lydbitrate';

  @override
  String get silent => 'Uden lyd';

  @override
  String get audioBitrateInfoContent =>
      'Uden lyd → ingen lyd\n64 kbps  → tale, podcasts\n96 kbps  → god talekvalitet\n128 kbps → standard til musik\n192 kbps → høj lydkvalitet\n320 kbps → højeste MP3-kvalitet';

  @override
  String get audioCodecLabel => 'Lydcodec';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → bedste kompatibilitet og normalt hurtigere kodning\nH.265 → mindre filer med tilsvarende kvalitet, langsommere kodning\nVP9 → effektiv åben codec til WebM og MKV, langsommere softwarekodning\nAV1 → moderne codec til små filer, kun softwarekodning\nXvid → ældre MPEG-4-codec til AVI og ældre afspillere\n\nOutputformaterne nedenfor aktiveres ud fra de valgte video- og lydcodecs.';

  @override
  String get xvidLegacyLabel => 'Xvid (ældre)';

  @override
  String get av1SlowHint =>
      'AV1 bruger kun softwarekodning og er meget langsommere end H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Ved opløsninger over 720p kan du overveje at nedskalere først.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard til MP4, bedste kompatibilitet\nMP3 → udbredt ældre codec\nOpus → moderne og effektiv, ideel til WebM og MKV\nAC3 → Dolby Digital, vises kun for kilder med surroundlyd (≥ 3 kanaler)\nVorbis → åben codec til WebM og MKV\n\nInkompatible outputformater deaktiveres automatisk.';

  @override
  String get outputFormatLabel => 'Outputformat';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universelt, bedste kompatibilitet\nMKV → fleksibel container til alle tilgængelige codecs\nMOV → Apple/QuickTime-arbejdsgange\nAVI → ældre format med Xvid\nMPEG-TS → transportstrøm til TV og streaming\nWebM → moderne webformat med VP9 og Opus eller Vorbis\n\nInkompatible formater vises nedtonet. Hvis du vælger et, bruges formatets standardvideocodec automatisk og om nødvendigt en kompatibel lydcodec.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec understøttes af: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Outputformatet er ændret til $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Hvad betyder opløsningerne?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → meget lille fil,\nf.eks. til WhatsApp\n\n480p  (854×480)   → standardopløsning (SD)\n\n720p  (1280×720)  → HD, velegnet til mobilenheder\n\n1080p (1920×1080) → Full HD, standard til\n                          YouTube og TV\n\nHøj/Middel/Lav beskriver kvaliteten ved samme opløsning — højere = større fil.';

  @override
  String get resolutionTooltip => 'Om opløsninger';

  @override
  String get trimArea => 'Trimningsområde';

  @override
  String trimStartLabel(String time) {
    return 'Start: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Slut: $time';
  }

  @override
  String get adLoading => 'Indlæser reklame…';

  @override
  String get convertedPrefix => 'konverteret_';

  @override
  String get removeAdsTitle => 'Fjern reklamer';

  @override
  String removeAdsSubtitle(String price) {
    return 'Engangskøb – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Reklamefri ✓';

  @override
  String get removeAdsActiveSubtitle => 'Tak for din støtte!';

  @override
  String get restorePurchasesTitle => 'Gendan køb';

  @override
  String get purchaseButton => 'Køb';

  @override
  String get purchaseError => 'Købet mislykkedes. Prøv igen.';

  @override
  String get purchaseSuccess => 'Tak! Reklamer er nu deaktiveret.';

  @override
  String get appName => 'Videokonverter';

  @override
  String get audioOnly => 'Kun lyd';

  @override
  String get audioOnlyTooltip => 'Om Kun lyd';

  @override
  String get audioOnlyInfoContent =>
      'Udtrækker kun lydsporet fra videoen — uden billede.\n\nNormal tilstand: MP3 med 192 kbps.\nEksperttilstand: Codec og bitrate fra lydindstillingerne.\n\nNyttigt til f.eks. at gemme musik eller podcasts fra videoer.';

  @override
  String get aspectLocked => 'Billedformatet er låst';

  @override
  String get aspectUnlocked => 'Billedformatet er låst op';

  @override
  String get cpuWarningTitle => 'Stor fil';

  @override
  String get cpuWarningContent =>
      'Denne video er længere end 5 minutter. På ældre enheder kan konverteringen belaste processoren meget — det er normalt.\n\nDu kan bare lægge telefonen fra dig. Appen fortsætter i baggrunden.';

  @override
  String get cpuWarningCheckbox => 'Vis ikke igen';

  @override
  String get storageWarningTitle => 'Ikke nok lagerplads';

  @override
  String storageWarningContent(String available, String required) {
    return 'Din enhed har kun $available MB ledig plads. Konverteringen kræver cirka $required MB. Frigør først noget plads.';
  }

  @override
  String get feedbackTitle => 'Feedback og support';

  @override
  String get feedbackSubtitle => 'Send fejlrapporter, forslag eller feedback';

  @override
  String get feedbackCategoryLabel => 'Kategori';

  @override
  String get feedbackCategoryBug => 'Rapportér en fejl';

  @override
  String get feedbackCategoryFeature => 'Funktionsønske';

  @override
  String get feedbackCategoryFeedback => 'Generel feedback';

  @override
  String get feedbackMessageHint => 'Beskriv dit problem…';

  @override
  String get feedbackSendButton => 'Send';

  @override
  String get notificationPermissionTitle => 'Konvertering i baggrunden';

  @override
  String get notificationPermissionContent =>
      'Tillad notifikationer, så konverteringen kan fortsætte, mens du bruger andre apps. Ellers skal appen forblive åben.';

  @override
  String get notificationPermissionNotNow => 'Ikke nu';

  @override
  String get notificationPermissionAllow => 'Tillad';

  @override
  String get notificationPermissionDenied =>
      'Aktivér notifikationer i Indstillinger for at konvertere i baggrunden.';

  @override
  String get notificationPermissionOpenSettings => 'Indstillinger';

  @override
  String get backButton => 'Tilbage';

  @override
  String get appSettingsTitle => 'Appindstillinger';

  @override
  String get appSettingsSubtitle =>
      'Automatisk lagring og privatlivsindstillinger';

  @override
  String get openSourceTitle => 'Åben kildekode';

  @override
  String get openSourceSubtitle => 'Licenser og kildekode';

  @override
  String get openSourceLicensesTitle => 'Licenser til åben kildekode';

  @override
  String get legalSectionTitle => 'Juridiske oplysninger';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Kodningstilstand';

  @override
  String get encodingModeCrf => 'Kvalitet (CRF)';

  @override
  String get encodingModeBitrate => 'Bitrate';

  @override
  String get audioChannelsLabel => 'Lydkanaler';

  @override
  String get audioChannelsInfoContent =>
      'Original → behold kildens kanalopsætning\nStereo → 2.0 (nedmikses om nødvendigt)\nMono → 1 kanal (mindste fil)\n5.1 → 6-kanals surroundlyd (kun for kilder med surroundlyd)\n\nNedmiksning (f.eks. 5.1 → Stereo) understøttes. Opmiksning tilbydes ikke.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Målbitrate';

  @override
  String get targetBitrateInfoTitle => 'Målbitrate';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → kraftig komprimering, beskedapps\n4–8 Mbps → standard/god kvalitet ved 1080p\n12 Mbps → høj kvalitet ved 1080p / lav kvalitet ved 4K\n20 Mbps → streamingkvalitet i 4K\n\nTilpasset værdi: brug blyantikonet (500–100000 kbps)\n\nI modsætning til CRF kan kvaliteten variere fra scene til scene. Brug CRF for at få bedre resultater ved samme filstørrelse.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 og AV1 opnår samme kvalitet ved cirka halvdelen af disse bitrater.';

  @override
  String get rateAppTitle => 'Bedøm appen';

  @override
  String get proHintTitle => 'Brug uden reklamer';

  @override
  String get proHintBody =>
      'Med et engangskøb kan du fjerne reklamer fra appen permanent.';

  @override
  String get proHintLater => 'Senere';

  @override
  String get restoreError =>
      'Køb kunne ikke gendannes. Play Butik er ikke tilgængelig i øjeblikket — prøv igen.';

  @override
  String get restoreNoPurchases => 'Ingen tidligere køb fundet.';

  @override
  String get hdrCodecSwitched =>
      'HDR-video registreret — H.265 bruges til denne video, så farverne bevares.';

  @override
  String get themeTitle => 'Udseende';

  @override
  String get themeSubtitle =>
      'Følg systemet, eller vælg et lyst eller mørkt tema';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Lyst';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get targetBitrateEditTooltip => 'Indtast bitrate';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Tilladt interval: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardwarekoder (hurtig)';

  @override
  String get hwEncoderSubtitle =>
      'Meget hurtigere, men kræver cirka dobbelt så høj bitrate for samme kvalitet. Kun i bitratetilstand.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-video — den konverteres med softwarekoderen, så HDR bevares.';

  @override
  String get hwEncoderFallback =>
      'Hardwarekoderen fejlede — konverterer med softwarekoderen i stedet.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format understøttes ikke af hardwarekoderen — dette format konverteres med softwarekoderen.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hardwarekoderen er slået fra — den understøtter kun bitratetilstand.';

  @override
  String get resolutionPresetLabel => 'Forudindstilling';

  @override
  String get resolutionOriginal => 'Original';

  @override
  String get resolutionCustom => 'Tilpasset';

  @override
  String get aspectRatioLabel => 'Billedformat';

  @override
  String get aspectOriginal => 'Original';

  @override
  String get aspectCustom => 'Tilpasset';

  @override
  String get fitModeLabel => 'Tilpasning';

  @override
  String get fitPad => 'Bjælker';

  @override
  String get fitCrop => 'Beskær';

  @override
  String get fitStretch => 'Stræk';

  @override
  String get fitModeInfoContent =>
      'Det valgte billedformat er anderledes end videoens.\n\nBjælker → hele billedet forbliver synligt, sorte bjælker udfylder resten\nBeskær → midten bevares, kanterne skæres væk\nStræk → billedet forvrænges, så det fylder hele rammen';

  @override
  String get deleteOriginal => 'Slet original';

  @override
  String get originalTrashed =>
      'Originalen er flyttet til papirkurven — du kan gendanne den derfra.';

  @override
  String get originalTrashFailed => 'Originalen kunne ikke slettes.';

  @override
  String get burnInSubtitlesLabel => 'Tilføj undertekster';

  @override
  String get burnInSubtitlesInfoContent =>
      'Indbrændt: Underteksterne bliver en fast del af videobilledet. De er synlige i alle afspillere og kan ikke slås fra senere. I videoer, der forbliver i HDR, kan de se meget lyse ud.\n\nValgfrit spor: Underteksterne tilføjes som et separat spor, der kan slås til og fra i afspilleren. Ikke alle afspillere viser dem, og de går ofte tabt, når videoen deles. Ikke tilgængeligt for AVI og MPEG-TS.\n\nUnderstøtter SRT- og ASS-filer. ASS-formatering og -placeringer bevares fuldt ud ved valget Indbrændt og i MKV-filer. Andre formater bevarer kun dele af formateringen og ingen placeringer.';

  @override
  String get subtitleModeBurnIn => 'Indbrændt';

  @override
  String get subtitleModeTrack => 'Valgfrit spor';

  @override
  String get subtitleTrackEmpty =>
      'Der er ingen undertekster i den valgte del af videoen.';

  @override
  String get burnInSubtitlesSelect => 'Vælg SRT- eller ASS-fil';

  @override
  String get burnInSubtitlesRemove => 'Fjern undertekstfil';

  @override
  String get burnInSubtitlesUnsupported => 'Vælg en .srt- eller .ass-fil.';

  @override
  String get burnInSubtitlesInvalid =>
      'Denne undertekstfil kunne ikke læses eller indeholder ingen gyldige undertekster.';

  @override
  String get burnInSubtitlesMissing =>
      'Undertekstfilen er ikke længere tilgængelig. Vælg den igen.';

  @override
  String get subtitleTextSizeLabel => 'Tekststørrelse';

  @override
  String get subtitleTextSizeSmall => 'Lille';

  @override
  String get subtitleTextSizeMedium => 'Mellem';

  @override
  String get subtitleTextSizeLarge => 'Stor';

  @override
  String get subtitlePositionLabel => 'Placering';

  @override
  String get subtitlePositionBottom => 'Nederst';

  @override
  String get subtitlePositionTop => 'Øverst';

  @override
  String get subtitleBackgroundTitle => 'Grå baggrund';
}
