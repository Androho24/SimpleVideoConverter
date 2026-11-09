// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get qualityLabel => '화질';

  @override
  String get quality2160pHigh => '2160p 높음';

  @override
  String get quality2160pMedium => '2160p 중간';

  @override
  String get quality2160pLow => '2160p 낮음';

  @override
  String get quality2160pVeryLow => '2160p 매우 낮음';

  @override
  String get quality1440pHigh => '1440p 높음';

  @override
  String get quality1440pMedium => '1440p 중간';

  @override
  String get quality1440pLow => '1440p 낮음';

  @override
  String get quality1440pVeryLow => '1440p 매우 낮음';

  @override
  String get quality1080pHigh => '1080p 높음';

  @override
  String get quality1080pMedium => '1080p 중간';

  @override
  String get quality1080pLow => '1080p 낮음';

  @override
  String get quality1080pVeryLow => '1080p 매우 낮음';

  @override
  String get quality720pHigh => '720p 높음';

  @override
  String get quality720pMedium => '720p 중간';

  @override
  String get quality720pLow => '720p 낮음';

  @override
  String get quality720pVeryLow => '720p 매우 낮음';

  @override
  String get quality480pHigh => '480p 높음';

  @override
  String get quality480pMedium => '480p 중간';

  @override
  String get quality480pLow => '480p 낮음';

  @override
  String get quality480pVeryLow => '480p 매우 낮음';

  @override
  String get quality360pHigh => '360p 높음';

  @override
  String get quality360pMedium => '360p 중간';

  @override
  String get quality360pLow => '360p 낮음';

  @override
  String get quality360pVeryLow => '360p 매우 낮음';

  @override
  String get mute => '소리 제거';

  @override
  String get ok => '확인';

  @override
  String get selectVideo => '동영상 선택';

  @override
  String get videoLoading => '동영상 불러오는 중…';

  @override
  String get modeNormal => '일반';

  @override
  String get modeExpert => '전문가';

  @override
  String get invalidVideoFile => '올바른 동영상 파일을 선택하세요.';

  @override
  String get fileLoadError => '파일을 불러올 수 없습니다. 동영상 파일을 선택하세요.';

  @override
  String get previewNotAvailable => '미리보기를 사용할 수 없습니다. 동영상은 변환할 수 있습니다.';

  @override
  String get previewNotAvailableLabel =>
      '미리보기를 사용할 수 없습니다\n(이 기기에서 지원하기에는 해상도가 너무 높습니다)';

  @override
  String get noVideoLoaded => '먼저 동영상을 불러오세요.';

  @override
  String get cancelConversionTitle => '변환을 취소할까요?';

  @override
  String get cancelConversionContent => '지금까지 진행한 변환 작업이 사라집니다.';

  @override
  String get continueConversion => '계속';

  @override
  String get cancel => '취소';

  @override
  String get discardVideoTitle => '동영상을 삭제할까요?';

  @override
  String get discardVideoContent => '변환된 동영상이 저장되지 않고 삭제됩니다.';

  @override
  String get keep => '유지';

  @override
  String get discard => '삭제';

  @override
  String get save => '저장';

  @override
  String get saveVideoDialogTitle => '동영상 저장';

  @override
  String get savedSuccess => '저장되었습니다!';

  @override
  String get open => '열기';

  @override
  String get openGallery => '갤러리 열기';

  @override
  String get openVideo => '동영상 열기';

  @override
  String get autoSaveTitle => '갤러리에 동영상 자동 저장';

  @override
  String get autoSaveSubtitle => '변환이 끝나면 동영상을 자동으로 저장합니다.';

  @override
  String get videoCodecTitle => '동영상 코덱';

  @override
  String get videoCodecSubtitle => '일반 모드에서 변환에 사용할 동영상 코덱';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC, AV1 중 무엇을 선택할까요?';

  @override
  String get videoCodecInfoContent =>
      'H.264는 호환성이 가장 좋고 일반적으로 변환 속도가 더 빠릅니다.\n\nH.265/HEVC는 비슷한 화질로 파일 크기를 더 줄일 수 있지만 변환 시간이 더 오래 걸립니다. 오래된 기기나 앱에서는 변환된 동영상을 재생하지 못할 수 있습니다.\n\nAV1은 작은 파일 크기를 목표로 설계된 최신 코덱입니다. 오래된 기기나 앱에서는 변환된 동영상을 재생하지 못하는 경우가 많습니다.\n\n모든 인코더는 앱에 포함되어 있으며 기기에 설치된 코덱에 의존하지 않습니다.';

  @override
  String get saveError => '저장 중 오류가 발생했습니다. 저장 공간이 부족할 수 있습니다.';

  @override
  String get saveErrorOutOfMemory =>
      '이 파일을 저장할 메모리가 부족합니다. 더 짧은 구간이나 낮은 화질로 시도하세요.';

  @override
  String get conversionDone => '완료!';

  @override
  String conversionProgress(String percent) {
    return '변환 중: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return '변환 실패: $error';
  }

  @override
  String get settingsTitle => '설정';

  @override
  String get licensesTitle => '라이선스';

  @override
  String get licensesSubtitle => '이 앱의 오픈 소스 라이선스';

  @override
  String get gplLicenseTitle => 'GPL-3.0 라이선스 전문';

  @override
  String get sourceCodeTitle => '소스 코드 (GitHub)';

  @override
  String get privacyPolicyTitle => '개인정보처리방침';

  @override
  String get adConsentTitle => '개인정보 보호 설정';

  @override
  String get imprintTitle => '법적 고지';

  @override
  String get linkOpenError => '링크를 열 수 없습니다.';

  @override
  String get muteTooltip => '소리 제거 안내';

  @override
  String get muteInfoContent =>
      '변환된 동영상에서 오디오를 완전히 제거합니다.\n\n배경 소음을 없애거나 파일 크기를 줄일 때 유용합니다.';

  @override
  String estimatedSize(String size) {
    return '예상 크기: $size MB';
  }

  @override
  String get convertButton => '변환';

  @override
  String get crfLabel => '동영상 화질 (CRF)';

  @override
  String get crfInfoTitle => 'CRF — 동영상 화질';

  @override
  String get crfInfoContent =>
      '0 → 무손실 (파일 크기가 매우 큼)\n18 → 눈으로 구분하기 어려운 화질 손실\n23 → 표준 (화질과 용량의 균형)\n28 → 눈에 띄는 화질 손실\n51 → 최저 화질\n\n권장: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → 무손실 (파일 크기가 매우 큼)\n25 → 눈으로 구분하기 어려운 화질 손실\n30 → 표준 (화질과 용량의 균형)\n38 → 눈에 띄는 화질 손실\n63 → 최저 화질\n\n권장: 25–38\n\nVP9과 AV1은 0–63 척도를 사용합니다. 같은 값이라도 H.264/H.265와 화질이 다릅니다.';

  @override
  String get resolutionLabel => '해상도';

  @override
  String get resolutionInfoTitle => '일반적인 해상도';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\n도움말: 한쪽 입력란을 비워 두면 다른 쪽 값에 비례하여 자동으로 계산됩니다.';

  @override
  String get widthLabel => '너비';

  @override
  String get heightLabel => '높이';

  @override
  String get emptyEqualsOriginal => '비워 두면 원본 유지';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => '초당 프레임 수';

  @override
  String get fpsInfoContent =>
      '원본  → 원본 동영상의 FPS 유지\n24    → 영화 표준\n25    → PAL/TV 표준 (유럽)\n30    → NTSC/TV, 소셜 미디어\n60    → 부드러운 움직임, 게임, 스포츠';

  @override
  String get audioBitrateLabel => '오디오 비트레이트';

  @override
  String get silent => '소리 없음';

  @override
  String get audioBitrateInfoContent =>
      '소리 없음   → 오디오 없음\n64 kbps  → 음성, 팟캐스트\n96 kbps  → 선명한 음성\n128 kbps → 일반적인 음악\n192 kbps → 높은 음질\n320 kbps → MP3 최고 음질';

  @override
  String get audioCodecLabel => '오디오 코덱';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → 최고의 호환성, 일반적으로 더 빠른 인코딩\nH.265 → 비슷한 화질로 더 작은 파일, 느린 인코딩\nVP9 → WebM과 MKV용 효율적인 개방형 코덱, 느린 소프트웨어 인코딩\nAV1 → 작은 파일을 위한 최신 코덱, 소프트웨어 인코딩만 지원\nXvid → AVI와 오래된 플레이어용 구형 MPEG-4 코덱\n\n선택한 동영상 및 오디오 코덱에 따라 아래 출력 형식이 활성화됩니다.';

  @override
  String get xvidLegacyLabel => 'Xvid (구형)';

  @override
  String get av1SlowHint => 'AV1은 소프트웨어 인코딩만 사용하며 H.264/H.265보다 훨씬 느립니다.';

  @override
  String get av1HighResHint => '720p보다 높은 해상도라면 먼저 해상도를 낮추는 것이 좋습니다.';

  @override
  String get audioCodecInfoContent =>
      'AAC → MP4의 표준, 최고의 호환성\nMP3 → 널리 쓰이는 구형 코덱\nOpus → 최신 고효율 코덱, WebM과 MKV에 적합\nAC3 → Dolby Digital, 서라운드 원본에만 표시 (≥ 3채널)\nVorbis → WebM과 MKV용 개방형 코덱\n\n호환되지 않는 출력 형식은 자동으로 비활성화됩니다.';

  @override
  String get outputFormatLabel => '출력 형식';

  @override
  String get outputFormatInfoContent =>
      'MP4 → 범용 형식, 최고의 호환성\nMKV → 제공되는 모든 코덱을 지원하는 유연한 컨테이너\nMOV → Apple/QuickTime 작업용\nAVI → Xvid를 사용하는 구형 형식\nMPEG-TS → TV 및 스트리밍용 전송 스트림\nWebM → VP9과 Opus 또는 Vorbis를 사용하는 최신 웹 형식\n\n호환되지 않는 형식은 흐리게 표시됩니다. 해당 형식을 선택하면 기본 동영상 코덱이 자동으로 적용되고, 필요에 따라 호환되는 오디오 코덱도 적용됩니다.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec 지원 형식: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return '출력 형식이 $format(으)로 변경되었습니다.';
  }

  @override
  String get orig => '원본';

  @override
  String get resolutionExplainTitle => '해상도는 무엇을 의미하나요?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → 매우 작은 파일,\n예: WhatsApp 공유용\n\n480p  (854×480)   → 표준 화질 (SD)\n\n720p  (1280×720)  → HD, 모바일 기기에 적합\n\n1080p (1920×1080) → Full HD,\n                          YouTube 및 TV의 표준\n\n높음/중간/낮음은 같은 해상도에서의 화질을 뜻합니다. 화질이 높을수록 파일이 커집니다.';

  @override
  String get resolutionTooltip => '해상도 안내';

  @override
  String get trimArea => '자르기 범위';

  @override
  String trimStartLabel(String time) {
    return '시작: $time';
  }

  @override
  String trimEndLabel(String time) {
    return '종료: $time';
  }

  @override
  String get adLoading => '광고 불러오는 중…';

  @override
  String get convertedPrefix => '변환됨_';

  @override
  String get removeAdsTitle => '광고 제거';

  @override
  String removeAdsSubtitle(String price) {
    return '일회성 구매 – $price';
  }

  @override
  String get removeAdsActiveTitle => '광고 없음 ✓';

  @override
  String get removeAdsActiveSubtitle => '후원해 주셔서 감사합니다!';

  @override
  String get restorePurchasesTitle => '구매 복원';

  @override
  String get purchaseButton => '구매';

  @override
  String get purchaseError => '구매하지 못했습니다. 다시 시도하세요.';

  @override
  String get purchaseSuccess => '감사합니다! 광고가 제거되었습니다.';

  @override
  String get appName => '동영상 변환기';

  @override
  String get audioOnly => '오디오만 추출';

  @override
  String get audioOnlyTooltip => '오디오 추출 안내';

  @override
  String get audioOnlyInfoContent =>
      '동영상에서 영상 없이 오디오 트랙만 추출합니다.\n\n일반 모드: MP3, 192 kbps.\n전문가 모드: 오디오 설정의 코덱과 비트레이트를 사용합니다.\n\n동영상에서 음악이나 팟캐스트를 저장할 때 유용합니다.';

  @override
  String get aspectLocked => '화면 비율 잠금';

  @override
  String get aspectUnlocked => '화면 비율 잠금 해제';

  @override
  String get cpuWarningTitle => '대용량 파일';

  @override
  String get cpuWarningContent =>
      '이 동영상은 5분이 넘습니다. 오래된 기기에서는 변환 중 CPU 사용량이 높아질 수 있으며, 이는 정상입니다.\n\n휴대전화를 잠시 내려놓아도 앱은 백그라운드에서 계속 실행됩니다.';

  @override
  String get cpuWarningCheckbox => '다시 표시하지 않기';

  @override
  String get storageWarningTitle => '저장 공간 부족';

  @override
  String storageWarningContent(String available, String required) {
    return '기기의 남은 저장 공간은 $available MB입니다. 변환에는 약 $required MB가 필요합니다. 먼저 저장 공간을 확보하세요.';
  }

  @override
  String get feedbackTitle => '의견 및 지원';

  @override
  String get feedbackSubtitle => '버그, 제안 또는 의견 보내기';

  @override
  String get feedbackCategoryLabel => '유형';

  @override
  String get feedbackCategoryBug => '버그 신고';

  @override
  String get feedbackCategoryFeature => '기능 요청';

  @override
  String get feedbackCategoryFeedback => '일반 의견';

  @override
  String get feedbackMessageHint => '문제를 설명해 주세요…';

  @override
  String get feedbackSendButton => '보내기';

  @override
  String get notificationPermissionTitle => '백그라운드 변환';

  @override
  String get notificationPermissionContent =>
      '다른 앱을 사용하는 동안에도 변환을 계속하려면 알림을 허용하세요. 허용하지 않으면 이 앱을 계속 열어 두어야 합니다.';

  @override
  String get notificationPermissionNotNow => '나중에';

  @override
  String get notificationPermissionAllow => '허용';

  @override
  String get notificationPermissionDenied => '백그라운드에서 변환하려면 설정에서 알림을 켜세요.';

  @override
  String get notificationPermissionOpenSettings => '설정';

  @override
  String get backButton => '뒤로';

  @override
  String get appSettingsTitle => '앱 설정';

  @override
  String get appSettingsSubtitle => '자동 저장 및 개인정보 보호 설정';

  @override
  String get openSourceTitle => '오픈 소스';

  @override
  String get openSourceSubtitle => '라이선스 및 소스 코드';

  @override
  String get openSourceLicensesTitle => '오픈 소스 라이선스';

  @override
  String get legalSectionTitle => '법적 정보';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => '인코딩 모드';

  @override
  String get encodingModeCrf => '화질 (CRF)';

  @override
  String get encodingModeBitrate => '비트레이트';

  @override
  String get audioChannelsLabel => '오디오 채널';

  @override
  String get audioChannelsInfoContent =>
      '원본 → 원본 채널 구성 유지\n스테레오 → 2.0 (필요시 다운믹스)\n모노 → 1채널 (가장 작은 파일)\n5.1 → 6채널 서라운드 (서라운드 원본만 해당)\n\n다운믹스 (예: 5.1 → 스테레오)를 지원합니다. 업믹스는 제공하지 않습니다.';

  @override
  String get audioChannelOriginal => '원본';

  @override
  String get targetBitrateLabel => '목표 비트레이트';

  @override
  String get targetBitrateInfoTitle => '목표 비트레이트';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → 높은 압축률, 메시지 앱용\n4–8 Mbps → 1080p에서 표준/좋은 화질\n12 Mbps → 1080p에서 높은 화질 / 4K에서 낮은 화질\n20 Mbps → 4K 스트리밍 화질\n\n직접 입력: 연필 아이콘 사용 (500–100000 kbps)\n\nCRF와 달리 장면에 따라 화질이 달라질 수 있습니다. 같은 파일 크기로 더 나은 결과를 얻으려면 CRF를 사용하세요.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9과 AV1은 이 비트레이트의 약 절반으로 같은 화질을 구현합니다.';

  @override
  String get rateAppTitle => '앱 평가';

  @override
  String get proHintTitle => '광고 없이 사용';

  @override
  String get proHintBody => '일회성 구매로 앱의 광고를 영구적으로 제거할 수 있습니다.';

  @override
  String get proHintLater => '나중에';

  @override
  String get restoreError =>
      '구매를 복원할 수 없습니다. 현재 Play 스토어를 사용할 수 없습니다. 다시 시도하세요.';

  @override
  String get restoreNoPurchases => '이전 구매 내역이 없습니다.';

  @override
  String get hdrCodecSwitched =>
      'HDR 동영상이 감지되었습니다. 색상을 유지하기 위해 이 동영상에는 H.265를 사용합니다.';

  @override
  String get themeTitle => '화면 테마';

  @override
  String get themeSubtitle => '시스템 설정을 따르거나 밝은 테마 또는 어두운 테마 선택';

  @override
  String get themeSystem => '시스템 설정';

  @override
  String get themeLight => '밝게';

  @override
  String get themeDark => '어둡게';

  @override
  String get targetBitrateEditTooltip => '비트레이트 입력';

  @override
  String targetBitrateRangeHint(String range) {
    return '허용 범위: $range';
  }

  @override
  String get hwEncoderTitle => '하드웨어 인코더 (빠름)';

  @override
  String get hwEncoderSubtitle =>
      '훨씬 빠르지만 같은 화질을 내려면 비트레이트가 약 두 배 필요합니다. 비트레이트 모드에서만 사용할 수 있습니다.';

  @override
  String get hwEncoderHdrHint => 'HDR 동영상입니다. HDR을 유지하기 위해 소프트웨어 인코더로 변환합니다.';

  @override
  String get hwEncoderFallback => '하드웨어 인코더가 실패하여 소프트웨어 인코더로 변환합니다.';

  @override
  String hwEncoderContainerHint(String format) {
    return '하드웨어 인코더는 $format 형식을 지원하지 않습니다. 이 형식은 소프트웨어 인코더로 변환합니다.';
  }

  @override
  String get hwEncoderDisabledForCrf => '하드웨어 인코더가 꺼졌습니다. 비트레이트 모드만 지원합니다.';

  @override
  String get resolutionPresetLabel => '프리셋';

  @override
  String get resolutionOriginal => '원본';

  @override
  String get resolutionCustom => '사용자 지정';

  @override
  String get aspectRatioLabel => '화면 비율';

  @override
  String get aspectOriginal => '원본';

  @override
  String get aspectCustom => '사용자 지정';

  @override
  String get fitModeLabel => '맞춤 방식';

  @override
  String get fitPad => '여백';

  @override
  String get fitCrop => '자르기';

  @override
  String get fitStretch => '늘이기';

  @override
  String get fitModeInfoContent =>
      '목표 화면 비율이 동영상과 다릅니다.\n\n여백 → 전체 화면을 유지하고 남는 공간은 검은 여백으로 채웁니다\n자르기 → 가운데 부분만 남기고 가장자리는 잘라냅니다\n늘이기 → 프레임을 가득 채우도록 화면을 변형합니다';

  @override
  String get deleteOriginal => '원본 삭제';

  @override
  String get originalTrashed => '원본을 휴지통으로 옮겼습니다. 휴지통에서 복원할 수 있습니다.';

  @override
  String get originalTrashFailed => '원본을 삭제할 수 없습니다.';

  @override
  String get burnInSubtitlesLabel => '자막 추가';

  @override
  String get burnInSubtitlesInfoContent =>
      '영구 표시: 자막을 동영상 화면에 입힙니다. 모든 플레이어에서 표시되며 나중에 끌 수 없습니다. HDR을 유지하는 동영상에서는 자막이 매우 밝게 보일 수 있습니다.\n\n전환 가능: 자막을 별도 트랙으로 추가하여 플레이어에서 켜거나 끌 수 있습니다. 일부 플레이어에서는 표시되지 않으며 동영상을 공유할 때 사라지는 경우가 많습니다. AVI와 MPEG-TS에서는 사용할 수 없습니다.\n\nSRT와 ASS 파일을 지원합니다. 영구 표시 방식과 MKV 파일에서는 ASS의 스타일과 위치가 완전히 유지됩니다. 다른 형식에서는 스타일의 일부만 유지되며 위치는 유지되지 않습니다.';

  @override
  String get subtitleModeBurnIn => '영구 표시';

  @override
  String get subtitleModeTrack => '전환 가능';

  @override
  String get subtitleTrackEmpty => '선택한 동영상 구간에 자막이 없습니다.';

  @override
  String get burnInSubtitlesSelect => 'SRT 또는 ASS 파일 선택';

  @override
  String get burnInSubtitlesRemove => '자막 파일 제거';

  @override
  String get burnInSubtitlesUnsupported => '.srt 또는 .ass 파일을 선택하세요.';

  @override
  String get burnInSubtitlesInvalid => '이 자막 파일을 읽을 수 없거나 유효한 자막이 없습니다.';

  @override
  String get burnInSubtitlesMissing => '자막 파일을 더 이상 사용할 수 없습니다. 다시 선택하세요.';

  @override
  String get subtitleTextSizeLabel => '글자 크기';

  @override
  String get subtitleTextSizeSmall => '작게';

  @override
  String get subtitleTextSizeMedium => '중간';

  @override
  String get subtitleTextSizeLarge => '크게';

  @override
  String get subtitlePositionLabel => '위치';

  @override
  String get subtitlePositionBottom => '아래';

  @override
  String get subtitlePositionTop => '위';

  @override
  String get subtitleBackgroundTitle => '회색 배경';
}
