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
  String get saveError =>
      'Fout bij opslaan. Mogelijk onvoldoende opslagruimte.';

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
  String get audioCodecInfoContent =>
      'AAC → Standaard voor MP4, beste compatibiliteit\nMP3 → wijdverspreid, enigszins verouderd\nOpus → modern & efficiënt, goed voor MKV';

  @override
  String get outputFormatLabel => 'Uitvoerformaat';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universeel, beste compatibiliteit\nMKV → flexibel, veel codecs, minder compatibel\nMOV → Apple/QuickTime-formaat\nAVI → verouderd, brede compatibiliteit\nTS → MPEG Transport Stream, tv/streaming';

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
  String get appName => 'Video Converter FFmpeg';

  @override
  String get audioOnly => 'Alleen audio';

  @override
  String get audioOnlyTooltip => 'Alleen audio uitgelegd';

  @override
  String get audioOnlyInfoContent =>
      'Haal alleen de audiotrack uit de video – geen beeld.\n\nNormale modus: MP3 met 192 kbps.\nExpertmodus: codec en bitsnelheid uit de audio-instellingen.\n\nHandig om bijvoorbeeld muziek of podcasts uit video\'s op te slaan.';
}
