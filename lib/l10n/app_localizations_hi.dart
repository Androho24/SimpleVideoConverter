// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get qualityLabel => 'गुणवत्ता';

  @override
  String get quality1080pHigh => '1080p उच्च';

  @override
  String get quality1080pMedium => '1080p मध्यम';

  @override
  String get quality1080pLow => '1080p निम्न';

  @override
  String get quality1080pVeryLow => '1080p बहुत कम';

  @override
  String get quality720pHigh => '720p हाई';

  @override
  String get quality720pMedium => '720p मीडियम';

  @override
  String get quality720pLow => '720p लो';

  @override
  String get quality720pVeryLow => '720p बहुत कम';

  @override
  String get quality480pHigh => '480p High';

  @override
  String get quality480pMedium => '480p Medium';

  @override
  String get quality480pLow => '480p Low';

  @override
  String get quality480pVeryLow => '480p Very Low';

  @override
  String get quality360pHigh => ' 360p High';

  @override
  String get quality360pMedium => '360p Medium';

  @override
  String get quality360pLow => '360p Low';

  @override
  String get quality360pVeryLow => '360p Very Low';

  @override
  String get mute => 'Mute';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'वीडियो चुनें';

  @override
  String get videoLoading => 'वीडियो लोड हो रहा है…';

  @override
  String get modeNormal => 'सामान्य';

  @override
  String get modeExpert => 'विशेषज्ञ';

  @override
  String get invalidVideoFile => 'कृपया एक मान्य वीडियो फ़ाइल चुनें।';

  @override
  String get fileLoadError =>
      'फ़ाइल लोड नहीं हो सकी। कृपया एक वीडियो फ़ाइल चुनें।';

  @override
  String get previewNotAvailable =>
      'पूर्वावलोकन उपलब्ध नहीं है। वीडियो को फिर भी परिवर्तित किया जा सकता है।';

  @override
  String get previewNotAvailableLabel =>
      'पूर्वावलोकन उपलब्ध नहीं है\n(इस डिवाइस के लिए रिज़ॉल्यूशन बहुत अधिक है)';

  @override
  String get noVideoLoaded => 'कृपया पहले एक वीडियो लोड करें।';

  @override
  String get cancelConversionTitle => 'परिवर्तन रद्द करें?';

  @override
  String get cancelConversionContent => 'अब तक हुई सारी प्रगति चली जाएगी।';

  @override
  String get continueConversion => 'जारी रखें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get discardVideoTitle => 'वीडियो हटाएं?';

  @override
  String get discardVideoContent =>
      'परिवर्तित वीडियो हटा दिया जाएगा और सहेजा नहीं जाएगा।';

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
  String get conversionDone => 'हो गया!';

  @override
  String conversionProgress(String percent) {
    return 'रूपांतरण: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'रूपांतरण विफल हो गया: $error';
  }

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get licensesTitle => 'लाइसेंस';

  @override
  String get licensesSubtitle => 'इस ऐप के लिए ओपन-सोर्स लाइसेंस';

  @override
  String get gplLicenseTitle => 'GPL-3.0 लाइसेंस टेक्स्ट';

  @override
  String get sourceCodeTitle => 'सोर्स कोड (GitHub)';

  @override
  String get privacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get imprintTitle => 'कानूनी सूचना';

  @override
  String get linkOpenError => 'लिंक खोलने में असमर्थ।';

  @override
  String get muteTooltip => 'म्यूट समझाया गया';

  @override
  String get muteInfoContent =>
      'परिवर्तित वीडियो से सभी ऑडियो हटाता है।\n\nउपयोगी, उदाहरण के लिए, पृष्ठभूमि शोर को हटाने या फ़ाइल के आकार को कम करने के लिए।';

  @override
  String estimatedSize(String size) {
    return 'Geschätzte Größe: $size MB';
  }

  @override
  String get convertButton => 'Konvertieren';

  @override
  String get crfLabel => 'Videoqualität (CRF)';

  @override
  String get crfInfoTitle => 'सीआरएफ — वीडियो गुणवत्ता';

  @override
  String get crfInfoContent =>
      '0 → बिना हानि के (बहुत बड़ी फ़ाइल)\n18 → लगभग बिना हानि के\n23 → मानक (अच्छा संतुलन)\n28 → गुणवत्ता में स्पष्ट कमी\n51 → सबसे कम गुणवत्ता\n\nअनुशंसा: 18–28';

  @override
  String get resolutionLabel => 'रिज़ॉल्यूशन';

  @override
  String get resolutionInfoTitle => 'सामान्य रिज़ॉल्यूशन';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — फुल एचडी\n1280 × 720 — एचडी\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nसुझाव: एक फ़ील्ड खाली छोड़ें = दूसरा आनुपातिक रूप से गणना किया जाएगा।';

  @override
  String get widthLabel => 'चौड़ाई';

  @override
  String get heightLabel => 'ऊंचाई';

  @override
  String get emptyEqualsOriginal => 'खाली = मूल';

  @override
  String get fpsLabel => 'एफपीएस';

  @override
  String get fpsInfoTitle => 'प्रति सेकंड फ्रेम';

  @override
  String get fpsInfoContent =>
      'ओरिज → स्रोत वीडियो का FPS बनाए रखें\n24 → सिनेमा मानक\n25 → PAL/टीवी मानक (यूरोप)\n30 → NTSC/टीवी, सोशल मीडिया\n60 → स्मूथ, गेमिंग, स्पोर्ट';

  @override
  String get audioBitrateLabel => 'ऑडियो बिटरेट';

  @override
  String get silent => 'म्यूट';

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
  String get orig => 'मूल';

  @override
  String get resolutionExplainTitle => 'रिज़ॉल्यूशन का क्या मतलब है?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → बहुत छोटी फ़ाइल, उदा. व्हाट्सएप के लिए \n\n480p (854×480) → स्टैंडर्ड डेफ़िनिशन (SD) \n\n720p (1280×720) → HD, मोबाइल डिवाइस के लिए अच्छा \n\n1080p (1920×1080) → फुल एचडी, YouTube और टीवी के लिए मानक\n\nउच्च/मध्यम/निम्न समान रिज़ॉल्यूशन पर गुणवत्ता का वर्णन करते हैं — उच्च = बड़ी फ़ाइल।';

  @override
  String get resolutionTooltip => 'रिज़ॉल्यूशन समझाया गया';

  @override
  String get trimArea => 'ट्रिम क्षेत्र';

  @override
  String trimStartLabel(String time) {
    return 'शुरुआत: $time';
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
  String get removeAdsActiveTitle => 'विज्ञापन-मुक्त ✓';

  @override
  String get removeAdsActiveSubtitle => 'आपके समर्थन के लिए धन्यवाद!';

  @override
  String get restorePurchasesTitle => 'खरीदारी पुनर्स्थापित करें';

  @override
  String get purchaseButton => 'खरीदें';

  @override
  String get purchaseError => 'खरीद विफल हो गई। कृपया फिर से प्रयास करें।';

  @override
  String get purchaseSuccess => 'धन्यवाद! विज्ञापन अक्षम कर दिए गए हैं।';

  @override
  String get appName => 'वीडियो कनवर्टर FFmpeg';

  @override
  String get audioOnly => 'केवल ऑडियो';

  @override
  String get audioOnlyTooltip => 'ऑडियो केवल समझाया गया';

  @override
  String get audioOnlyInfoContent =>
      'वीडियो से केवल ऑडियो ट्रैक निकालता है – कोई वीडियो नहीं।\n\nसामान्य मोड: 192 kbps पर MP3।\nविशेषज्ञ मोड: ऑडियो सेटिंग्स से कोडेक और बिटरेट।\n\nउदाहरण के लिए, वीडियो से संगीत या पॉडकास्ट सहेजने के लिए उपयोगी है।';
}
