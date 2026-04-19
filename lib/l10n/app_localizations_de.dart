// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get qualityLabel => 'Qualität';

  @override
  String get quality1080pHigh => '1080p Hoch';

  @override
  String get quality1080pMedium => '1080p Mittel';

  @override
  String get quality1080pLow => '1080p Niedrig';

  @override
  String get quality1080pVeryLow => '1080p Sehr Niedrig';

  @override
  String get quality720pHigh => '720p Hoch';

  @override
  String get quality720pMedium => '720p Mittel';

  @override
  String get quality720pLow => '720p Niedrig';

  @override
  String get quality720pVeryLow => '720p Sehr Niedrig';

  @override
  String get quality480pHigh => '480p Hoch';

  @override
  String get quality480pMedium => '480p Mittel';

  @override
  String get quality480pLow => '480p Niedrig';

  @override
  String get quality480pVeryLow => '480p Sehr Niedrig';

  @override
  String get quality360pHigh => '360p Hoch';

  @override
  String get quality360pMedium => '360p Mittel';

  @override
  String get quality360pLow => '360p Niedrig';

  @override
  String get quality360pVeryLow => '360p Sehr Niedrig';

  @override
  String get mute => 'Stummschalten';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Video auswählen';

  @override
  String get videoLoading => 'Video wird geladen…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Bitte eine gültige Videodatei auswählen.';

  @override
  String get fileLoadError =>
      'Die Datei konnte nicht geladen werden. Bitte eine Videodatei auswählen.';

  @override
  String get previewNotAvailable =>
      'Vorschau nicht verfügbar. Das Video kann trotzdem konvertiert werden.';

  @override
  String get previewNotAvailableLabel =>
      'Vorschau nicht verfügbar\n(Auflösung zu hoch für dieses Gerät)';

  @override
  String get noVideoLoaded => 'Bitte zuerst ein Video laden.';

  @override
  String get cancelConversionTitle => 'Konvertierung abbrechen?';

  @override
  String get cancelConversionContent =>
      'Die bisherige Verarbeitung geht verloren.';

  @override
  String get continueConversion => 'Weiter';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get discardVideoTitle => 'Video verwerfen?';

  @override
  String get discardVideoContent =>
      'Das konvertierte Video wird gelöscht und nicht gespeichert.';

  @override
  String get keep => 'Behalten';

  @override
  String get discard => 'Verwerfen';

  @override
  String get save => 'Speichern';

  @override
  String get saveVideoDialogTitle => 'Video speichern';

  @override
  String get savedSuccess => 'Gespeichert!';

  @override
  String get open => 'Öffnen';

  @override
  String get saveError =>
      'Fehler beim Speichern. Möglicherweise nicht genug Speicherplatz.';

  @override
  String get conversionDone => 'Fertig!';

  @override
  String conversionProgress(String percent) {
    return 'Konvertierung: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konvertierung fehlgeschlagen: $error';
  }

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get licensesTitle => 'Lizenzen';

  @override
  String get licensesSubtitle => 'Open-Source-Lizenzen dieser App';

  @override
  String get gplLicenseTitle => 'GPL-3.0 Lizenztext';

  @override
  String get sourceCodeTitle => 'Quellcode (GitHub)';

  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';

  @override
  String get adConsentTitle => 'Datenschutz-Einstellungen';

  @override
  String get imprintTitle => 'Impressum';

  @override
  String get linkOpenError => 'Link konnte nicht geöffnet werden.';

  @override
  String get muteTooltip => 'Stummschalten erklärt';

  @override
  String get muteInfoContent =>
      'Entfernt den Ton vollständig aus dem konvertierten Video.\n\nNützlich z.B. um Hintergrundgeräusche zu entfernen oder die Dateigröße zu reduzieren.';

  @override
  String estimatedSize(String size) {
    return 'Geschätzte Größe: $size MB';
  }

  @override
  String get convertButton => 'Konvertieren';

  @override
  String get crfLabel => 'Videoqualität (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Videoqualität';

  @override
  String get crfInfoContent =>
      '0 → verlustfrei (sehr große Datei)\n18 → visuell nahezu verlustfrei\n23 → Standard (gute Balance)\n28 → sichtbare Qualitätseinbußen\n51 → niedrigste Qualität\n\nEmpfehlung: 18–28';

  @override
  String get resolutionLabel => 'Auflösung';

  @override
  String get resolutionInfoTitle => 'Gängige Auflösungen';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTipp: Ein Feld leer lassen = das andere wird proportional berechnet.';

  @override
  String get widthLabel => 'Breite';

  @override
  String get heightLabel => 'Höhe';

  @override
  String get emptyEqualsOriginal => 'Leer = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Frames pro Sekunde';

  @override
  String get fpsInfoContent =>
      'Orig  → FPS des Quellvideos beibehalten\n24    → Kino-Standard\n25    → PAL/TV-Standard (Europa)\n30    → NTSC/TV, Social Media\n60    → Flüssig, Gaming, Sport';

  @override
  String get audioBitrateLabel => 'Audio-Bitrate';

  @override
  String get silent => 'Stumm';

  @override
  String get audioBitrateInfoContent =>
      'Stumm    → kein Audio\n64 kbps  → Sprache, Podcasts\n96 kbps  → gute Sprachqualität\n128 kbps → Standard-Musik\n192 kbps → hohe Audioqualität\n320 kbps → maximale MP3-Qualität';

  @override
  String get audioCodecLabel => 'Audio-Codec';

  @override
  String get audioCodecInfoContent =>
      'AAC  → Standard für MP4, beste Kompatibilität\nMP3  → weit verbreitet, leicht veraltet\nOpus → modern & effizient, gut für MKV';

  @override
  String get outputFormatLabel => 'Output-Format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universell, beste Kompatibilität\nMKV → flexibel, viele Codecs, weniger kompatibel\nMOV → Apple/QuickTime-Format\nAVI → veraltet, breite Kompatibilität\nTS  → MPEG Transport Stream, TV/Streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Was bedeuten die Auflösungen?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → sehr kleine Datei,\nz.B. für WhatsApp\n\n480p  (854×480)   → Standard Definition (SD)\n\n720p  (1280×720)  → HD, gut für mobile Geräte\n\n1080p (1920×1080) → Full HD, Standard für\n                          YouTube & TV\n\nHoch/Mittel/Niedrig beschreibt die Qualität bei gleicher Auflösung — höher = größere Datei.';

  @override
  String get resolutionTooltip => 'Auflösungen erklärt';

  @override
  String get trimArea => 'Trim-Bereich';

  @override
  String trimStartLabel(String time) {
    return 'Anfang: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Ende: $time';
  }

  @override
  String get adLoading => 'Werbung wird geladen…';

  @override
  String get convertedPrefix => 'konvertiert_';

  @override
  String get removeAdsTitle => 'Werbung entfernen';

  @override
  String removeAdsSubtitle(String price) {
    return 'Einmaliger Kauf – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Werbefrei ✓';

  @override
  String get removeAdsActiveSubtitle => 'Danke für deine Unterstützung!';

  @override
  String get restorePurchasesTitle => 'Kauf wiederherstellen';

  @override
  String get purchaseButton => 'Kaufen';

  @override
  String get purchaseError => 'Kauf fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get purchaseSuccess => 'Danke! Werbung wurde deaktiviert.';

  @override
  String get appName => 'Video Konverter FFmpeg';

  @override
  String get audioOnly => 'Nur Audio';

  @override
  String get audioOnlyTooltip => 'Nur Audio erklärt';

  @override
  String get audioOnlyInfoContent =>
      'Extrahiert nur die Audiospur aus dem Video – kein Bild.\n\nNormal-Modus: MP3 mit 192 kbps.\nExpert-Modus: Codec und Bitrate aus den Audio-Einstellungen.\n\nNützlich um z.B. Musik oder Podcasts aus Videos zu speichern.';

  @override
  String get aspectLocked => 'Seitenverhältnis gesperrt';

  @override
  String get aspectUnlocked => 'Seitenverhältnis frei';

  @override
  String get cpuWarningTitle => 'Große Datei';

  @override
  String get cpuWarningContent =>
      'Dieses Video ist länger als 5 Minuten. Auf älteren Geräten kann die Konvertierung zu hoher Prozessorauslastung führen – das ist normal.\n\nDu kannst das Handy einfach daneben legen, die App läuft im Hintergrund weiter.';

  @override
  String get cpuWarningCheckbox => 'Nicht mehr anzeigen';

  @override
  String get storageWarningTitle => 'Nicht genug Speicherplatz';

  @override
  String storageWarningContent(String available, String required) {
    return 'Dein Gerät hat nur noch $available MB frei. Für die Konvertierung werden ca. $required MB benötigt. Bitte gib zuerst Speicher frei.';
  }

  @override
  String get feedbackTitle => 'Feedback & Support';

  @override
  String get feedbackSubtitle => 'Bugs, Verbesserungen oder Feedback senden';

  @override
  String get feedbackCategoryLabel => 'Kategorie';

  @override
  String get feedbackCategoryBug => 'Bug melden';

  @override
  String get feedbackCategoryFeature => 'Verbesserungsvorschlag';

  @override
  String get feedbackCategoryFeedback => 'Allgemeines Feedback';

  @override
  String get feedbackMessageHint => 'Beschreibe dein Anliegen…';

  @override
  String get feedbackSendButton => 'Senden';
}
