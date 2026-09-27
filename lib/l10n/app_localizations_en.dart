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
  String get quality2160pHigh => '2160p High';

  @override
  String get quality2160pMedium => '2160p Medium';

  @override
  String get quality2160pLow => '2160p Low';

  @override
  String get quality2160pVeryLow => '2160p Very Low';

  @override
  String get quality1440pHigh => '1440p High';

  @override
  String get quality1440pMedium => '1440p Medium';

  @override
  String get quality1440pLow => '1440p Low';

  @override
  String get quality1440pVeryLow => '1440p Very Low';

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
  String get openGallery => 'Open gallery';

  @override
  String get openVideo => 'Open video';

  @override
  String get autoSaveTitle => 'Auto-save videos to gallery';

  @override
  String get autoSaveSubtitle =>
      'Videos are saved automatically after conversion.';

  @override
  String get videoCodecTitle => 'Video codec';

  @override
  String get videoCodecSubtitle => 'Video codec for conversions in normal mode';

  @override
  String get videoCodecInfoTitle => 'H.264 or H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 offers the best compatibility and usually converts faster.\n\nH.265/HEVC can produce smaller files at comparable visual quality, but conversion takes longer. Older devices or apps may not be able to play the result.\n\nBoth encoders are included in the app and do not depend on codecs installed on the device.';

  @override
  String get saveError =>
      'Error saving. There may not be enough storage space.';

  @override
  String get saveErrorOutOfMemory =>
      'Not enough memory to save this file. Try a shorter clip or lower quality.';

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
  String get crfInfoContentWideScale =>
      '0 → lossless (very large file)\n25 → visually nearly lossless\n30 → standard (good balance)\n38 → visible quality loss\n63 → lowest quality\n\nRecommended: 25–38\n\nVP9 and AV1 use a 0–63 scale: the same value corresponds to a different quality than with H.264/H.265.';

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
  String get expertVideoCodecInfoContent =>
      'H.264 → best compatibility and usually faster encoding\nH.265 → smaller files at comparable quality, slower encoding\nVP9 → efficient open codec for WebM and MKV, slower software encoding\nAV1 → best compression, software-only encoding, experimental\nXvid → legacy MPEG-4 codec for AVI and older players\n\nThe output formats below are enabled according to the selected video and audio codecs.';

  @override
  String get xvidLegacyLabel => 'Xvid (Legacy)';

  @override
  String get av1SlowHint =>
      'AV1 uses software encoding only and is much slower than H.264/H.265.';

  @override
  String get av1HighResHint =>
      'For resolutions above 720p, consider scaling down first.';

  @override
  String get av1ExperimentalTitle => 'AV1 (experimental)';

  @override
  String get av1ExperimentalSubtitle =>
      'Adds AV1 to the codec selection in normal and expert modes. A modern, highly efficient codec that has not yet been fully tested.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard for MP4, best compatibility\nMP3 → widely used legacy codec\nOpus → modern and efficient, ideal for WebM and MKV\nAC3 → Dolby Digital, shown only for surround sources (≥ 3 channels)\nVorbis → open codec for WebM and MKV\n\nIncompatible output formats are disabled automatically.';

  @override
  String get outputFormatLabel => 'Output format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, best compatibility\nMKV → flexible container for all offered codecs\nMOV → Apple/QuickTime workflows\nAVI → legacy format using Xvid\nMPEG-TS → TV and streaming transport stream\nWebM → modern web format using VP9 with Opus or Vorbis\n\nIncompatible formats appear dimmed. Selecting one automatically applies its default video codec and, if needed, a compatible audio codec.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec is supported by: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Output format changed to $format.';
  }

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

  @override
  String get backButton => 'Back';

  @override
  String get appSettingsTitle => 'App Settings';

  @override
  String get appSettingsSubtitle => 'Auto-save & privacy settings';

  @override
  String get openSourceTitle => 'Open Source';

  @override
  String get openSourceSubtitle => 'Licenses & source code';

  @override
  String get openSourceLicensesTitle => 'Open Source Licenses';

  @override
  String get legalSectionTitle => 'Legal';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Encoding Mode';

  @override
  String get encodingModeCrf => 'Quality (CRF)';

  @override
  String get encodingModeBitrate => 'Bitrate';

  @override
  String get audioChannelsLabel => 'Audio channels';

  @override
  String get audioChannelsInfoContent =>
      'Original → keep source channel layout\nStereo → 2.0 (downmix if needed)\nMono → 1 channel (smallest file)\n5.1 → 6-channel surround (only for surround sources)\n\nDownmixing (e.g. 5.1 → Stereo) is supported. Upmixing is not offered.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Target Bitrate';

  @override
  String get targetBitrateInfoTitle => 'Target Bitrate';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → heavy compression, messaging apps\n4–8 Mbps → standard/good quality at 1080p\n12 Mbps → high quality at 1080p / low quality at 4K\n20 Mbps → 4K streaming quality\n\nCustom value: use the pencil icon (500–100000 kbps)\n\nUnlike CRF, quality may vary by scene. Use CRF for better results at the same file size.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 and AV1 reach the same quality at roughly half of these bitrates.';

  @override
  String get rateAppTitle => 'Rate the App';

  @override
  String get proHintTitle => 'Use without ads';

  @override
  String get proHintBody =>
      'With a one-time purchase, you can permanently remove ads from the app.';

  @override
  String get proHintLater => 'Later';

  @override
  String get restoreError =>
      'Could not restore purchases. The Play Store is currently unavailable — please try again.';

  @override
  String get restoreNoPurchases => 'No previous purchases found.';

  @override
  String get hdrCodecSwitched =>
      'HDR video detected — using H.265 for this video so the colors are preserved.';

  @override
  String get themeTitle => 'Appearance';

  @override
  String get themeSubtitle =>
      'Follow the system or choose a light or dark theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get targetBitrateEditTooltip => 'Enter bitrate';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Allowed range: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardware encoder (fast)';

  @override
  String get hwEncoderSubtitle =>
      'Much faster, but needs about twice the bitrate for the same quality. Bitrate mode only.';

  @override
  String get hwEncoderHdrHint =>
      'HDR video — it will be converted with the software encoder so HDR is preserved.';

  @override
  String get hwEncoderFallback =>
      'Hardware encoder failed — converting with the software encoder instead.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format is not supported by the hardware encoder — this format will be converted with the software encoder.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hardware encoder turned off — it only supports bitrate mode.';
}
