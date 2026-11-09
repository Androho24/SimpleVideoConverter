// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get qualityLabel => 'Kvalitet';

  @override
  String get quality2160pHigh => '2160p Høy';

  @override
  String get quality2160pMedium => '2160p Middels';

  @override
  String get quality2160pLow => '2160p Lav';

  @override
  String get quality2160pVeryLow => '2160p Svært lav';

  @override
  String get quality1440pHigh => '1440p Høy';

  @override
  String get quality1440pMedium => '1440p Middels';

  @override
  String get quality1440pLow => '1440p Lav';

  @override
  String get quality1440pVeryLow => '1440p Svært lav';

  @override
  String get quality1080pHigh => '1080p Høy';

  @override
  String get quality1080pMedium => '1080p Middels';

  @override
  String get quality1080pLow => '1080p Lav';

  @override
  String get quality1080pVeryLow => '1080p Svært lav';

  @override
  String get quality720pHigh => '720p Høy';

  @override
  String get quality720pMedium => '720p Middels';

  @override
  String get quality720pLow => '720p Lav';

  @override
  String get quality720pVeryLow => '720p Svært lav';

  @override
  String get quality480pHigh => '480p Høy';

  @override
  String get quality480pMedium => '480p Middels';

  @override
  String get quality480pLow => '480p Lav';

  @override
  String get quality480pVeryLow => '480p Svært lav';

  @override
  String get quality360pHigh => '360p Høy';

  @override
  String get quality360pMedium => '360p Middels';

  @override
  String get quality360pLow => '360p Lav';

  @override
  String get quality360pVeryLow => '360p Svært lav';

  @override
  String get mute => 'Fjern lyd';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Velg video';

  @override
  String get videoLoading => 'Laster inn video…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Ekspert';

  @override
  String get invalidVideoFile => 'Velg en gyldig videofil.';

  @override
  String get fileLoadError => 'Kunne ikke laste inn filen. Velg en videofil.';

  @override
  String get previewNotAvailable =>
      'Forhåndsvisning er ikke tilgjengelig. Videoen kan fortsatt konverteres.';

  @override
  String get previewNotAvailableLabel =>
      'Forhåndsvisning er ikke tilgjengelig\n(For høy oppløsning for denne enheten)';

  @override
  String get noVideoLoaded => 'Last inn en video først.';

  @override
  String get cancelConversionTitle => 'Avbryte konverteringen?';

  @override
  String get cancelConversionContent =>
      'Fremdriften i konverteringen går tapt.';

  @override
  String get continueConversion => 'Fortsett';

  @override
  String get cancel => 'Avbryt';

  @override
  String get discardVideoTitle => 'Forkaste videoen?';

  @override
  String get discardVideoContent =>
      'Den konverterte videoen blir slettet og ikke lagret.';

  @override
  String get keep => 'Behold';

  @override
  String get discard => 'Forkast';

  @override
  String get save => 'Lagre';

  @override
  String get saveVideoDialogTitle => 'Lagre video';

  @override
  String get savedSuccess => 'Lagret!';

  @override
  String get open => 'Åpne';

  @override
  String get openGallery => 'Åpne galleriet';

  @override
  String get openVideo => 'Åpne video';

  @override
  String get autoSaveTitle => 'Lagre videoer automatisk i galleriet';

  @override
  String get autoSaveSubtitle =>
      'Videoer lagres automatisk etter konvertering.';

  @override
  String get videoCodecTitle => 'Videokodek';

  @override
  String get videoCodecSubtitle => 'Videokodek for konvertering i normalmodus';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC eller AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 gir best kompatibilitet og konverterer vanligvis raskere.\n\nH.265/HEVC kan gi mindre filer med tilsvarende bildekvalitet, men konverteringen tar lengre tid. Eldre enheter eller apper kan ha problemer med å spille av resultatet.\n\nAV1 er en moderne kodek utviklet for små filer. Eldre enheter og apper kan ofte ikke spille av resultatet.\n\nAlle enkodere er inkludert i appen og er ikke avhengige av kodeker som er installert på enheten.';

  @override
  String get saveError =>
      'Kunne ikke lagre. Det kan være for lite lagringsplass.';

  @override
  String get saveErrorOutOfMemory =>
      'Ikke nok minne til å lagre denne filen. Prøv et kortere klipp eller lavere kvalitet.';

  @override
  String get conversionDone => 'Ferdig!';

  @override
  String conversionProgress(String percent) {
    return 'Konverterer: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konverteringen mislyktes: $error';
  }

  @override
  String get settingsTitle => 'Innstillinger';

  @override
  String get licensesTitle => 'Lisenser';

  @override
  String get licensesSubtitle => 'Lisenser for åpen kildekode i denne appen';

  @override
  String get gplLicenseTitle => 'GPL-3.0-lisenstekst';

  @override
  String get sourceCodeTitle => 'Kildekode (GitHub)';

  @override
  String get privacyPolicyTitle => 'Personvernerklæring';

  @override
  String get adConsentTitle => 'Personverninnstillinger';

  @override
  String get imprintTitle => 'Utgiverinformasjon';

  @override
  String get linkOpenError => 'Kunne ikke åpne lenken.';

  @override
  String get muteTooltip => 'Om å fjerne lyd';

  @override
  String get muteInfoContent =>
      'Fjerner all lyd fra den konverterte videoen.\n\nNyttig for eksempel for å fjerne bakgrunnsstøy eller redusere filstørrelsen.';

  @override
  String estimatedSize(String size) {
    return 'Anslått størrelse: $size MB';
  }

  @override
  String get convertButton => 'Konverter';

  @override
  String get crfLabel => 'Videokvalitet (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Videokvalitet';

  @override
  String get crfInfoContent =>
      '0 → tapsfri (svært stor fil)\n18 → nesten uten synlig kvalitetstap\n23 → standard (god balanse)\n28 → synlig kvalitetstap\n51 → laveste kvalitet\n\nAnbefalt: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → tapsfri (svært stor fil)\n25 → nesten uten synlig kvalitetstap\n30 → standard (god balanse)\n38 → synlig kvalitetstap\n63 → laveste kvalitet\n\nAnbefalt: 25–38\n\nVP9 og AV1 bruker en skala fra 0–63: Den samme verdien gir en annen kvalitet enn med H.264/H.265.';

  @override
  String get resolutionLabel => 'Oppløsning';

  @override
  String get resolutionInfoTitle => 'Vanlige oppløsninger';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTips: La ett felt stå tomt = den andre verdien beregnes med samme sideforhold.';

  @override
  String get widthLabel => 'Bredde';

  @override
  String get heightLabel => 'Høyde';

  @override
  String get emptyEqualsOriginal => 'Tomt = original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Bilder per sekund';

  @override
  String get fpsInfoContent =>
      'Orig  → Behold originalens bildefrekvens\n24    → Kinostandard\n25    → PAL/TV-standard (Europa)\n30    → NTSC/TV, sosiale medier\n60    → Jevn avspilling, spill, sport';

  @override
  String get audioBitrateLabel => 'Lydbithastighet';

  @override
  String get silent => 'Uten lyd';

  @override
  String get audioBitrateInfoContent =>
      'Uten lyd → ingen lyd\n64 kbps  → tale, podkaster\n96 kbps  → god talekvalitet\n128 kbps → standard for musikk\n192 kbps → høy lydkvalitet\n320 kbps → høyeste MP3-kvalitet';

  @override
  String get audioCodecLabel => 'Lydkodek';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → best kompatibilitet og vanligvis raskere koding\nH.265 → mindre filer med tilsvarende kvalitet, tregere koding\nVP9 → effektiv åpen kodek for WebM og MKV, tregere programvarekoding\nAV1 → moderne kodek for små filer, kun programvarekoding\nXvid → eldre MPEG-4-kodek for AVI og eldre avspillere\n\nUtdataformatene nedenfor aktiveres ut fra valgte video- og lydkodeker.';

  @override
  String get xvidLegacyLabel => 'Xvid (eldre)';

  @override
  String get av1SlowHint =>
      'AV1 bruker kun programvarekoding og er mye tregere enn H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Ved oppløsninger over 720p bør du vurdere å redusere oppløsningen først.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard for MP4, best kompatibilitet\nMP3 → mye brukt eldre kodek\nOpus → moderne og effektiv, ideell for WebM og MKV\nAC3 → Dolby Digital, vises kun for kilder med surroundlyd (≥ 3 kanaler)\nVorbis → åpen kodek for WebM og MKV\n\nInkompatible utdataformater deaktiveres automatisk.';

  @override
  String get outputFormatLabel => 'Utdataformat';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universelt, best kompatibilitet\nMKV → fleksibelt beholderformat for alle tilgjengelige kodeker\nMOV → arbeidsflyter med Apple/QuickTime\nAVI → eldre format som bruker Xvid\nMPEG-TS → transportstrøm for TV og strømming\nWebM → moderne nettformat som bruker VP9 med Opus eller Vorbis\n\nInkompatible formater vises nedtonet. Hvis du velger et av dem, brukes formatets standardvideokodek automatisk, og ved behov en kompatibel lydkodek.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec støttes av: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Utdataformatet er endret til $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Hva betyr oppløsningene?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → svært liten fil,\nf.eks. for WhatsApp\n\n480p  (854×480)   → standardoppløsning (SD)\n\n720p  (1280×720)  → HD, egnet for mobilenheter\n\n1080p (1920×1080) → Full HD, standard for\n                          YouTube og TV\n\nHøy/Middels/Lav beskriver kvaliteten ved samme oppløsning — høyere = større fil.';

  @override
  String get resolutionTooltip => 'Om oppløsninger';

  @override
  String get trimArea => 'Trimmeområde';

  @override
  String trimStartLabel(String time) {
    return 'Start: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Slutt: $time';
  }

  @override
  String get adLoading => 'Laster inn annonse…';

  @override
  String get convertedPrefix => 'konvertert_';

  @override
  String get removeAdsTitle => 'Fjern annonser';

  @override
  String removeAdsSubtitle(String price) {
    return 'Engangskjøp – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Annonsefri ✓';

  @override
  String get removeAdsActiveSubtitle => 'Takk for støtten!';

  @override
  String get restorePurchasesTitle => 'Gjenopprett kjøp';

  @override
  String get purchaseButton => 'Kjøp';

  @override
  String get purchaseError => 'Kjøpet mislyktes. Prøv igjen.';

  @override
  String get purchaseSuccess => 'Takk! Annonser er nå deaktivert.';

  @override
  String get appName => 'Videokonverter';

  @override
  String get audioOnly => 'Kun lyd';

  @override
  String get audioOnlyTooltip => 'Om kun lyd';

  @override
  String get audioOnlyInfoContent =>
      'Trekker kun ut lydsporet fra videoen — uten bilde.\n\nNormalmodus: MP3 med 192 kbps.\nEkspertmodus: Kodek og bithastighet fra lydinnstillingene.\n\nNyttig for eksempel for å lagre musikk eller podkaster fra videoer.';

  @override
  String get aspectLocked => 'Sideforhold låst';

  @override
  String get aspectUnlocked => 'Sideforhold ulåst';

  @override
  String get cpuWarningTitle => 'Stor fil';

  @override
  String get cpuWarningContent =>
      'Denne videoen er lengre enn 5 minutter. På eldre enheter kan konverteringen gi høy prosessorbruk — det er normalt.\n\nDu kan bare legge telefonen til side. Appen fortsetter å kjøre i bakgrunnen.';

  @override
  String get cpuWarningCheckbox => 'Ikke vis igjen';

  @override
  String get storageWarningTitle => 'Ikke nok lagringsplass';

  @override
  String storageWarningContent(String available, String required) {
    return 'Enheten har bare $available MB ledig. Konverteringen trenger omtrent $required MB. Frigjør litt plass først.';
  }

  @override
  String get feedbackTitle => 'Tilbakemelding og støtte';

  @override
  String get feedbackSubtitle =>
      'Send feilrapporter, forslag eller tilbakemeldinger';

  @override
  String get feedbackCategoryLabel => 'Kategori';

  @override
  String get feedbackCategoryBug => 'Rapporter en feil';

  @override
  String get feedbackCategoryFeature => 'Ønsk en funksjon';

  @override
  String get feedbackCategoryFeedback => 'Generell tilbakemelding';

  @override
  String get feedbackMessageHint => 'Beskriv problemet ditt…';

  @override
  String get feedbackSendButton => 'Send';

  @override
  String get notificationPermissionTitle => 'Konvertering i bakgrunnen';

  @override
  String get notificationPermissionContent =>
      'Tillat varsler slik at konverteringen kan fortsette mens du bruker andre apper. Uten denne tillatelsen må appen være åpen.';

  @override
  String get notificationPermissionNotNow => 'Ikke nå';

  @override
  String get notificationPermissionAllow => 'Tillat';

  @override
  String get notificationPermissionDenied =>
      'Slå på varsler i innstillingene for å konvertere i bakgrunnen.';

  @override
  String get notificationPermissionOpenSettings => 'Innstillinger';

  @override
  String get backButton => 'Tilbake';

  @override
  String get appSettingsTitle => 'Appinnstillinger';

  @override
  String get appSettingsSubtitle =>
      'Automatisk lagring og personverninnstillinger';

  @override
  String get openSourceTitle => 'Åpen kildekode';

  @override
  String get openSourceSubtitle => 'Lisenser og kildekode';

  @override
  String get openSourceLicensesTitle => 'Lisenser for åpen kildekode';

  @override
  String get legalSectionTitle => 'Juridisk informasjon';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Kodingsmodus';

  @override
  String get encodingModeCrf => 'Kvalitet (CRF)';

  @override
  String get encodingModeBitrate => 'Bithastighet';

  @override
  String get audioChannelsLabel => 'Lydkanaler';

  @override
  String get audioChannelsInfoContent =>
      'Original → behold kildens kanaloppsett\nStereo → 2.0 (nedmiksing ved behov)\nMono → 1 kanal (minste fil)\n5.1 → 6-kanals surroundlyd (kun for kilder med surroundlyd)\n\nNedmiksing (f.eks. 5.1 → Stereo) støttes. Oppmiksing tilbys ikke.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Målbithastighet';

  @override
  String get targetBitrateInfoTitle => 'Målbithastighet';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → kraftig komprimering, meldingsapper\n4–8 Mbps → standard/god kvalitet ved 1080p\n12 Mbps → høy kvalitet ved 1080p / lav kvalitet ved 4K\n20 Mbps → strømmekvalitet for 4K\n\nEgendefinert verdi: bruk blyantikonet (500–100000 kbps)\n\nI motsetning til CRF kan kvaliteten variere fra scene til scene. Bruk CRF for bedre resultater med samme filstørrelse.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 og AV1 oppnår samme kvalitet med omtrent halvparten av disse bithastighetene.';

  @override
  String get rateAppTitle => 'Vurder appen';

  @override
  String get proHintTitle => 'Bruk uten annonser';

  @override
  String get proHintBody =>
      'Med et engangskjøp kan du fjerne annonser fra appen permanent.';

  @override
  String get proHintLater => 'Senere';

  @override
  String get restoreError =>
      'Kunne ikke gjenopprette kjøp. Play-butikken er utilgjengelig for øyeblikket — prøv igjen.';

  @override
  String get restoreNoPurchases => 'Fant ingen tidligere kjøp.';

  @override
  String get hdrCodecSwitched =>
      'HDR-video oppdaget — H.265 brukes for denne videoen slik at fargene bevares.';

  @override
  String get themeTitle => 'Utseende';

  @override
  String get themeSubtitle =>
      'Følg systemet eller velg et lyst eller mørkt tema';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Lyst';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get targetBitrateEditTooltip => 'Angi bithastighet';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Tillatt område: $range';
  }

  @override
  String get hwEncoderTitle => 'Maskinvareenkoder (rask)';

  @override
  String get hwEncoderSubtitle =>
      'Mye raskere, men trenger omtrent dobbelt så høy bithastighet for samme kvalitet. Kun i bithastighetsmodus.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-video — den konverteres med programvareenkoderen slik at HDR bevares.';

  @override
  String get hwEncoderFallback =>
      'Maskinvareenkoderen mislyktes — konverterer med programvareenkoderen i stedet.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format støttes ikke av maskinvareenkoderen — dette formatet konverteres med programvareenkoderen.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Maskinvareenkoderen er slått av — den støtter kun bithastighetsmodus.';

  @override
  String get resolutionPresetLabel => 'Forhåndsvalg';

  @override
  String get resolutionOriginal => 'Original';

  @override
  String get resolutionCustom => 'Egendefinert';

  @override
  String get aspectRatioLabel => 'Sideforhold';

  @override
  String get aspectOriginal => 'Original';

  @override
  String get aspectCustom => 'Egendefinert';

  @override
  String get fitModeLabel => 'Tilpasning';

  @override
  String get fitPad => 'Svarte felt';

  @override
  String get fitCrop => 'Beskjær';

  @override
  String get fitStretch => 'Strekk';

  @override
  String get fitModeInfoContent =>
      'Målformatet har et annet sideforhold enn videoen.\n\nSvarte felt → hele bildet er synlig, svarte felt fyller resten\nBeskjær → midten beholdes, kantene fjernes\nStrekk → bildet forvrenges for å fylle rammen';

  @override
  String get deleteOriginal => 'Slett originalen';

  @override
  String get originalTrashed =>
      'Originalen er flyttet til papirkurven — du kan gjenopprette den derfra.';

  @override
  String get originalTrashFailed => 'Kunne ikke slette originalen.';

  @override
  String get burnInSubtitlesLabel => 'Legg til undertekster';

  @override
  String get burnInSubtitlesInfoContent =>
      'Innbrent: Undertekstene blir en del av videobildet. De vises i alle avspillere og kan ikke slås av senere. I videoer som forblir i HDR, kan de se svært lyse ut.\n\nValgfritt spor: Undertekstene legges til som et eget spor som kan slås av eller på i avspilleren. Ikke alle avspillere viser dem, og de går ofte tapt når videoen deles. Ikke tilgjengelig for AVI og MPEG-TS.\n\nStøtter SRT- og ASS-filer. ASS-stiler og plasseringer beholdes fullt ut i modusen Innbrent og i MKV-filer. Andre formater beholder bare deler av stilene og ingen plasseringer.';

  @override
  String get subtitleModeBurnIn => 'Innbrent';

  @override
  String get subtitleModeTrack => 'Valgfritt spor';

  @override
  String get subtitleTrackEmpty =>
      'Det er ingen undertekster i den valgte delen av videoen.';

  @override
  String get sharedVideoBusy =>
      'Fullfør først den pågående konverteringen, og del deretter videoen på nytt.';

  @override
  String get burnInSubtitlesSelect => 'Velg SRT- eller ASS-fil';

  @override
  String get burnInSubtitlesRemove => 'Fjern undertekstfil';

  @override
  String get burnInSubtitlesUnsupported => 'Velg en .srt- eller .ass-fil.';

  @override
  String get burnInSubtitlesInvalid =>
      'Denne undertekstfilen kunne ikke leses eller inneholder ingen gyldige undertekster.';

  @override
  String get burnInSubtitlesMissing =>
      'Undertekstfilen er ikke lenger tilgjengelig. Velg den på nytt.';

  @override
  String get subtitleTextSizeLabel => 'Tekststørrelse';

  @override
  String get subtitleTextSizeSmall => 'Liten';

  @override
  String get subtitleTextSizeMedium => 'Middels';

  @override
  String get subtitleTextSizeLarge => 'Stor';

  @override
  String get subtitlePositionLabel => 'Plassering';

  @override
  String get subtitlePositionBottom => 'Nederst';

  @override
  String get subtitlePositionTop => 'Øverst';

  @override
  String get subtitleBackgroundTitle => 'Grå bakgrunn';
}
