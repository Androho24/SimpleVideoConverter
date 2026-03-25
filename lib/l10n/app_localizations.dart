import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

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
    Locale('de'),
    Locale('en')
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
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
