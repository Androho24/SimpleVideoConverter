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
  String get quality2160pHigh => '2160p hoch';

  @override
  String get quality2160pMedium => '2160p mittel';

  @override
  String get quality2160pLow => '2160p niedrig';

  @override
  String get quality2160pVeryLow => '2160p sehr niedrig';

  @override
  String get quality1440pHigh => '1440p hoch';

  @override
  String get quality1440pMedium => '1440p mittel';

  @override
  String get quality1440pLow => '1440p niedrig';

  @override
  String get quality1440pVeryLow => '1440p sehr niedrig';

  @override
  String get quality1080pHigh => '1080p hoch';

  @override
  String get quality1080pMedium => '1080p mittel';

  @override
  String get quality1080pLow => '1080p niedrig';

  @override
  String get quality1080pVeryLow => '1080p sehr niedrig';

  @override
  String get quality720pHigh => '720p hoch';

  @override
  String get quality720pMedium => '720p mittel';

  @override
  String get quality720pLow => '720p niedrig';

  @override
  String get quality720pVeryLow => '720p sehr niedrig';

  @override
  String get quality480pHigh => '480p hoch';

  @override
  String get quality480pMedium => '480p mittel';

  @override
  String get quality480pLow => '480p niedrig';

  @override
  String get quality480pVeryLow => '480p sehr niedrig';

  @override
  String get quality360pHigh => '360p hoch';

  @override
  String get quality360pMedium => '360p mittel';

  @override
  String get quality360pLow => '360p niedrig';

  @override
  String get quality360pVeryLow => '360p sehr niedrig';

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
  String get openGallery => 'Galerie öffnen';

  @override
  String get openVideo => 'Video öffnen';

  @override
  String get autoSaveTitle => 'Videos automatisch in der Galerie speichern';

  @override
  String get autoSaveSubtitle =>
      'Videos werden nach der Konvertierung automatisch gespeichert.';

  @override
  String get videoCodecTitle => 'Video-Codec';

  @override
  String get videoCodecSubtitle =>
      'Video-Codec für Konvertierungen im normalen Modus';

  @override
  String get videoCodecInfoTitle => 'H.264 oder H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 bietet die beste Kompatibilität und wird meist schneller konvertiert.\n\nH.265/HEVC kann bei vergleichbarer Bildqualität kleinere Dateien erzeugen, benötigt aber länger. Ältere Geräte oder Apps können das Ergebnis möglicherweise nicht abspielen.\n\nBeide Encoder sind in der App enthalten und unabhängig von den auf dem Gerät installierten Codecs.';

  @override
  String get saveError =>
      'Fehler beim Speichern. Möglicherweise nicht genug Speicherplatz.';

  @override
  String get saveErrorOutOfMemory =>
      'Nicht genug Arbeitsspeicher zum Speichern. Versuche es mit einem kürzeren Clip oder niedrigerer Qualität.';

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
  String get crfInfoContentWideScale =>
      '0 → verlustfrei (sehr große Datei)\n25 → visuell nahezu verlustfrei\n30 → Standard (gute Balance)\n38 → sichtbare Qualitätseinbußen\n63 → niedrigste Qualität\n\nEmpfehlung: 25–38\n\nVP9 und AV1 nutzen eine 0–63-Skala: Derselbe Wert entspricht einer anderen Qualität als bei H.264/H.265.';

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
  String get expertVideoCodecInfoContent =>
      'H.264 → beste Kompatibilität und meist schnellere Kodierung\nH.265 → kleinere Dateien bei vergleichbarer Qualität, langsamere Kodierung\nVP9 → effizienter offener Codec für WebM und MKV, langsamere Softwarekodierung\nAV1 → beste Kompression, ausschließlich Softwarekodierung, experimentell\nXvid → älterer MPEG-4-Codec für AVI und ältere Wiedergabegeräte\n\nDie verfügbaren Ausgabeformate richten sich nach dem gewählten Video- und Audio-Codec.';

  @override
  String get xvidLegacyLabel => 'Xvid (Legacy)';

  @override
  String get av1SlowHint =>
      'AV1 wird ausschließlich per Software kodiert und ist deutlich langsamer als H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Oberhalb von 720p lohnt es sich, vorher herunterzuskalieren.';

  @override
  String get av1ExperimentalTitle => 'AV1 (experimentell)';

  @override
  String get av1ExperimentalSubtitle =>
      'Fügt AV1 zur Codec-Auswahl im Normal- und Expertenmodus hinzu. Moderner, hocheffizienter Codec, der noch nicht vollständig erprobt ist.';

  @override
  String get audioCodecInfoContent =>
      'AAC → Standard für MP4, beste Kompatibilität\nMP3 → weit verbreiteter Legacy-Codec\nOpus → modern und effizient, ideal für WebM und MKV\nAC3 → Dolby Digital, nur bei Surround-Quellen (≥ 3 Kanäle) verfügbar\nVorbis → offener Codec für WebM und MKV\n\nNicht kompatible Output-Formate werden automatisch deaktiviert.';

  @override
  String get outputFormatLabel => 'Output-Format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universell, beste Kompatibilität\nMKV → flexibler Container für alle angebotenen Codecs\nMOV → Apple-/QuickTime-Workflows\nAVI → Legacy-Format mit Xvid\nMPEG-TS → Transportstrom für TV und Streaming\nWebM → modernes Webformat mit VP9 und Opus oder Vorbis\n\nNicht kompatible Formate werden gedimmt dargestellt. Bei der Auswahl werden der Standard-Video-Codec und, falls nötig, ein passender Audio-Codec automatisch eingestellt.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec wird unterstützt von: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Output-Format wurde auf $format geändert.';
  }

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
  String get appName => 'Video Konverter';

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

  @override
  String get notificationPermissionTitle => 'Hintergrundkonvertierung';

  @override
  String get notificationPermissionContent =>
      'Erlaube Benachrichtigungen, damit die Konvertierung weiterlaufen kann während du andere Apps nutzt. Ohne diese Berechtigung muss die App geöffnet bleiben.';

  @override
  String get notificationPermissionNotNow => 'Nicht jetzt';

  @override
  String get notificationPermissionAllow => 'Erlauben';

  @override
  String get notificationPermissionDenied =>
      'Aktiviere Benachrichtigungen in den Einstellungen für die Hintergrundkonvertierung.';

  @override
  String get notificationPermissionOpenSettings => 'Einstellungen';

  @override
  String get backButton => 'Zurück';

  @override
  String get appSettingsTitle => 'App-Einstellungen';

  @override
  String get appSettingsSubtitle => 'Autospeichern & Datenschutz';

  @override
  String get openSourceTitle => 'Open Source';

  @override
  String get openSourceSubtitle => 'Lizenzen & Quellcode';

  @override
  String get openSourceLicensesTitle => 'Open Source Lizenzen';

  @override
  String get legalSectionTitle => 'Rechtliches';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Encoding-Modus';

  @override
  String get encodingModeCrf => 'Qualität (CRF)';

  @override
  String get encodingModeBitrate => 'Bitrate';

  @override
  String get audioChannelsLabel => 'Audiokanäle';

  @override
  String get audioChannelsInfoContent =>
      'Original → Kanal-Layout der Quelle beibehalten\nStereo → 2.0 (Downmix falls nötig)\nMono → 1 Kanal (kleinste Datei)\n5.1 → 6-Kanal Surround (nur bei Surround-Quellen)\n\nDownmixing (z. B. 5.1 → Stereo) wird unterstützt. Upmixing wird nicht angeboten.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Ziel-Bitrate';

  @override
  String get targetBitrateInfoTitle => 'Ziel-Bitrate';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → starke Kompression, für Messenger\n4–8 Mbps → normale/gute Qualität bei 1080p\n12 Mbps → hohe Qualität bei 1080p / niedrige Qualität bei 4K\n20 Mbps → 4K-Streaming-Qualität\n\nEigener Wert: über das Stiftsymbol (500–100000 kbps)\n\nIm Gegensatz zu CRF kann die Qualität je nach Szene variieren. Für bessere Ergebnisse bei gleicher Dateigröße CRF verwenden.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 und AV1 erreichen dieselbe Qualität mit etwa der Hälfte dieser Bitraten.';

  @override
  String get rateAppTitle => 'App bewerten';

  @override
  String get proHintTitle => 'Werbefrei nutzen';

  @override
  String get proHintBody =>
      'Entferne Werbung dauerhaft mit einem einmaligen Kauf. Vielen Dank für deine Unterstützung.';

  @override
  String get proHintLater => 'Später';

  @override
  String get restoreError =>
      'Käufe konnten nicht wiederhergestellt werden. Der Play Store ist gerade nicht erreichbar – bitte erneut versuchen.';

  @override
  String get restoreNoPurchases => 'Keine früheren Käufe gefunden.';

  @override
  String get hdrCodecSwitched =>
      'HDR-Video erkannt — für dieses Video wird H.265 verwendet, damit die Farben erhalten bleiben.';

  @override
  String get themeTitle => 'Darstellung';

  @override
  String get themeSubtitle => 'Systemeinstellung oder helles/dunkles Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get targetBitrateEditTooltip => 'Bitrate eingeben';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Erlaubter Bereich: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardware-Encoder (schnell)';

  @override
  String get hwEncoderSubtitle =>
      'Deutlich schneller, braucht für die gleiche Qualität aber etwa die doppelte Bitrate. Nur im Bitrate-Modus.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-Video — wird mit dem Software-Encoder konvertiert, damit HDR erhalten bleibt.';

  @override
  String get hwEncoderFallback =>
      'Hardware-Encoder fehlgeschlagen — es wird mit dem Software-Encoder konvertiert.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format unterstützt der Hardware-Encoder nicht — dieses Format wird mit dem Software-Encoder konvertiert.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hardware-Encoder ausgeschaltet — er unterstützt nur den Bitrate-Modus.';
}
