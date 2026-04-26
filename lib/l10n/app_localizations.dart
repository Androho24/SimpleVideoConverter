import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('th'),
    Locale('tr')
  ];

  /// Label für das Qualitäts-Dropdown
  ///
  /// In de, this message translates to:
  /// **'Qualität'**
  String get qualityLabel;

  /// Qualitätsstufe 1080p, hohe Qualität (CRF 18)
  ///
  /// In de, this message translates to:
  /// **'1080p Hoch'**
  String get quality1080pHigh;

  /// Qualitätsstufe 1080p, mittlere Qualität (CRF 23)
  ///
  /// In de, this message translates to:
  /// **'1080p Mittel'**
  String get quality1080pMedium;

  /// Qualitätsstufe 1080p, niedrige Qualität (CRF 27)
  ///
  /// In de, this message translates to:
  /// **'1080p Niedrig'**
  String get quality1080pLow;

  /// Qualitätsstufe 1080p, sehr niedrige Qualität (CRF 32)
  ///
  /// In de, this message translates to:
  /// **'1080p Sehr Niedrig'**
  String get quality1080pVeryLow;

  /// Qualitätsstufe 720p, hohe Qualität (CRF 18)
  ///
  /// In de, this message translates to:
  /// **'720p Hoch'**
  String get quality720pHigh;

  /// Qualitätsstufe 720p, mittlere Qualität (CRF 23)
  ///
  /// In de, this message translates to:
  /// **'720p Mittel'**
  String get quality720pMedium;

  /// Qualitätsstufe 720p, niedrige Qualität (CRF 27)
  ///
  /// In de, this message translates to:
  /// **'720p Niedrig'**
  String get quality720pLow;

  /// Qualitätsstufe 720p, sehr niedrige Qualität (CRF 32)
  ///
  /// In de, this message translates to:
  /// **'720p Sehr Niedrig'**
  String get quality720pVeryLow;

  /// Qualitätsstufe 480p, hohe Qualität (CRF 18)
  ///
  /// In de, this message translates to:
  /// **'480p Hoch'**
  String get quality480pHigh;

  /// Qualitätsstufe 480p, mittlere Qualität (CRF 23)
  ///
  /// In de, this message translates to:
  /// **'480p Mittel'**
  String get quality480pMedium;

  /// Qualitätsstufe 480p, niedrige Qualität (CRF 27)
  ///
  /// In de, this message translates to:
  /// **'480p Niedrig'**
  String get quality480pLow;

  /// Qualitätsstufe 480p, sehr niedrige Qualität (CRF 32)
  ///
  /// In de, this message translates to:
  /// **'480p Sehr Niedrig'**
  String get quality480pVeryLow;

  /// Qualitätsstufe 360p, hohe Qualität (CRF 18)
  ///
  /// In de, this message translates to:
  /// **'360p Hoch'**
  String get quality360pHigh;

  /// Qualitätsstufe 360p, mittlere Qualität (CRF 23)
  ///
  /// In de, this message translates to:
  /// **'360p Mittel'**
  String get quality360pMedium;

  /// Qualitätsstufe 360p, niedrige Qualität (CRF 27)
  ///
  /// In de, this message translates to:
  /// **'360p Niedrig'**
  String get quality360pLow;

  /// Qualitätsstufe 360p, sehr niedrige Qualität (CRF 32)
  ///
  /// In de, this message translates to:
  /// **'360p Sehr Niedrig'**
  String get quality360pVeryLow;

  /// Entfernt Audio vom Video
  ///
  /// In de, this message translates to:
  /// **'Stummschalten'**
  String get mute;

  /// Bestätigungsknopf in Dialogen
  ///
  /// In de, this message translates to:
  /// **'OK'**
  String get ok;

  /// Button zum Öffnen der Videogalerie
  ///
  /// In de, this message translates to:
  /// **'Video auswählen'**
  String get selectVideo;

  /// Ladezustand beim Öffnen des Videos
  ///
  /// In de, this message translates to:
  /// **'Video wird geladen…'**
  String get videoLoading;

  /// Normal-Modus Segment
  ///
  /// In de, this message translates to:
  /// **'Normal'**
  String get modeNormal;

  /// Expert-Modus Segment
  ///
  /// In de, this message translates to:
  /// **'Expert'**
  String get modeExpert;

  /// Fehlermeldung ungültige Datei
  ///
  /// In de, this message translates to:
  /// **'Bitte eine gültige Videodatei auswählen.'**
  String get invalidVideoFile;

  /// Fehlermeldung Datei laden
  ///
  /// In de, this message translates to:
  /// **'Die Datei konnte nicht geladen werden. Bitte eine Videodatei auswählen.'**
  String get fileLoadError;

  /// Hinweis wenn Vorschau nicht möglich (z.B. Auflösung zu hoch)
  ///
  /// In de, this message translates to:
  /// **'Vorschau nicht verfügbar. Das Video kann trotzdem konvertiert werden.'**
  String get previewNotAvailable;

  /// Platzhaltertext im UI wenn keine Vorschau angezeigt werden kann
  ///
  /// In de, this message translates to:
  /// **'Vorschau nicht verfügbar\n(Auflösung zu hoch für dieses Gerät)'**
  String get previewNotAvailableLabel;

  /// Hinweis wenn kein Video geladen
  ///
  /// In de, this message translates to:
  /// **'Bitte zuerst ein Video laden.'**
  String get noVideoLoaded;

  /// Dialog-Titel Konvertierung abbrechen
  ///
  /// In de, this message translates to:
  /// **'Konvertierung abbrechen?'**
  String get cancelConversionTitle;

  /// Dialog-Inhalt Konvertierung abbrechen
  ///
  /// In de, this message translates to:
  /// **'Die bisherige Verarbeitung geht verloren.'**
  String get cancelConversionContent;

  /// Button Konvertierung fortsetzen
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get continueConversion;

  /// Allgemeiner Abbrechen-Button
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get cancel;

  /// Dialog-Titel Video verwerfen
  ///
  /// In de, this message translates to:
  /// **'Video verwerfen?'**
  String get discardVideoTitle;

  /// Dialog-Inhalt Video verwerfen
  ///
  /// In de, this message translates to:
  /// **'Das konvertierte Video wird gelöscht und nicht gespeichert.'**
  String get discardVideoContent;

  /// Button Video behalten
  ///
  /// In de, this message translates to:
  /// **'Behalten'**
  String get keep;

  /// Button Video verwerfen
  ///
  /// In de, this message translates to:
  /// **'Verwerfen'**
  String get discard;

  /// Button Video speichern
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get save;

  /// Titel des nativen Speichern-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Video speichern'**
  String get saveVideoDialogTitle;

  /// Snackbar Erfolgsmeldung nach dem Speichern
  ///
  /// In de, this message translates to:
  /// **'Gespeichert!'**
  String get savedSuccess;

  /// Snackbar-Action gespeichertes Video öffnen
  ///
  /// In de, this message translates to:
  /// **'Öffnen'**
  String get open;

  /// Snackbar Fehler beim Speichern
  ///
  /// In de, this message translates to:
  /// **'Fehler beim Speichern. Möglicherweise nicht genug Speicherplatz.'**
  String get saveError;

  /// Statustext nach abgeschlossener Konvertierung
  ///
  /// In de, this message translates to:
  /// **'Fertig!'**
  String get conversionDone;

  /// Fortschrittstext während der Konvertierung
  ///
  /// In de, this message translates to:
  /// **'Konvertierung: {percent}%'**
  String conversionProgress(String percent);

  /// Fehlermeldung wenn Konvertierung fehlschlägt
  ///
  /// In de, this message translates to:
  /// **'Konvertierung fehlgeschlagen: {error}'**
  String conversionFailed(String error);

  /// Titel der Einstellungsseite und Tooltip
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get settingsTitle;

  /// Lizenzen ListTile Titel
  ///
  /// In de, this message translates to:
  /// **'Lizenzen'**
  String get licensesTitle;

  /// Lizenzen ListTile Untertitel
  ///
  /// In de, this message translates to:
  /// **'Open-Source-Lizenzen dieser App'**
  String get licensesSubtitle;

  /// GPL-Lizenztext ListTile Titel
  ///
  /// In de, this message translates to:
  /// **'GPL-3.0 Lizenztext'**
  String get gplLicenseTitle;

  /// Quellcode ListTile Titel
  ///
  /// In de, this message translates to:
  /// **'Quellcode (GitHub)'**
  String get sourceCodeTitle;

  /// Datenschutz ListTile Titel
  ///
  /// In de, this message translates to:
  /// **'Datenschutzerklärung'**
  String get privacyPolicyTitle;

  /// Ad Consent Settings ListTile Titel
  ///
  /// In de, this message translates to:
  /// **'Datenschutz-Einstellungen'**
  String get adConsentTitle;

  /// Impressum ListTile Titel
  ///
  /// In de, this message translates to:
  /// **'Impressum'**
  String get imprintTitle;

  /// Snackbar wenn Link nicht geöffnet werden kann
  ///
  /// In de, this message translates to:
  /// **'Link konnte nicht geöffnet werden.'**
  String get linkOpenError;

  /// Tooltip am Info-Button für Stummschalten
  ///
  /// In de, this message translates to:
  /// **'Stummschalten erklärt'**
  String get muteTooltip;

  /// Inhalt des Stummschalten-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Entfernt den Ton vollständig aus dem konvertierten Video.\n\nNützlich z.B. um Hintergrundgeräusche zu entfernen oder die Dateigröße zu reduzieren.'**
  String get muteInfoContent;

  /// Geschätzte Dateigröße unter dem Konvertieren-Button
  ///
  /// In de, this message translates to:
  /// **'Geschätzte Größe: {size} MB'**
  String estimatedSize(String size);

  /// Haupt-Konvertieren-Button
  ///
  /// In de, this message translates to:
  /// **'Konvertieren'**
  String get convertButton;

  /// Label für den CRF-Dropdown
  ///
  /// In de, this message translates to:
  /// **'Videoqualität (CRF)'**
  String get crfLabel;

  /// Titel des CRF-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'CRF — Videoqualität'**
  String get crfInfoTitle;

  /// Inhalt des CRF-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'0 → verlustfrei (sehr große Datei)\n18 → visuell nahezu verlustfrei\n23 → Standard (gute Balance)\n28 → sichtbare Qualitätseinbußen\n51 → niedrigste Qualität\n\nEmpfehlung: 18–28'**
  String get crfInfoContent;

  /// Label für die Breite/Höhe-Felder
  ///
  /// In de, this message translates to:
  /// **'Auflösung'**
  String get resolutionLabel;

  /// Titel des Auflösungs-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Gängige Auflösungen'**
  String get resolutionInfoTitle;

  /// Inhalt des Auflösungs-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTipp: Ein Feld leer lassen = das andere wird proportional berechnet.'**
  String get resolutionInfoContent;

  /// Label für das Breite-Textfeld
  ///
  /// In de, this message translates to:
  /// **'Breite'**
  String get widthLabel;

  /// Label für das Höhe-Textfeld
  ///
  /// In de, this message translates to:
  /// **'Höhe'**
  String get heightLabel;

  /// Hint-Text in den Breite/Höhe-Feldern
  ///
  /// In de, this message translates to:
  /// **'Leer = Original'**
  String get emptyEqualsOriginal;

  /// Label für die FPS-Auswahl
  ///
  /// In de, this message translates to:
  /// **'FPS'**
  String get fpsLabel;

  /// Titel des FPS-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Frames pro Sekunde'**
  String get fpsInfoTitle;

  /// Inhalt des FPS-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Orig  → FPS des Quellvideos beibehalten\n24    → Kino-Standard\n25    → PAL/TV-Standard (Europa)\n30    → NTSC/TV, Social Media\n60    → Flüssig, Gaming, Sport'**
  String get fpsInfoContent;

  /// Label für das Audio-Bitrate-Dropdown
  ///
  /// In de, this message translates to:
  /// **'Audio-Bitrate'**
  String get audioBitrateLabel;

  /// Audio-Bitrate-Eintrag für kein Audio
  ///
  /// In de, this message translates to:
  /// **'Stumm'**
  String get silent;

  /// Inhalt des Audio-Bitrate-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Stumm    → kein Audio\n64 kbps  → Sprache, Podcasts\n96 kbps  → gute Sprachqualität\n128 kbps → Standard-Musik\n192 kbps → hohe Audioqualität\n320 kbps → maximale MP3-Qualität'**
  String get audioBitrateInfoContent;

  /// Label für die Audio-Codec-Auswahl
  ///
  /// In de, this message translates to:
  /// **'Audio-Codec'**
  String get audioCodecLabel;

  /// Inhalt des Audio-Codec-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'AAC  → Standard für MP4, beste Kompatibilität\nMP3  → weit verbreitet, leicht veraltet\nOpus → modern & effizient, gut für MKV'**
  String get audioCodecInfoContent;

  /// Label für die Output-Format-Auswahl
  ///
  /// In de, this message translates to:
  /// **'Output-Format'**
  String get outputFormatLabel;

  /// Inhalt des Output-Format-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'MP4 → universell, beste Kompatibilität\nMKV → flexibel, viele Codecs, weniger kompatibel\nMOV → Apple/QuickTime-Format\nAVI → veraltet, breite Kompatibilität\nTS  → MPEG Transport Stream, TV/Streaming'**
  String get outputFormatInfoContent;

  /// FPS-Option: Original-Framerate des Quellvideos
  ///
  /// In de, this message translates to:
  /// **'Orig'**
  String get orig;

  /// Titel des Auflösungs-Erklärungs-Dialogs in QualitySelector
  ///
  /// In de, this message translates to:
  /// **'Was bedeuten die Auflösungen?'**
  String get resolutionExplainTitle;

  /// Inhalt des Auflösungs-Erklärungs-Dialogs
  ///
  /// In de, this message translates to:
  /// **'360p  (640×360)   → sehr kleine Datei,\nz.B. für WhatsApp\n\n480p  (854×480)   → Standard Definition (SD)\n\n720p  (1280×720)  → HD, gut für mobile Geräte\n\n1080p (1920×1080) → Full HD, Standard für\n                          YouTube & TV\n\nHoch/Mittel/Niedrig beschreibt die Qualität bei gleicher Auflösung — höher = größere Datei.'**
  String get resolutionExplainContent;

  /// Tooltip am Info-Button neben dem Qualitäts-Dropdown
  ///
  /// In de, this message translates to:
  /// **'Auflösungen erklärt'**
  String get resolutionTooltip;

  /// Label über dem Trim-Slider
  ///
  /// In de, this message translates to:
  /// **'Trim-Bereich'**
  String get trimArea;

  /// Startzeit des Trim-Bereichs
  ///
  /// In de, this message translates to:
  /// **'Anfang: {time}'**
  String trimStartLabel(String time);

  /// Endzeit des Trim-Bereichs
  ///
  /// In de, this message translates to:
  /// **'Ende: {time}'**
  String trimEndLabel(String time);

  /// Platzhaltertext während das Native Ad lädt
  ///
  /// In de, this message translates to:
  /// **'Werbung wird geladen…'**
  String get adLoading;

  /// Prefix für den vorausgefüllten Dateinamen im Speichern-Dialog
  ///
  /// In de, this message translates to:
  /// **'konvertiert_'**
  String get convertedPrefix;

  /// Titel des IAP-Eintrags im Settings-Screen
  ///
  /// In de, this message translates to:
  /// **'Werbung entfernen'**
  String get removeAdsTitle;

  /// Untertitel mit dynamischem Preis aus dem Play Store
  ///
  /// In de, this message translates to:
  /// **'Einmaliger Kauf – {price}'**
  String removeAdsSubtitle(String price);

  /// Titel wenn IAP bereits gekauft wurde
  ///
  /// In de, this message translates to:
  /// **'Werbefrei ✓'**
  String get removeAdsActiveTitle;

  /// Untertitel wenn IAP bereits gekauft wurde
  ///
  /// In de, this message translates to:
  /// **'Danke für deine Unterstützung!'**
  String get removeAdsActiveSubtitle;

  /// Button zum Wiederherstellen eines früheren IAP-Kaufs
  ///
  /// In de, this message translates to:
  /// **'Kauf wiederherstellen'**
  String get restorePurchasesTitle;

  /// Kauf-Button im Settings-Screen
  ///
  /// In de, this message translates to:
  /// **'Kaufen'**
  String get purchaseButton;

  /// Fehlermeldung bei gescheitertem IAP
  ///
  /// In de, this message translates to:
  /// **'Kauf fehlgeschlagen. Bitte erneut versuchen.'**
  String get purchaseError;

  /// Erfolgsmeldung nach IAP-Kauf
  ///
  /// In de, this message translates to:
  /// **'Danke! Werbung wurde deaktiviert.'**
  String get purchaseSuccess;

  /// No description provided for @appName.
  ///
  /// In de, this message translates to:
  /// **'Video Konverter'**
  String get appName;

  /// Switch-Label für Audio-Only-Modus
  ///
  /// In de, this message translates to:
  /// **'Nur Audio'**
  String get audioOnly;

  /// Tooltip am Info-Button für Nur-Audio
  ///
  /// In de, this message translates to:
  /// **'Nur Audio erklärt'**
  String get audioOnlyTooltip;

  /// Inhalt des Nur-Audio-Info-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Extrahiert nur die Audiospur aus dem Video – kein Bild.\n\nNormal-Modus: MP3 mit 192 kbps.\nExpert-Modus: Codec und Bitrate aus den Audio-Einstellungen.\n\nNützlich um z.B. Musik oder Podcasts aus Videos zu speichern.'**
  String get audioOnlyInfoContent;

  /// Tooltip des Seitenverhältnis-Lock-Buttons (gesperrt)
  ///
  /// In de, this message translates to:
  /// **'Seitenverhältnis gesperrt'**
  String get aspectLocked;

  /// Tooltip des Seitenverhältnis-Lock-Buttons (entsperrt)
  ///
  /// In de, this message translates to:
  /// **'Seitenverhältnis frei'**
  String get aspectUnlocked;

  /// Titel des CPU-Warnhinweis-Dialogs bei großen Eingabedateien
  ///
  /// In de, this message translates to:
  /// **'Große Datei'**
  String get cpuWarningTitle;

  /// Inhalt des CPU-Warnhinweis-Dialogs
  ///
  /// In de, this message translates to:
  /// **'Dieses Video ist länger als 5 Minuten. Auf älteren Geräten kann die Konvertierung zu hoher Prozessorauslastung führen – das ist normal.\n\nDu kannst das Handy einfach daneben legen, die App läuft im Hintergrund weiter.'**
  String get cpuWarningContent;

  /// Checkbox-Label im CPU-Warnhinweis-Dialog
  ///
  /// In de, this message translates to:
  /// **'Nicht mehr anzeigen'**
  String get cpuWarningCheckbox;

  /// Titel des Speicherplatz-Warndialogs vor der Konvertierung
  ///
  /// In de, this message translates to:
  /// **'Nicht genug Speicherplatz'**
  String get storageWarningTitle;

  /// Inhalt des Speicherplatz-Warndialogs vor der Konvertierung
  ///
  /// In de, this message translates to:
  /// **'Dein Gerät hat nur noch {available} MB frei. Für die Konvertierung werden ca. {required} MB benötigt. Bitte gib zuerst Speicher frei.'**
  String storageWarningContent(String available, String required);

  /// Titel des Feedback-Eintrags in den Einstellungen und des Screens
  ///
  /// In de, this message translates to:
  /// **'Feedback & Support'**
  String get feedbackTitle;

  /// Untertitel des Feedback-Eintrags in den Einstellungen
  ///
  /// In de, this message translates to:
  /// **'Bugs, Verbesserungen oder Feedback senden'**
  String get feedbackSubtitle;

  /// Label über dem Kategorie-Dropdown im Feedback-Screen
  ///
  /// In de, this message translates to:
  /// **'Kategorie'**
  String get feedbackCategoryLabel;

  /// Dropdown-Option: Bug-Bericht
  ///
  /// In de, this message translates to:
  /// **'Bug melden'**
  String get feedbackCategoryBug;

  /// Dropdown-Option: Feature-Wunsch
  ///
  /// In de, this message translates to:
  /// **'Verbesserungsvorschlag'**
  String get feedbackCategoryFeature;

  /// Dropdown-Option: allgemeines Feedback
  ///
  /// In de, this message translates to:
  /// **'Allgemeines Feedback'**
  String get feedbackCategoryFeedback;

  /// Placeholder-Text im Nachrichtenfeld des Feedback-Screens
  ///
  /// In de, this message translates to:
  /// **'Beschreibe dein Anliegen…'**
  String get feedbackMessageHint;

  /// Beschriftung des Senden-Buttons im Feedback-Screen
  ///
  /// In de, this message translates to:
  /// **'Senden'**
  String get feedbackSendButton;

  /// No description provided for @notificationPermissionTitle.
  ///
  /// In de, this message translates to:
  /// **'Hintergrundkonvertierung'**
  String get notificationPermissionTitle;

  /// No description provided for @notificationPermissionContent.
  ///
  /// In de, this message translates to:
  /// **'Erlaube Benachrichtigungen, damit die Konvertierung weiterlaufen kann während du andere Apps nutzt. Ohne diese Berechtigung muss die App geöffnet bleiben.'**
  String get notificationPermissionContent;

  /// No description provided for @notificationPermissionNotNow.
  ///
  /// In de, this message translates to:
  /// **'Nicht jetzt'**
  String get notificationPermissionNotNow;

  /// No description provided for @notificationPermissionAllow.
  ///
  /// In de, this message translates to:
  /// **'Erlauben'**
  String get notificationPermissionAllow;

  /// No description provided for @notificationPermissionDenied.
  ///
  /// In de, this message translates to:
  /// **'Aktiviere Benachrichtigungen in den Einstellungen für die Hintergrundkonvertierung.'**
  String get notificationPermissionDenied;

  /// No description provided for @notificationPermissionOpenSettings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get notificationPermissionOpenSettings;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'cs',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'it',
        'nl',
        'pl',
        'pt',
        'ru',
        'th',
        'tr'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
