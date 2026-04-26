// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get qualityLabel => 'Quality';

  @override
  String get quality1080pHigh => '1080p High';

  @override
  String get quality1080pMedium => '1080p Medium';

  @override
  String get quality1080pLow => '1080p Low';

  @override
  String get quality1080pVeryLow => '1080p Very Low';

  @override
  String get quality720pHigh => '720p High';

  @override
  String get quality720pMedium => '720p Medium';

  @override
  String get quality720pLow => '720p Low';

  @override
  String get quality720pVeryLow => '720p Very Low';

  @override
  String get quality480pHigh => '480p High';

  @override
  String get quality480pMedium => '480p Medium';

  @override
  String get quality480pLow => '480p Low';

  @override
  String get quality480pVeryLow => '480p Very Low';

  @override
  String get quality360pHigh => '360p High';

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
  String get selectVideo => 'Select video';

  @override
  String get videoLoading => 'Loading video…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Please select a valid video file.';

  @override
  String get fileLoadError =>
      'The file could not be loaded. Please select a video file.';

  @override
  String get previewNotAvailable =>
      'Preview not available. The video can still be converted.';

  @override
  String get previewNotAvailableLabel =>
      'Preview not available\n(Resolution too high for this device)';

  @override
  String get noVideoLoaded => 'Please load a video first.';

  @override
  String get cancelConversionTitle => 'Cancel conversion?';

  @override
  String get cancelConversionContent => 'The conversion progress will be lost.';

  @override
  String get continueConversion => 'Continue';

  @override
  String get cancel => 'Cancel';

  @override
  String get discardVideoTitle => 'Discard video?';

  @override
  String get discardVideoContent =>
      'The converted video will be deleted and not saved.';

  @override
  String get keep => 'Keep';

  @override
  String get discard => 'Discard';

  @override
  String get save => 'Save';

  @override
  String get saveVideoDialogTitle => 'Save video';

  @override
  String get savedSuccess => 'Saved!';

  @override
  String get open => 'Open';

  @override
  String get saveError =>
      'Error saving. There may not be enough storage space.';

  @override
  String get conversionDone => 'Done!';

  @override
  String conversionProgress(String percent) {
    return 'Converting: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Conversion failed: $error';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get licensesTitle => 'Licenses';

  @override
  String get licensesSubtitle => 'Open-source licenses of this app';

  @override
  String get gplLicenseTitle => 'GPL-3.0 License Text';

  @override
  String get sourceCodeTitle => 'Source Code (GitHub)';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String get adConsentTitle => 'Privacy Settings';

  @override
  String get imprintTitle => 'Imprint';

  @override
  String get linkOpenError => 'The link could not be opened.';

  @override
  String get muteTooltip => 'Mute explained';

  @override
  String get muteInfoContent =>
      'Removes audio completely from the converted video.\n\nUseful e.g. to remove background noise or reduce file size.';

  @override
  String estimatedSize(String size) {
    return 'Estimated size: $size MB';
  }

  @override
  String get convertButton => 'Convert';

  @override
  String get crfLabel => 'Video quality (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Video quality';

  @override
  String get crfInfoContent =>
      '0 → lossless (very large file)\n18 → visually nearly lossless\n23 → standard (good balance)\n28 → visible quality loss\n51 → lowest quality\n\nRecommended: 18–28';

  @override
  String get resolutionLabel => 'Resolution';

  @override
  String get resolutionInfoTitle => 'Common resolutions';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTip: Leave one field empty = the other will be calculated proportionally.';

  @override
  String get widthLabel => 'Width';

  @override
  String get heightLabel => 'Height';

  @override
  String get emptyEqualsOriginal => 'Empty = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Frames per second';

  @override
  String get fpsInfoContent =>
      'Orig  → Keep source video FPS\n24    → Cinema standard\n25    → PAL/TV standard (Europe)\n30    → NTSC/TV, social media\n60    → Smooth, gaming, sports';

  @override
  String get audioBitrateLabel => 'Audio bitrate';

  @override
  String get silent => 'Silent';

  @override
  String get audioBitrateInfoContent =>
      'Silent   → no audio\n64 kbps  → voice, podcasts\n96 kbps  → good voice quality\n128 kbps → standard music\n192 kbps → high audio quality\n320 kbps → maximum MP3 quality';

  @override
  String get audioCodecLabel => 'Audio codec';

  @override
  String get audioCodecInfoContent =>
      'AAC  → standard for MP4, best compatibility\nMP3  → widely used, slightly outdated\nOpus → modern & efficient, great for MKV';

  @override
  String get outputFormatLabel => 'Output format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, best compatibility\nMKV → flexible, many codecs, less compatible\nMOV → Apple/QuickTime format\nAVI → outdated, broad compatibility\nTS  → MPEG transport stream, TV/streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'What do the resolutions mean?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → very small file,\ne.g. for WhatsApp\n\n480p  (854×480)   → Standard Definition (SD)\n\n720p  (1280×720)  → HD, good for mobile devices\n\n1080p (1920×1080) → Full HD, standard for\n                          YouTube & TV\n\nHigh/Medium/Low describes quality at the same resolution — higher = larger file.';

  @override
  String get resolutionTooltip => 'Resolutions explained';

  @override
  String get trimArea => 'Trim range';

  @override
  String trimStartLabel(String time) {
    return 'Start: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'End: $time';
  }

  @override
  String get adLoading => 'Loading ad…';

  @override
  String get convertedPrefix => 'converted_';

  @override
  String get removeAdsTitle => 'Remove Ads';

  @override
  String removeAdsSubtitle(String price) {
    return 'One-time purchase – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Ad-free ✓';

  @override
  String get removeAdsActiveSubtitle => 'Thank you for your support!';

  @override
  String get restorePurchasesTitle => 'Restore purchase';

  @override
  String get purchaseButton => 'Buy';

  @override
  String get purchaseError => 'Purchase failed. Please try again.';

  @override
  String get purchaseSuccess => 'Thanks! Ads have been disabled.';

  @override
  String get appName => 'Video Converter';

  @override
  String get audioOnly => 'Audio Only';

  @override
  String get audioOnlyTooltip => 'Audio Only explained';

  @override
  String get audioOnlyInfoContent =>
      'Extracts only the audio track from the video — no picture.\n\nNormal mode: MP3 at 192 kbps.\nExpert mode: Codec and bitrate from the audio settings.\n\nUseful e.g. to save music or podcasts from videos.';

  @override
  String get aspectLocked => 'Aspect ratio locked';

  @override
  String get aspectUnlocked => 'Aspect ratio unlocked';

  @override
  String get cpuWarningTitle => 'Large file';

  @override
  String get cpuWarningContent =>
      'This video is longer than 5 minutes. On older devices, the conversion may cause high CPU usage — that\'s normal.\n\nYou can just put your phone aside; the app will keep running in the background.';

  @override
  String get cpuWarningCheckbox => 'Don\'t show again';

  @override
  String get storageWarningTitle => 'Not enough storage';

  @override
  String storageWarningContent(String available, String required) {
    return 'Your device only has $available MB free. The conversion needs approximately $required MB. Please free up some space first.';
  }

  @override
  String get feedbackTitle => 'Feedback & Support';

  @override
  String get feedbackSubtitle => 'Send bugs, suggestions or feedback';

  @override
  String get feedbackCategoryLabel => 'Category';

  @override
  String get feedbackCategoryBug => 'Report a Bug';

  @override
  String get feedbackCategoryFeature => 'Feature Request';

  @override
  String get feedbackCategoryFeedback => 'General Feedback';

  @override
  String get feedbackMessageHint => 'Describe your issue…';

  @override
  String get feedbackSendButton => 'Send';

  @override
  String get notificationPermissionTitle => 'Background Conversion';

  @override
  String get notificationPermissionContent =>
      'Allow notifications so the conversion can continue while you use other apps. Without this, the app must stay open.';

  @override
  String get notificationPermissionNotNow => 'Not Now';

  @override
  String get notificationPermissionAllow => 'Allow';

  @override
  String get notificationPermissionDenied =>
      'Enable notifications in Settings to convert in the background.';

  @override
  String get notificationPermissionOpenSettings => 'Settings';
}
