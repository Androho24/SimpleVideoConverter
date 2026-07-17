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
    Locale('tr'),
  ];

  /// Label für das Qualitäts-Dropdown
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get qualityLabel;

  /// Qualitätsstufe 2160p, hohe Qualität (CRF 18)
  ///
  /// In en, this message translates to:
  /// **'2160p High'**
  String get quality2160pHigh;

  /// Qualitätsstufe 2160p, mittlere Qualität (CRF 23)
  ///
  /// In en, this message translates to:
  /// **'2160p Medium'**
  String get quality2160pMedium;

  /// Qualitätsstufe 2160p, niedrige Qualität (CRF 27)
  ///
  /// In en, this message translates to:
  /// **'2160p Low'**
  String get quality2160pLow;

  /// Qualitätsstufe 2160p, sehr niedrige Qualität (CRF 32)
  ///
  /// In en, this message translates to:
  /// **'2160p Very Low'**
  String get quality2160pVeryLow;

  /// Qualitätsstufe 1440p, hohe Qualität (CRF 18)
  ///
  /// In en, this message translates to:
  /// **'1440p High'**
  String get quality1440pHigh;

  /// Qualitätsstufe 1440p, mittlere Qualität (CRF 23)
  ///
  /// In en, this message translates to:
  /// **'1440p Medium'**
  String get quality1440pMedium;

  /// Qualitätsstufe 1440p, niedrige Qualität (CRF 27)
  ///
  /// In en, this message translates to:
  /// **'1440p Low'**
  String get quality1440pLow;

  /// Qualitätsstufe 1440p, sehr niedrige Qualität (CRF 32)
  ///
  /// In en, this message translates to:
  /// **'1440p Very Low'**
  String get quality1440pVeryLow;

  /// Qualitätsstufe 1080p, hohe Qualität (CRF 18)
  ///
  /// In en, this message translates to:
  /// **'1080p High'**
  String get quality1080pHigh;

  /// Qualitätsstufe 1080p, mittlere Qualität (CRF 23)
  ///
  /// In en, this message translates to:
  /// **'1080p Medium'**
  String get quality1080pMedium;

  /// Qualitätsstufe 1080p, niedrige Qualität (CRF 27)
  ///
  /// In en, this message translates to:
  /// **'1080p Low'**
  String get quality1080pLow;

  /// Qualitätsstufe 1080p, sehr niedrige Qualität (CRF 32)
  ///
  /// In en, this message translates to:
  /// **'1080p Very Low'**
  String get quality1080pVeryLow;

  /// Qualitätsstufe 720p, hohe Qualität (CRF 18)
  ///
  /// In en, this message translates to:
  /// **'720p High'**
  String get quality720pHigh;

  /// Qualitätsstufe 720p, mittlere Qualität (CRF 23)
  ///
  /// In en, this message translates to:
  /// **'720p Medium'**
  String get quality720pMedium;

  /// Qualitätsstufe 720p, niedrige Qualität (CRF 27)
  ///
  /// In en, this message translates to:
  /// **'720p Low'**
  String get quality720pLow;

  /// Qualitätsstufe 720p, sehr niedrige Qualität (CRF 32)
  ///
  /// In en, this message translates to:
  /// **'720p Very Low'**
  String get quality720pVeryLow;

  /// Qualitätsstufe 480p, hohe Qualität (CRF 18)
  ///
  /// In en, this message translates to:
  /// **'480p High'**
  String get quality480pHigh;

  /// Qualitätsstufe 480p, mittlere Qualität (CRF 23)
  ///
  /// In en, this message translates to:
  /// **'480p Medium'**
  String get quality480pMedium;

  /// Qualitätsstufe 480p, niedrige Qualität (CRF 27)
  ///
  /// In en, this message translates to:
  /// **'480p Low'**
  String get quality480pLow;

  /// Qualitätsstufe 480p, sehr niedrige Qualität (CRF 32)
  ///
  /// In en, this message translates to:
  /// **'480p Very Low'**
  String get quality480pVeryLow;

  /// Qualitätsstufe 360p, hohe Qualität (CRF 18)
  ///
  /// In en, this message translates to:
  /// **'360p High'**
  String get quality360pHigh;

  /// Qualitätsstufe 360p, mittlere Qualität (CRF 23)
  ///
  /// In en, this message translates to:
  /// **'360p Medium'**
  String get quality360pMedium;

  /// Qualitätsstufe 360p, niedrige Qualität (CRF 27)
  ///
  /// In en, this message translates to:
  /// **'360p Low'**
  String get quality360pLow;

  /// Qualitätsstufe 360p, sehr niedrige Qualität (CRF 32)
  ///
  /// In en, this message translates to:
  /// **'360p Very Low'**
  String get quality360pVeryLow;

  /// Entfernt Audio vom Video
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get mute;

  /// Bestätigungsknopf in Dialogen
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Button zum Öffnen der Videogalerie
  ///
  /// In en, this message translates to:
  /// **'Select video'**
  String get selectVideo;

  /// Ladezustand beim Öffnen des Videos
  ///
  /// In en, this message translates to:
  /// **'Loading video…'**
  String get videoLoading;

  /// Normal-Modus Segment
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get modeNormal;

  /// Expert-Modus Segment
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get modeExpert;

  /// Fehlermeldung ungültige Datei
  ///
  /// In en, this message translates to:
  /// **'Please select a valid video file.'**
  String get invalidVideoFile;

  /// Fehlermeldung Datei laden
  ///
  /// In en, this message translates to:
  /// **'The file could not be loaded. Please select a video file.'**
  String get fileLoadError;

  /// Hinweis wenn Vorschau nicht möglich (z.B. Auflösung zu hoch)
  ///
  /// In en, this message translates to:
  /// **'Preview not available. The video can still be converted.'**
  String get previewNotAvailable;

  /// Platzhaltertext im UI wenn keine Vorschau angezeigt werden kann
  ///
  /// In en, this message translates to:
  /// **'Preview not available\n(Resolution too high for this device)'**
  String get previewNotAvailableLabel;

  /// Hinweis wenn kein Video geladen
  ///
  /// In en, this message translates to:
  /// **'Please load a video first.'**
  String get noVideoLoaded;

  /// Dialog-Titel Konvertierung abbrechen
  ///
  /// In en, this message translates to:
  /// **'Cancel conversion?'**
  String get cancelConversionTitle;

  /// Dialog-Inhalt Konvertierung abbrechen
  ///
  /// In en, this message translates to:
  /// **'The conversion progress will be lost.'**
  String get cancelConversionContent;

  /// Button Konvertierung fortsetzen
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueConversion;

  /// Allgemeiner Abbrechen-Button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Dialog-Titel Video verwerfen
  ///
  /// In en, this message translates to:
  /// **'Discard video?'**
  String get discardVideoTitle;

  /// Dialog-Inhalt Video verwerfen
  ///
  /// In en, this message translates to:
  /// **'The converted video will be deleted and not saved.'**
  String get discardVideoContent;

  /// Button Video behalten
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get keep;

  /// Button Video verwerfen
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// Button Video speichern
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Titel des nativen Speichern-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Save video'**
  String get saveVideoDialogTitle;

  /// Snackbar Erfolgsmeldung nach dem Speichern
  ///
  /// In en, this message translates to:
  /// **'Saved!'**
  String get savedSuccess;

  /// Snackbar-Action gespeichertes Video öffnen
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// Button öffnet die System-Galerie-App nach erfolgreichem Speichern
  ///
  /// In en, this message translates to:
  /// **'Open gallery'**
  String get openGallery;

  /// Button öffnet das gespeicherte Video im System-Player (mit Album-Context via MediaStore-URI)
  ///
  /// In en, this message translates to:
  /// **'Open video'**
  String get openVideo;

  /// Settings-Switch: Auto-Save für Video-Output
  ///
  /// In en, this message translates to:
  /// **'Auto-save videos to gallery'**
  String get autoSaveTitle;

  /// Erklärungstext zum Auto-Save-Switch
  ///
  /// In en, this message translates to:
  /// **'Videos are saved automatically after conversion.'**
  String get autoSaveSubtitle;

  /// Snackbar Fehler beim Speichern
  ///
  /// In en, this message translates to:
  /// **'Error saving. There may not be enough storage space.'**
  String get saveError;

  /// Snackbar Fehler beim Speichern – zu wenig RAM (Audio readAsBytes OOM)
  ///
  /// In en, this message translates to:
  /// **'Not enough memory to save this file. Try a shorter clip or lower quality.'**
  String get saveErrorOutOfMemory;

  /// Statustext nach abgeschlossener Konvertierung
  ///
  /// In en, this message translates to:
  /// **'Done!'**
  String get conversionDone;

  /// Fortschrittstext während der Konvertierung
  ///
  /// In en, this message translates to:
  /// **'Converting: {percent}%'**
  String conversionProgress(String percent);

  /// Fehlermeldung wenn Konvertierung fehlschlägt
  ///
  /// In en, this message translates to:
  /// **'Conversion failed: {error}'**
  String conversionFailed(String error);

  /// Titel der Einstellungsseite und Tooltip
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Lizenzen ListTile Titel
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licensesTitle;

  /// Lizenzen ListTile Untertitel
  ///
  /// In en, this message translates to:
  /// **'Open-source licenses of this app'**
  String get licensesSubtitle;

  /// GPL-Lizenztext ListTile Titel
  ///
  /// In en, this message translates to:
  /// **'GPL-3.0 License Text'**
  String get gplLicenseTitle;

  /// Quellcode ListTile Titel
  ///
  /// In en, this message translates to:
  /// **'Source Code (GitHub)'**
  String get sourceCodeTitle;

  /// Datenschutz ListTile Titel
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// Ad Consent Settings ListTile Titel
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get adConsentTitle;

  /// Impressum ListTile Titel
  ///
  /// In en, this message translates to:
  /// **'Imprint'**
  String get imprintTitle;

  /// Snackbar wenn Link nicht geöffnet werden kann
  ///
  /// In en, this message translates to:
  /// **'The link could not be opened.'**
  String get linkOpenError;

  /// Tooltip am Info-Button für Stummschalten
  ///
  /// In en, this message translates to:
  /// **'Mute explained'**
  String get muteTooltip;

  /// Inhalt des Stummschalten-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Removes audio completely from the converted video.\n\nUseful e.g. to remove background noise or reduce file size.'**
  String get muteInfoContent;

  /// Geschätzte Dateigröße unter dem Konvertieren-Button
  ///
  /// In en, this message translates to:
  /// **'Estimated size: {size} MB'**
  String estimatedSize(String size);

  /// Haupt-Konvertieren-Button
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convertButton;

  /// Label für den CRF-Dropdown
  ///
  /// In en, this message translates to:
  /// **'Video quality (CRF)'**
  String get crfLabel;

  /// Titel des CRF-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'CRF — Video quality'**
  String get crfInfoTitle;

  /// Inhalt des CRF-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'0 → lossless (very large file)\n18 → visually nearly lossless\n23 → standard (good balance)\n28 → visible quality loss\n51 → lowest quality\n\nRecommended: 18–28'**
  String get crfInfoContent;

  /// Label für die Breite/Höhe-Felder
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get resolutionLabel;

  /// Titel des Auflösungs-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Common resolutions'**
  String get resolutionInfoTitle;

  /// Inhalt des Auflösungs-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTip: Leave one field empty = the other will be calculated proportionally.'**
  String get resolutionInfoContent;

  /// Label für das Breite-Textfeld
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get widthLabel;

  /// Label für das Höhe-Textfeld
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get heightLabel;

  /// Hint-Text in den Breite/Höhe-Feldern
  ///
  /// In en, this message translates to:
  /// **'Empty = Original'**
  String get emptyEqualsOriginal;

  /// Label für die FPS-Auswahl
  ///
  /// In en, this message translates to:
  /// **'FPS'**
  String get fpsLabel;

  /// Titel des FPS-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Frames per second'**
  String get fpsInfoTitle;

  /// Inhalt des FPS-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Orig  → Keep source video FPS\n24    → Cinema standard\n25    → PAL/TV standard (Europe)\n30    → NTSC/TV, social media\n60    → Smooth, gaming, sports'**
  String get fpsInfoContent;

  /// Label für das Audio-Bitrate-Dropdown
  ///
  /// In en, this message translates to:
  /// **'Audio bitrate'**
  String get audioBitrateLabel;

  /// Audio-Bitrate-Eintrag für kein Audio
  ///
  /// In en, this message translates to:
  /// **'Silent'**
  String get silent;

  /// Inhalt des Audio-Bitrate-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Silent   → no audio\n64 kbps  → voice, podcasts\n96 kbps  → good voice quality\n128 kbps → standard music\n192 kbps → high audio quality\n320 kbps → maximum MP3 quality'**
  String get audioBitrateInfoContent;

  /// Label für die Audio-Codec-Auswahl
  ///
  /// In en, this message translates to:
  /// **'Audio codec'**
  String get audioCodecLabel;

  /// Inhalt des Audio-Codec-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'AAC  → standard for MP4, best compatibility\nMP3  → widely used, slightly outdated\nOpus → modern & efficient, great for MKV\nAC3  → Dolby Digital, shown only for surround sources (≥ 3 channels)'**
  String get audioCodecInfoContent;

  /// Label für die Output-Format-Auswahl
  ///
  /// In en, this message translates to:
  /// **'Output format'**
  String get outputFormatLabel;

  /// Inhalt des Output-Format-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'MP4 → universal, best compatibility\nMKV → flexible, many codecs, less compatible\nMOV → Apple/QuickTime format\nAVI → outdated, broad compatibility\nTS  → MPEG transport stream, TV/streaming'**
  String get outputFormatInfoContent;

  /// FPS-Option: Original-Framerate des Quellvideos
  ///
  /// In en, this message translates to:
  /// **'Orig'**
  String get orig;

  /// Titel des Auflösungs-Erklärungs-Dialogs in QualitySelector
  ///
  /// In en, this message translates to:
  /// **'What do the resolutions mean?'**
  String get resolutionExplainTitle;

  /// Inhalt des Auflösungs-Erklärungs-Dialogs
  ///
  /// In en, this message translates to:
  /// **'360p  (640×360)   → very small file,\ne.g. for WhatsApp\n\n480p  (854×480)   → Standard Definition (SD)\n\n720p  (1280×720)  → HD, good for mobile devices\n\n1080p (1920×1080) → Full HD, standard for\n                          YouTube & TV\n\nHigh/Medium/Low describes quality at the same resolution — higher = larger file.'**
  String get resolutionExplainContent;

  /// Tooltip am Info-Button neben dem Qualitäts-Dropdown
  ///
  /// In en, this message translates to:
  /// **'Resolutions explained'**
  String get resolutionTooltip;

  /// Label über dem Trim-Slider
  ///
  /// In en, this message translates to:
  /// **'Trim range'**
  String get trimArea;

  /// Startzeit des Trim-Bereichs
  ///
  /// In en, this message translates to:
  /// **'Start: {time}'**
  String trimStartLabel(String time);

  /// Endzeit des Trim-Bereichs
  ///
  /// In en, this message translates to:
  /// **'End: {time}'**
  String trimEndLabel(String time);

  /// Platzhaltertext während das Native Ad lädt
  ///
  /// In en, this message translates to:
  /// **'Loading ad…'**
  String get adLoading;

  /// Prefix für den vorausgefüllten Dateinamen im Speichern-Dialog
  ///
  /// In en, this message translates to:
  /// **'converted_'**
  String get convertedPrefix;

  /// Titel des IAP-Eintrags im Settings-Screen
  ///
  /// In en, this message translates to:
  /// **'Remove Ads'**
  String get removeAdsTitle;

  /// Untertitel mit dynamischem Preis aus dem Play Store
  ///
  /// In en, this message translates to:
  /// **'One-time purchase – {price}'**
  String removeAdsSubtitle(String price);

  /// Titel wenn IAP bereits gekauft wurde
  ///
  /// In en, this message translates to:
  /// **'Ad-free ✓'**
  String get removeAdsActiveTitle;

  /// Untertitel wenn IAP bereits gekauft wurde
  ///
  /// In en, this message translates to:
  /// **'Thank you for your support!'**
  String get removeAdsActiveSubtitle;

  /// Button zum Wiederherstellen eines früheren IAP-Kaufs
  ///
  /// In en, this message translates to:
  /// **'Restore purchase'**
  String get restorePurchasesTitle;

  /// Kauf-Button im Settings-Screen
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get purchaseButton;

  /// Fehlermeldung bei gescheitertem IAP
  ///
  /// In en, this message translates to:
  /// **'Purchase failed. Please try again.'**
  String get purchaseError;

  /// Erfolgsmeldung nach IAP-Kauf
  ///
  /// In en, this message translates to:
  /// **'Thanks! Ads have been disabled.'**
  String get purchaseSuccess;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Video Converter'**
  String get appName;

  /// Switch-Label für Audio-Only-Modus
  ///
  /// In en, this message translates to:
  /// **'Audio Only'**
  String get audioOnly;

  /// Tooltip am Info-Button für Nur-Audio
  ///
  /// In en, this message translates to:
  /// **'Audio Only explained'**
  String get audioOnlyTooltip;

  /// Inhalt des Nur-Audio-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Extracts only the audio track from the video — no picture.\n\nNormal mode: MP3 at 192 kbps.\nExpert mode: Codec and bitrate from the audio settings.\n\nUseful e.g. to save music or podcasts from videos.'**
  String get audioOnlyInfoContent;

  /// Tooltip des Seitenverhältnis-Lock-Buttons (gesperrt)
  ///
  /// In en, this message translates to:
  /// **'Aspect ratio locked'**
  String get aspectLocked;

  /// Tooltip des Seitenverhältnis-Lock-Buttons (entsperrt)
  ///
  /// In en, this message translates to:
  /// **'Aspect ratio unlocked'**
  String get aspectUnlocked;

  /// Titel des CPU-Warnhinweis-Dialogs bei großen Eingabedateien
  ///
  /// In en, this message translates to:
  /// **'Large file'**
  String get cpuWarningTitle;

  /// Inhalt des CPU-Warnhinweis-Dialogs
  ///
  /// In en, this message translates to:
  /// **'This video is longer than 5 minutes. On older devices, the conversion may cause high CPU usage — that\'s normal.\n\nYou can just put your phone aside; the app will keep running in the background.'**
  String get cpuWarningContent;

  /// Checkbox-Label im CPU-Warnhinweis-Dialog
  ///
  /// In en, this message translates to:
  /// **'Don\'t show again'**
  String get cpuWarningCheckbox;

  /// Titel des Speicherplatz-Warndialogs vor der Konvertierung
  ///
  /// In en, this message translates to:
  /// **'Not enough storage'**
  String get storageWarningTitle;

  /// No description provided for @storageWarningContent.
  ///
  /// In en, this message translates to:
  /// **'Your device only has {available} MB free. The conversion needs approximately {required} MB. Please free up some space first.'**
  String storageWarningContent(String available, String required);

  /// Titel des Feedback-Eintrags in den Einstellungen und des Screens
  ///
  /// In en, this message translates to:
  /// **'Feedback & Support'**
  String get feedbackTitle;

  /// Untertitel des Feedback-Eintrags in den Einstellungen
  ///
  /// In en, this message translates to:
  /// **'Send bugs, suggestions or feedback'**
  String get feedbackSubtitle;

  /// Label über dem Kategorie-Dropdown im Feedback-Screen
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get feedbackCategoryLabel;

  /// Dropdown-Option: Bug-Bericht
  ///
  /// In en, this message translates to:
  /// **'Report a Bug'**
  String get feedbackCategoryBug;

  /// Dropdown-Option: Feature-Wunsch
  ///
  /// In en, this message translates to:
  /// **'Feature Request'**
  String get feedbackCategoryFeature;

  /// Dropdown-Option: allgemeines Feedback
  ///
  /// In en, this message translates to:
  /// **'General Feedback'**
  String get feedbackCategoryFeedback;

  /// Placeholder-Text im Nachrichtenfeld des Feedback-Screens
  ///
  /// In en, this message translates to:
  /// **'Describe your issue…'**
  String get feedbackMessageHint;

  /// Beschriftung des Senden-Buttons im Feedback-Screen
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get feedbackSendButton;

  /// No description provided for @notificationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Background Conversion'**
  String get notificationPermissionTitle;

  /// No description provided for @notificationPermissionContent.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications so the conversion can continue while you use other apps. Without this, the app must stay open.'**
  String get notificationPermissionContent;

  /// No description provided for @notificationPermissionNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notificationPermissionNotNow;

  /// No description provided for @notificationPermissionAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get notificationPermissionAllow;

  /// No description provided for @notificationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications in Settings to convert in the background.'**
  String get notificationPermissionDenied;

  /// No description provided for @notificationPermissionOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get notificationPermissionOpenSettings;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @appSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettingsTitle;

  /// No description provided for @appSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-save & privacy settings'**
  String get appSettingsSubtitle;

  /// No description provided for @openSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Open Source'**
  String get openSourceTitle;

  /// No description provided for @openSourceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Licenses & source code'**
  String get openSourceSubtitle;

  /// No description provided for @openSourceLicensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Open Source Licenses'**
  String get openSourceLicensesTitle;

  /// No description provided for @legalSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legalSectionTitle;

  /// No description provided for @proSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get proSectionTitle;

  /// Label für den Encoding-Modus-Toggle (CRF vs. Bitrate)
  ///
  /// In en, this message translates to:
  /// **'Encoding Mode'**
  String get encodingModeLabel;

  /// Segment für CRF-Modus im Encoding-Toggle
  ///
  /// In en, this message translates to:
  /// **'Quality (CRF)'**
  String get encodingModeCrf;

  /// Segment für Bitrate-Modus im Encoding-Toggle
  ///
  /// In en, this message translates to:
  /// **'Bitrate'**
  String get encodingModeBitrate;

  /// Label für die Audiokanal-Auswahl
  ///
  /// In en, this message translates to:
  /// **'Audio channels'**
  String get audioChannelsLabel;

  /// Inhalt des Audiokanal-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Original → keep source channel layout\nStereo → 2.0 (downmix if needed)\nMono → 1 channel (smallest file)\n5.1 → 6-channel surround (only for surround sources)\n\nDownmixing (e.g. 5.1 → Stereo) is supported. Upmixing is not offered.'**
  String get audioChannelsInfoContent;

  /// Audiokanal-Option: Quell-Layout beibehalten
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get audioChannelOriginal;

  /// Label für das Ziel-Bitrate-Dropdown
  ///
  /// In en, this message translates to:
  /// **'Target Bitrate'**
  String get targetBitrateLabel;

  /// Titel des Ziel-Bitrate-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'Target Bitrate'**
  String get targetBitrateInfoTitle;

  /// Inhalt des Ziel-Bitrate-Info-Dialogs
  ///
  /// In en, this message translates to:
  /// **'500 kbps–2 Mbps  → heavy compression, messaging\n4–8 Mbps → 1080p normal/good quality\n12 Mbps → 1080p high / 4K low quality\n20 Mbps → 4K streaming quality\n\nCustom entry: 500–40000 kbps or e.g. \"8 Mbps\"\n\nUnlike CRF, quality may vary between scenes. Use CRF for better results at the same file size.'**
  String get targetBitrateInfoContent;

  /// Settings-Eintrag, öffnet die Play-Store-Detailseite zum Bewerten
  ///
  /// In en, this message translates to:
  /// **'Rate the App'**
  String get rateAppTitle;

  /// Titel des Pro-Hinweis-Dialogs nach mehreren Konvertierungen
  ///
  /// In en, this message translates to:
  /// **'Use without ads'**
  String get proHintTitle;

  /// Text des Pro-Hinweis-Dialogs
  ///
  /// In en, this message translates to:
  /// **'With a one-time purchase, you can permanently remove ads from the app.'**
  String get proHintBody;

  /// Ablehnen-Button im Pro-Hinweis-Dialog
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get proHintLater;

  /// Fehlermeldung wenn restorePurchases scheitert (BillingClient nicht verbunden)
  ///
  /// In en, this message translates to:
  /// **'Could not restore purchases. The Play Store is currently unavailable — please try again.'**
  String get restoreError;

  /// Neutraler Hinweis nach restorePurchases, wenn nichts wiederherzustellen ist
  ///
  /// In en, this message translates to:
  /// **'No previous purchases found.'**
  String get restoreNoPurchases;
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
    'tr',
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
    'that was used.',
  );
}
