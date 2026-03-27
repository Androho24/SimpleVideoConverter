// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get qualityLabel => 'Kvalita';

  @override
  String get quality1080pHigh => '1080p Vysoká';

  @override
  String get quality1080pMedium => '1080p Střední';

  @override
  String get quality1080pLow => '1080p Nízká';

  @override
  String get quality1080pVeryLow => '1080p velmi nízká';

  @override
  String get quality720pHigh => '720p vysoká';

  @override
  String get quality720pMedium => '720p střední';

  @override
  String get quality720pLow => '720p nízká';

  @override
  String get quality720pVeryLow => '720p velmi nízká';

  @override
  String get quality480pHigh => '480p Vysoká';

  @override
  String get quality480pMedium => '480p Střední';

  @override
  String get quality480pLow => '480p Nízká';

  @override
  String get quality480pVeryLow => '480p Velmi nízká';

  @override
  String get quality360pHigh => ' 360p Vysoká';

  @override
  String get quality360pMedium => '360p Střední';

  @override
  String get quality360pLow => '360p Nízká';

  @override
  String get quality360pVeryLow => '360p Velmi nízká';

  @override
  String get mute => 'Ztlumit';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Vybrat video';

  @override
  String get videoLoading => 'Načítání videa…';

  @override
  String get modeNormal => 'Normální';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Vyberte prosím platný video soubor.';

  @override
  String get fileLoadError =>
      'Soubor se nepodařilo načíst. Vyberte prosím video soubor.';

  @override
  String get previewNotAvailable =>
      'Náhled není k dispozici. Video lze přesto převést.';

  @override
  String get previewNotAvailableLabel =>
      'Náhled není k dispozici\n(Rozlišení je pro toto zařízení příliš vysoké)';

  @override
  String get noVideoLoaded => 'Nejprve nahrajte video.';

  @override
  String get cancelConversionTitle => 'Zrušit převod?';

  @override
  String get cancelConversionContent => 'Dosavadní zpracování bude ztraceno.';

  @override
  String get continueConversion => 'Pokračovat';

  @override
  String get cancel => 'Zrušit';

  @override
  String get discardVideoTitle => 'Zrušit video?';

  @override
  String get discardVideoContent =>
      'Převedené video bude smazáno a nebude uloženo.';

  @override
  String get keep => 'Ponechat';

  @override
  String get discard => 'Zrušit';

  @override
  String get save => 'Uložit';

  @override
  String get saveVideoDialogTitle => 'Uložit video';

  @override
  String get savedSuccess => 'Uloženo!';

  @override
  String get open => 'Otevřít';

  @override
  String get saveError => 'Chyba při ukládání. Možná nemáte dostatek místa.';

  @override
  String get conversionDone => 'Hotovo!';

  @override
  String conversionProgress(String percent) {
    return 'Převod: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Převod se nezdařil: $error';
  }

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get licensesTitle => 'Licence';

  @override
  String get licensesSubtitle => 'Open-source licence této aplikace';

  @override
  String get gplLicenseTitle => 'Text licence GPL-3.0';

  @override
  String get sourceCodeTitle => 'Zdrojový kód (GitHub)';

  @override
  String get privacyPolicyTitle => 'Zásady ochrany osobních údajů';

  @override
  String get imprintTitle => 'Impressum';

  @override
  String get linkOpenError => 'Odkaz se nepodařilo otevřít.';

  @override
  String get muteTooltip => 'Vysvětlení funkce ztlumení';

  @override
  String get muteInfoContent =>
      'Úplně odstraní zvuk z převedeného videa.\n\nUžitečné např. k odstranění šumu v pozadí nebo ke zmenšení velikosti souboru.';

  @override
  String estimatedSize(String size) {
    return 'Odhadovaná velikost: $size MB';
  }

  @override
  String get convertButton => 'Převést';

  @override
  String get crfLabel => 'Kvalita videa (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Kvalita videa';

  @override
  String get crfInfoContent =>
      '0 → bezztrátové (velmi velký soubor)\n18 → vizuálně téměř bezztrátové\n23 → standardní (dobrá rovnováha)\n28 → viditelné ztráty kvality\n51 → nejnižší kvalita\n\nDoporučení: 18–28';

  @override
  String get resolutionLabel => 'Rozlišení';

  @override
  String get resolutionInfoTitle => 'Běžná rozlišení';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nTip: Nechte jedno pole prázdné = druhé se vypočítá proporcionálně.';

  @override
  String get widthLabel => 'Šířka';

  @override
  String get heightLabel => 'Výška';

  @override
  String get emptyEqualsOriginal => 'Prázdné = originál';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Snímky za sekundu';

  @override
  String get fpsInfoContent =>
      'Orig → Zachovat FPS zdrojového videa\n24 → Kinový standard\n25 → Standard PAL/TV (Evropa)\n30 → NTSC/TV, sociální média\n60 → Plynulé, hry, sport';

  @override
  String get audioBitrateLabel => 'Audio bitrate';

  @override
  String get silent => 'Ztlumeno';

  @override
  String get audioBitrateInfoContent =>
      'Ztlumeno → žádný zvuk\n64 kbps → řeč, podcasty\n96 kbps → dobrá kvalita řeči\n128 kbps → standardní hudba\n192 kbps → vysoká kvalita zvuku\n320 kbps → maximální kvalita MP3';

  @override
  String get audioCodecLabel => 'Audio kodek';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard pro MP4, nejlepší kompatibilita\nMP3 → široce rozšířený, mírně zastaralý\nOpus → moderní a efektivní, vhodný pro MKV';

  @override
  String get outputFormatLabel => 'Výstupní formát';

  @override
  String get outputFormatInfoContent =>
      'MP4 → univerzální, nejlepší kompatibilita\nMKV → flexibilní, mnoho kodeků, méně kompatibilní\nMOV → formát Apple/QuickTime\nAVI → zastaralý, široká kompatibilita\nTS → MPEG Transport Stream, TV/streamování';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Co znamenají rozlišení?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → velmi malý soubor,\n např. pro WhatsApp\n\n480p (854×480) → standardní rozlišení (SD)\n\n720p (1280×720) → HD, vhodné pro mobilní zařízení\n\n1080p (1920×1080) → Full HD, standard pro\n YouTube a televizi\n\nVysoká/Střední/Nízká popisuje kvalitu při stejném rozlišení — vyšší = větší soubor.';

  @override
  String get resolutionTooltip => 'Vysvětlení rozlišení';

  @override
  String get trimArea => 'Oblast oříznutí';

  @override
  String trimStartLabel(String time) {
    return 'Začátek: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Konec: $time';
  }

  @override
  String get adLoading => 'Načítání reklamy…';

  @override
  String get convertedPrefix => 'převedeno_';

  @override
  String get removeAdsTitle => 'Odstranit reklamy';

  @override
  String removeAdsSubtitle(String price) {
    return 'Jednorázový nákup – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Bez reklam ✓';

  @override
  String get removeAdsActiveSubtitle => 'Děkujeme za podporu!';

  @override
  String get restorePurchasesTitle => 'Obnovit nákup';

  @override
  String get purchaseButton => 'Koupit';

  @override
  String get purchaseError => 'Nákup se nezdařil. Zkuste to prosím znovu.';

  @override
  String get purchaseSuccess => 'Děkujeme! Reklama byla deaktivována.';

  @override
  String get appName => 'Video konvertor FFmpeg';

  @override
  String get audioOnly => 'Pouze zvuk';

  @override
  String get audioOnlyTooltip => 'Vysvětlení funkce Pouze zvuk';

  @override
  String get audioOnlyInfoContent =>
      'Extrahuje z videa pouze zvukovou stopu – bez obrazu.\n\nNormální režim: MP3 s 192 kbps.\nRežim pro pokročilé: Kodek a datový tok podle nastavení zvuku.\n\nUžitečné například pro ukládání hudby nebo podcastů z videí.';
}
