// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get qualityLabel => 'Kwaliteit';

  @override
  String get quality2160pHigh => '2160p Hoog';

  @override
  String get quality2160pMedium => '2160p Gemiddeld';

  @override
  String get quality2160pLow => '2160p Laag';

  @override
  String get quality2160pVeryLow => '2160p Zeer laag';

  @override
  String get quality1440pHigh => '1440p Hoog';

  @override
  String get quality1440pMedium => '1440p Gemiddeld';

  @override
  String get quality1440pLow => '1440p Laag';

  @override
  String get quality1440pVeryLow => '1440p Zeer laag';

  @override
  String get quality1080pHigh => '1080p Hoog';

  @override
  String get quality1080pMedium => '1080p Gemiddeld';

  @override
  String get quality1080pLow => '1080p Laag';

  @override
  String get quality1080pVeryLow => '1080p Zeer laag';

  @override
  String get quality720pHigh => '720p Hoog';

  @override
  String get quality720pMedium => '720p Gemiddeld';

  @override
  String get quality720pLow => '720p Laag';

  @override
  String get quality720pVeryLow => '720p Zeer laag';

  @override
  String get quality480pHigh => '480p Hoog';

  @override
  String get quality480pMedium => '480p Gemiddeld';

  @override
  String get quality480pLow => '480p Laag';

  @override
  String get quality480pVeryLow => '480p Zeer laag';

  @override
  String get quality360pHigh => ' 360p Hoog';

  @override
  String get quality360pMedium => '360p Gemiddeld';

  @override
  String get quality360pLow => '360p Laag';

  @override
  String get quality360pVeryLow => '360p Zeer laag';

  @override
  String get mute => 'Dempen';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Video selecteren';

  @override
  String get videoLoading => 'Video wordt geladen…';

  @override
  String get modeNormal => 'Normaal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Selecteer een geldig videobestand.';

  @override
  String get fileLoadError =>
      'Het bestand kon niet worden geladen. Selecteer een videobestand.';

  @override
  String get previewNotAvailable =>
      'Voorbeeld niet beschikbaar. De video kan toch worden geconverteerd.';

  @override
  String get previewNotAvailableLabel =>
      'Voorbeeld niet beschikbaar\n(resolutie te hoog voor dit apparaat)';

  @override
  String get noVideoLoaded => 'Laad eerst een video.';

  @override
  String get cancelConversionTitle => 'Conversie annuleren?';

  @override
  String get cancelConversionContent =>
      'De tot nu toe uitgevoerde bewerkingen gaan verloren.';

  @override
  String get continueConversion => 'Doorgaan';

  @override
  String get cancel => 'Annuleren';

  @override
  String get discardVideoTitle => 'Video verwijderen?';

  @override
  String get discardVideoContent =>
      'De geconverteerde video wordt verwijderd en niet opgeslagen.';

  @override
  String get keep => 'Bewaren';

  @override
  String get discard => 'Verwerpen';

  @override
  String get save => 'Opslaan';

  @override
  String get saveVideoDialogTitle => 'Video opslaan';

  @override
  String get savedSuccess => 'Opgeslagen!';

  @override
  String get open => 'Openen';

  @override
  String get openGallery => 'Galerij openen';

  @override
  String get openVideo => 'Video openen';

  @override
  String get autoSaveTitle => 'Video\'s automatisch opslaan in galerij';

  @override
  String get autoSaveSubtitle =>
      'Video\'s worden na conversie automatisch opgeslagen.';

  @override
  String get videoCodecTitle => 'Videocodec';

  @override
  String get videoCodecSubtitle =>
      'Videocodec voor conversies in de normale modus';

  @override
  String get videoCodecInfoTitle => 'H.264 of H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 biedt de beste compatibiliteit en converteert meestal sneller.\n\nH.265/HEVC kan bij een vergelijkbare beeldkwaliteit kleinere bestanden maken, maar de conversie duurt langer. Oudere apparaten of apps kunnen het resultaat mogelijk niet afspelen.\n\nBeide encoders zijn in de app opgenomen en zijn niet afhankelijk van codecs die op het apparaat zijn geïnstalleerd.';

  @override
  String get saveError =>
      'Fout bij opslaan. Mogelijk onvoldoende opslagruimte.';

  @override
  String get saveErrorOutOfMemory =>
      'Er is onvoldoende geheugen om dit bestand op te slaan. Probeer een korter fragment of een lagere kwaliteit.';

  @override
  String get conversionDone => 'Klaar!';

  @override
  String conversionProgress(String percent) {
    return 'Conversie: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Conversie mislukt: $error';
  }

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get licensesTitle => 'Licenties';

  @override
  String get licensesSubtitle => 'Open-source-licenties van deze app';

  @override
  String get gplLicenseTitle => 'GPL-3.0-licentietekst';

  @override
  String get sourceCodeTitle => 'Broncode (GitHub)';

  @override
  String get privacyPolicyTitle => 'Privacyverklaring';

  @override
  String get adConsentTitle => 'Privacy-instellingen';

  @override
  String get imprintTitle => 'Colofon';

  @override
  String get linkOpenError => 'Link kon niet worden geopend.';

  @override
  String get muteTooltip => 'Uitleg over dempen';

  @override
  String get muteInfoContent =>
      'Verwijdert het geluid volledig uit de geconverteerde video.\n\nHandig om bijvoorbeeld achtergrondgeluiden te verwijderen of de bestandsgrootte te verkleinen.';

  @override
  String estimatedSize(String size) {
    return 'Geschatte grootte: $size MB';
  }

  @override
  String get convertButton => 'Converteren';

  @override
  String get crfLabel => 'Videokwaliteit (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Videokwaliteit';

  @override
  String get crfInfoContent =>
      '0 → verliesvrij (zeer groot bestand)\n18 → visueel vrijwel verliesvrij\n23 → Standaard (goede balans)\n28 → zichtbare kwaliteitsverlies\n51 → laagste kwaliteit\n\nAanbeveling: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → verliesvrij (zeer groot bestand)\n25 → visueel vrijwel verliesvrij\n30 → standaard (goede balans)\n38 → zichtbaar kwaliteitsverlies\n63 → laagste kwaliteit\n\nAanbeveling: 25–38\n\nVP9 en AV1 gebruiken een schaal van 0–63: dezelfde waarde komt overeen met een andere kwaliteit dan bij H.264/H.265.';

  @override
  String get resolutionLabel => 'Resolutie';

  @override
  String get resolutionInfoTitle => 'Gangbare resoluties';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nTip: Laat één veld leeg = het andere wordt proportioneel berekend.';

  @override
  String get widthLabel => 'Breedte';

  @override
  String get heightLabel => 'Hoogte';

  @override
  String get emptyEqualsOriginal => 'Leeg = origineel';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Frames per seconde';

  @override
  String get fpsInfoContent =>
      'Orig → FPS van de bronvideo behouden\n24 → Bioscoopstandaard\n25 → PAL/tv-standaard (Europa)\n30 → NTSC/tv, sociale media\n60 → Vloeiend, gaming, sport';

  @override
  String get audioBitrateLabel => 'Audiobitsnelheid';

  @override
  String get silent => 'Stil';

  @override
  String get audioBitrateInfoContent =>
      'Stil → geen audio\n64 kbps → spraak, podcasts\n96 kbps → goede spraakkwaliteit\n128 kbps → standaardmuziek\n192 kbps → hoge audiokwaliteit\n320 kbps → maximale MP3-kwaliteit';

  @override
  String get audioCodecLabel => 'Audiocodec';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → beste compatibiliteit en meestal snellere codering\nH.265 → kleinere bestanden bij vergelijkbare kwaliteit, langzamere codering\nVP9 → efficiënte open codec voor WebM en MKV, tragere softwarecodering\nAV1 → beste compressie, alleen softwarecodering, experimenteel\nXvid → oudere MPEG-4-codec voor AVI en oudere spelers\n\nDe beschikbare uitvoerformaten hangen af van de gekozen video- en audiocodecs.';

  @override
  String get xvidLegacyLabel => 'Xvid (legacy)';

  @override
  String get av1SlowHint =>
      'AV1 wordt alleen in software gecodeerd en is veel trager dan H.264/H.265.';

  @override
  String get av1HighResHint => 'Boven 720p kun je beter eerst verkleinen.';

  @override
  String get av1ExperimentalTitle => 'AV1 (experimenteel)';

  @override
  String get av1ExperimentalSubtitle =>
      'Voegt AV1 toe aan de codeckeuze in de normale modus en de expertmodus. Moderne, zeer efficiënte codec die nog niet volledig is getest.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standaard voor MP4, beste compatibiliteit\nMP3 → veelgebruikte legacy-codec\nOpus → modern en efficiënt, ideaal voor WebM en MKV\nAC3 → Dolby Digital, alleen voor surroundbronnen (≥ 3 kanalen)\nVorbis → open codec voor WebM en MKV\n\nNiet-compatibele uitvoerformaten worden automatisch uitgeschakeld.';

  @override
  String get outputFormatLabel => 'Uitvoerformaat';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universeel, beste compatibiliteit\nMKV → flexibele container voor alle aangeboden codecs\nMOV → Apple/QuickTime-workflows\nAVI → legacy-formaat met Xvid\nMPEG-TS → transportstream voor tv en streaming\nWebM → modern webformaat met VP9 en Opus of Vorbis\n\nNiet-compatibele formaten worden gedimd weergegeven. Bij selectie worden automatisch de standaardvideocodec en, indien nodig, een compatibele audiocodec ingesteld.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec wordt ondersteund door: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Het uitvoerformaat is gewijzigd in $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Wat betekenen de resoluties?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → zeer klein bestand,\n bijv. voor WhatsApp\n\n480p (854×480) → Standard Definition (SD)\n\n720p (1280×720) → HD, goed voor mobiele apparaten\n\n1080p (1920×1080) → Full HD, standaard voor\n YouTube & tv\n\nHoog/Gemiddeld/Laag beschrijft de kwaliteit bij dezelfde resolutie — hoger = groter bestand.';

  @override
  String get resolutionTooltip => 'Resoluties uitgelegd';

  @override
  String get trimArea => 'Trimgebied';

  @override
  String trimStartLabel(String time) {
    return 'Begin: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Einde: $time';
  }

  @override
  String get adLoading => 'Advertenties worden geladen…';

  @override
  String get convertedPrefix => 'geconverteerd_';

  @override
  String get removeAdsTitle => 'Advertenties verwijderen';

  @override
  String removeAdsSubtitle(String price) {
    return 'Eenmalige aankoop – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Zonder advertenties ✓';

  @override
  String get removeAdsActiveSubtitle => 'Bedankt voor je steun!';

  @override
  String get restorePurchasesTitle => 'Aankoop herstellen';

  @override
  String get purchaseButton => 'Kopen';

  @override
  String get purchaseError => 'Aankoop mislukt. Probeer het opnieuw.';

  @override
  String get purchaseSuccess => 'Bedankt! Advertenties zijn uitgeschakeld.';

  @override
  String get appName => 'Video Converter';

  @override
  String get audioOnly => 'Alleen audio';

  @override
  String get audioOnlyTooltip => 'Alleen audio uitgelegd';

  @override
  String get audioOnlyInfoContent =>
      'Haal alleen de audiotrack uit de video – geen beeld.\n\nNormale modus: MP3 met 192 kbps.\nExpertmodus: codec en bitsnelheid uit de audio-instellingen.\n\nHandig om bijvoorbeeld muziek of podcasts uit video\'s op te slaan.';

  @override
  String get aspectLocked => 'Beeldverhouding vergrendeld';

  @override
  String get aspectUnlocked => 'Beeldverhouding vrij';

  @override
  String get cpuWarningTitle => 'Groot bestand';

  @override
  String get cpuWarningContent =>
      'Deze video is langer dan 5 minuten. Op oudere apparaten kan de conversie leiden tot een hoge processorbelasting – dit is normaal.\n\nJe kunt de telefoon gewoon opzij leggen, de app blijft op de achtergrond draaien.';

  @override
  String get cpuWarningCheckbox => 'Niet meer weergeven';

  @override
  String get storageWarningTitle => 'Onvoldoende opslagruimte';

  @override
  String storageWarningContent(String available, String required) {
    return 'Je apparaat heeft nog maar $available MB vrij. Voor de conversie is ongeveer $required MB nodig. Maak eerst wat opslagruimte vrij.';
  }

  @override
  String get feedbackTitle => 'Feedback & ondersteuning';

  @override
  String get feedbackSubtitle => 'Bugs, verbeteringen of feedback verzenden';

  @override
  String get feedbackCategoryLabel => 'Categorie';

  @override
  String get feedbackCategoryBug => 'Bug melden';

  @override
  String get feedbackCategoryFeature => 'Verbeteringsvoorstel';

  @override
  String get feedbackCategoryFeedback => 'Algemene feedback';

  @override
  String get feedbackMessageHint => 'Beschrijf je vraag…';

  @override
  String get feedbackSendButton => 'Verzenden';

  @override
  String get notificationPermissionTitle => 'Conversie op de achtergrond';

  @override
  String get notificationPermissionContent =>
      'Sta meldingen toe, zodat de conversie kan doorgaan terwijl je andere apps gebruikt. Zonder deze toestemming moet de app geopend blijven.';

  @override
  String get notificationPermissionNotNow => 'Niet nu';

  @override
  String get notificationPermissionAllow => 'Toestaan';

  @override
  String get notificationPermissionDenied =>
      'Schakel meldingen in via de instellingen voor conversie op de achtergrond.';

  @override
  String get notificationPermissionOpenSettings => 'Instellingen';

  @override
  String get backButton => 'Terug';

  @override
  String get appSettingsTitle => 'App-instellingen';

  @override
  String get appSettingsSubtitle =>
      'Instellingen voor automatisch opslaan en privacy';

  @override
  String get openSourceTitle => 'Open source';

  @override
  String get openSourceSubtitle => 'Licenties en broncode';

  @override
  String get openSourceLicensesTitle => 'Open source-licenties';

  @override
  String get legalSectionTitle => 'Juridisch';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Coderingmodus';

  @override
  String get encodingModeCrf => 'Kwaliteit (CRF)';

  @override
  String get encodingModeBitrate => 'Bitsnelheid';

  @override
  String get audioChannelsLabel => 'Audiokanalen';

  @override
  String get audioChannelsInfoContent =>
      'Origineel → behoud indeling van bronkanalen\nStereo → 2.0 (indien nodig downmixen)\nMono → 1 kanaal (kleinste bestand)\n5.1 → 6-kanaals surround (alleen voor surroundbronnen)\n\nDownmixen (bijv. 5.1 → Stereo) wordt ondersteund. Upmixen wordt niet aangeboden.';

  @override
  String get audioChannelOriginal => 'Origineel';

  @override
  String get targetBitrateLabel => 'Doelbitsnelheid';

  @override
  String get targetBitrateInfoTitle => 'Doelbitsnelheid';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → zware compressie, voor berichtenapps\n4–8 Mbps → normale/goede kwaliteit bij 1080p\n12 Mbps → hoge kwaliteit bij 1080p / lage kwaliteit bij 4K\n20 Mbps → 4K-streamingkwaliteit\n\nEigen waarde: via het potloodpictogram (500–100000 kbps)\n\nIn tegenstelling tot CRF kan de kwaliteit per scène variëren. Gebruik CRF voor betere resultaten bij dezelfde bestandsgrootte.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 en AV1 halen dezelfde kwaliteit met ongeveer de helft van deze bitsnelheden.';

  @override
  String get rateAppTitle => 'De app beoordelen';

  @override
  String get proHintTitle => 'Zonder advertenties gebruiken';

  @override
  String get proHintBody =>
      'Met een eenmalige aankoop verwijder je advertenties voorgoed uit de app.';

  @override
  String get proHintLater => 'Later';

  @override
  String get restoreError =>
      'Aankopen konden niet worden hersteld. De Play Store is momenteel niet beschikbaar. Probeer het later nog eens.';

  @override
  String get restoreNoPurchases => 'Er zijn geen eerdere aankopen gevonden.';

  @override
  String get hdrCodecSwitched =>
      'HDR-video gedetecteerd — voor deze video wordt H.265 gebruikt zodat de kleuren behouden blijven.';

  @override
  String get themeTitle => 'Weergave';

  @override
  String get themeSubtitle => 'Systeeminstelling of een licht/donker thema';

  @override
  String get themeSystem => 'Systeem';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get targetBitrateEditTooltip => 'Bitsnelheid invoeren';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Toegestaan bereik: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardware-encoder (snel)';

  @override
  String get hwEncoderSubtitle =>
      'Veel sneller, maar heeft voor dezelfde kwaliteit ongeveer twee keer zoveel bitsnelheid nodig. Alleen in bitsnelheidmodus.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-video — wordt geconverteerd met de software-encoder zodat HDR behouden blijft.';

  @override
  String get hwEncoderFallback =>
      'Hardware-encoder mislukt — er wordt geconverteerd met de software-encoder.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'De hardware-encoder ondersteunt $format niet — dit formaat wordt geconverteerd met de software-encoder.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hardware-encoder uitgeschakeld — deze ondersteunt alleen de bitsnelheidmodus.';

  @override
  String get resolutionPresetLabel => 'Voorinstelling';

  @override
  String get resolutionOriginal => 'Origineel';

  @override
  String get resolutionCustom => 'Aangepast';
}
