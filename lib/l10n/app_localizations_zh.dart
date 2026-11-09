// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get qualityLabel => '画质';

  @override
  String get quality2160pHigh => '2160p 高画质';

  @override
  String get quality2160pMedium => '2160p 中画质';

  @override
  String get quality2160pLow => '2160p 低画质';

  @override
  String get quality2160pVeryLow => '2160p 极低画质';

  @override
  String get quality1440pHigh => '1440p 高画质';

  @override
  String get quality1440pMedium => '1440p 中画质';

  @override
  String get quality1440pLow => '1440p 低画质';

  @override
  String get quality1440pVeryLow => '1440p 极低画质';

  @override
  String get quality1080pHigh => '1080p 高画质';

  @override
  String get quality1080pMedium => '1080p 中画质';

  @override
  String get quality1080pLow => '1080p 低画质';

  @override
  String get quality1080pVeryLow => '1080p 极低画质';

  @override
  String get quality720pHigh => '720p 高画质';

  @override
  String get quality720pMedium => '720p 中画质';

  @override
  String get quality720pLow => '720p 低画质';

  @override
  String get quality720pVeryLow => '720p 极低画质';

  @override
  String get quality480pHigh => '480p 高画质';

  @override
  String get quality480pMedium => '480p 中画质';

  @override
  String get quality480pLow => '480p 低画质';

  @override
  String get quality480pVeryLow => '480p 极低画质';

  @override
  String get quality360pHigh => '360p 高画质';

  @override
  String get quality360pMedium => '360p 中画质';

  @override
  String get quality360pLow => '360p 低画质';

  @override
  String get quality360pVeryLow => '360p 极低画质';

  @override
  String get mute => '静音';

  @override
  String get ok => '确定';

  @override
  String get selectVideo => '选择视频';

  @override
  String get videoLoading => '正在加载视频…';

  @override
  String get modeNormal => '普通';

  @override
  String get modeExpert => '专家';

  @override
  String get invalidVideoFile => '请选择有效的视频文件。';

  @override
  String get fileLoadError => '无法加载文件。请选择视频文件。';

  @override
  String get previewNotAvailable => '无法预览，仍可转换视频。';

  @override
  String get previewNotAvailableLabel => '无法预览\n（视频分辨率超出此设备的支持范围）';

  @override
  String get noVideoLoaded => '请先加载视频。';

  @override
  String get cancelConversionTitle => '取消转换？';

  @override
  String get cancelConversionContent => '转换进度将丢失。';

  @override
  String get continueConversion => '继续';

  @override
  String get cancel => '取消';

  @override
  String get discardVideoTitle => '舍弃视频？';

  @override
  String get discardVideoContent => '转换后的视频将被删除，不会保存。';

  @override
  String get keep => '保留';

  @override
  String get discard => '舍弃';

  @override
  String get save => '保存';

  @override
  String get saveVideoDialogTitle => '保存视频';

  @override
  String get savedSuccess => '已保存！';

  @override
  String get open => '打开';

  @override
  String get openGallery => '打开相册';

  @override
  String get openVideo => '打开视频';

  @override
  String get autoSaveTitle => '自动保存视频到相册';

  @override
  String get autoSaveSubtitle => '转换完成后自动保存视频。';

  @override
  String get videoCodecTitle => '视频编解码器';

  @override
  String get videoCodecSubtitle => '普通模式下转换视频使用的编解码器';

  @override
  String get videoCodecInfoTitle => 'H.264、H.265/HEVC 还是 AV1？';

  @override
  String get videoCodecInfoContent =>
      'H.264 兼容性最好，转换速度通常也更快。\n\nH.265/HEVC 可在画质相近的情况下生成更小的文件，但转换时间更长。较旧的设备或应用可能无法播放转换后的视频。\n\nAV1 是为减小文件大小而设计的现代编解码器。较旧的设备和应用往往无法播放转换后的视频。\n\n应用已内置所有编码器，无需依赖设备上安装的编解码器。';

  @override
  String get saveError => '保存出错，可能是存储空间不足。';

  @override
  String get saveErrorOutOfMemory => '内存不足，无法保存此文件。请尝试缩短片段或降低画质。';

  @override
  String get conversionDone => '完成！';

  @override
  String conversionProgress(String percent) {
    return '正在转换：$percent%';
  }

  @override
  String conversionFailed(String error) {
    return '转换失败：$error';
  }

  @override
  String get settingsTitle => '设置';

  @override
  String get licensesTitle => '许可证';

  @override
  String get licensesSubtitle => '本应用使用的开源许可证';

  @override
  String get gplLicenseTitle => 'GPL-3.0 许可证全文';

  @override
  String get sourceCodeTitle => '源代码（GitHub）';

  @override
  String get privacyPolicyTitle => '隐私政策';

  @override
  String get adConsentTitle => '隐私设置';

  @override
  String get imprintTitle => '法律声明';

  @override
  String get linkOpenError => '无法打开链接。';

  @override
  String get muteTooltip => '静音说明';

  @override
  String get muteInfoContent => '彻底移除转换后视频中的音频。\n\n适合用于去除背景噪声或减小文件大小等。';

  @override
  String estimatedSize(String size) {
    return '预计大小：$size MB';
  }

  @override
  String get convertButton => '转换';

  @override
  String get crfLabel => '视频画质（CRF）';

  @override
  String get crfInfoTitle => 'CRF — 视频画质';

  @override
  String get crfInfoContent =>
      '0 → 无损（文件非常大）\n18 → 视觉上接近无损\n23 → 标准（较为均衡）\n28 → 画质有明显损失\n51 → 最低画质\n\n建议：18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → 无损（文件非常大）\n25 → 视觉上接近无损\n30 → 标准（较为均衡）\n38 → 画质有明显损失\n63 → 最低画质\n\n建议：25–38\n\nVP9 和 AV1 使用 0–63 的范围：同一数值对应的画质与 H.264/H.265 不同。';

  @override
  String get resolutionLabel => '分辨率';

  @override
  String get resolutionInfoTitle => '常用分辨率';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K 超高清（UHD）\n2560 × 1440 — 2K QHD\n1920 × 1080 — 全高清（Full HD）\n1280 ×  720 — 高清（HD）\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\n提示：将其中一项留空 = 自动按比例计算该项数值。';

  @override
  String get widthLabel => '宽度';

  @override
  String get heightLabel => '高度';

  @override
  String get emptyEqualsOriginal => '留空 = 原始值';

  @override
  String get fpsLabel => '帧率';

  @override
  String get fpsInfoTitle => '每秒帧数';

  @override
  String get fpsInfoContent =>
      '原始  → 保留源视频帧率\n24    → 电影标准\n25    → PAL/电视标准（欧洲）\n30    → NTSC/电视、社交媒体\n60    → 流畅，适合游戏、体育';

  @override
  String get audioBitrateLabel => '音频码率';

  @override
  String get silent => '无音频';

  @override
  String get audioBitrateInfoContent =>
      '无音频   → 不保留音频\n64 kbps  → 语音、播客\n96 kbps  → 较好的语音音质\n128 kbps → 标准音乐音质\n192 kbps → 高音质\n320 kbps → MP3 最高音质';

  @override
  String get audioCodecLabel => '音频编解码器';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → 兼容性最好，编码速度通常更快\nH.265 → 画质相近时文件更小，编码速度较慢\nVP9 → 适用于 WebM 和 MKV 的高效开放编解码器，软件编码较慢\nAV1 → 适合生成小文件的现代编解码器，仅支持软件编码\nXvid → 适用于 AVI 和旧款播放器的传统 MPEG-4 编解码器\n\n下方可用的输出格式取决于所选的视频和音频编解码器。';

  @override
  String get xvidLegacyLabel => 'Xvid（传统）';

  @override
  String get av1SlowHint => 'AV1 仅支持软件编码，速度远慢于 H.264/H.265。';

  @override
  String get av1HighResHint => '分辨率高于 720p 时，建议先降低分辨率。';

  @override
  String get audioCodecInfoContent =>
      'AAC → MP4 的标准音频编解码器，兼容性最好\nMP3 → 广泛使用的传统编解码器\nOpus → 现代且高效，非常适合 WebM 和 MKV\nAC3 → 杜比数字，仅对环绕声源显示（≥ 3 声道）\nVorbis → 适用于 WebM 和 MKV 的开放编解码器\n\n不兼容的输出格式会自动禁用。';

  @override
  String get outputFormatLabel => '输出格式';

  @override
  String get outputFormatInfoContent =>
      'MP4 → 通用，兼容性最好\nMKV → 灵活的封装格式，支持此处提供的所有编解码器\nMOV → 适用于 Apple/QuickTime 工作流程\nAVI → 使用 Xvid 的传统格式\nMPEG-TS → 用于电视和流媒体的传输流格式\nWebM → 使用 VP9 搭配 Opus 或 Vorbis 的现代网络格式\n\n不兼容的格式显示为灰色。选择后会自动应用该格式的默认视频编解码器，必要时还会切换为兼容的音频编解码器。';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '支持 $videoCodec + $audioCodec 的格式：$formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return '输出格式已更改为 $format。';
  }

  @override
  String get orig => '原始';

  @override
  String get resolutionExplainTitle => '这些分辨率代表什么？';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → 文件很小，\n例如适合通过 WhatsApp 分享\n\n480p  (854×480)   → 标清（SD）\n\n720p  (1280×720)  → 高清（HD），适合移动设备\n\n1080p (1920×1080) → 全高清（Full HD），常用于\n                          YouTube 和电视\n\n高画质/中画质/低画质指相同分辨率下的画质 — 画质越高 = 文件越大。';

  @override
  String get resolutionTooltip => '分辨率说明';

  @override
  String get trimArea => '裁剪范围';

  @override
  String trimStartLabel(String time) {
    return '开始：$time';
  }

  @override
  String trimEndLabel(String time) {
    return '结束：$time';
  }

  @override
  String get adLoading => '正在加载广告…';

  @override
  String get convertedPrefix => '已转换_';

  @override
  String get removeAdsTitle => '移除广告';

  @override
  String removeAdsSubtitle(String price) {
    return '一次性购买 – $price';
  }

  @override
  String get removeAdsActiveTitle => '已移除广告 ✓';

  @override
  String get removeAdsActiveSubtitle => '感谢你的支持！';

  @override
  String get restorePurchasesTitle => '恢复购买';

  @override
  String get purchaseButton => '购买';

  @override
  String get purchaseError => '购买失败，请重试。';

  @override
  String get purchaseSuccess => '谢谢！广告已移除。';

  @override
  String get appName => '视频转换器';

  @override
  String get audioOnly => '仅音频';

  @override
  String get audioOnlyTooltip => '仅音频说明';

  @override
  String get audioOnlyInfoContent =>
      '仅提取视频中的音轨，不保留画面。\n\n普通模式：MP3，192 kbps。\n专家模式：使用音频设置中的编解码器和码率。\n\n适合用于保存视频中的音乐或播客等。';

  @override
  String get aspectLocked => '宽高比已锁定';

  @override
  String get aspectUnlocked => '宽高比已解锁';

  @override
  String get cpuWarningTitle => '大文件';

  @override
  String get cpuWarningContent =>
      '此视频时长超过 5 分钟。在较旧的设备上，转换时 CPU 占用率可能较高，这是正常现象。\n\n你可以将手机放在一旁，应用会继续在后台运行。';

  @override
  String get cpuWarningCheckbox => '不再显示';

  @override
  String get storageWarningTitle => '存储空间不足';

  @override
  String storageWarningContent(String available, String required) {
    return '设备仅剩 $available MB 可用空间，转换大约需要 $required MB。请先释放一些空间。';
  }

  @override
  String get feedbackTitle => '反馈与支持';

  @override
  String get feedbackSubtitle => '报告问题、提出建议或发送反馈';

  @override
  String get feedbackCategoryLabel => '类别';

  @override
  String get feedbackCategoryBug => '报告问题';

  @override
  String get feedbackCategoryFeature => '功能建议';

  @override
  String get feedbackCategoryFeedback => '一般反馈';

  @override
  String get feedbackMessageHint => '请描述你的问题…';

  @override
  String get feedbackSendButton => '发送';

  @override
  String get notificationPermissionTitle => '后台转换';

  @override
  String get notificationPermissionContent =>
      '请允许通知，以便在使用其他应用时继续转换。否则，必须保持本应用打开。';

  @override
  String get notificationPermissionNotNow => '暂不';

  @override
  String get notificationPermissionAllow => '允许';

  @override
  String get notificationPermissionDenied => '请在设置中开启通知，以便在后台转换。';

  @override
  String get notificationPermissionOpenSettings => '设置';

  @override
  String get backButton => '返回';

  @override
  String get appSettingsTitle => '应用设置';

  @override
  String get appSettingsSubtitle => '自动保存与隐私设置';

  @override
  String get openSourceTitle => '开源';

  @override
  String get openSourceSubtitle => '许可证与源代码';

  @override
  String get openSourceLicensesTitle => '开源许可证';

  @override
  String get legalSectionTitle => '法律信息';

  @override
  String get proSectionTitle => '专业版';

  @override
  String get encodingModeLabel => '编码模式';

  @override
  String get encodingModeCrf => '画质（CRF）';

  @override
  String get encodingModeBitrate => '码率';

  @override
  String get audioChannelsLabel => '音频声道';

  @override
  String get audioChannelsInfoContent =>
      '原始 → 保留源音频的声道布局\n立体声 → 2.0（必要时进行缩混）\n单声道 → 1 声道（文件最小）\n5.1 → 6 声道环绕声（仅限环绕声源）\n\n支持缩混（如 5.1 → 立体声），不提供上混功能。';

  @override
  String get audioChannelOriginal => '原始';

  @override
  String get targetBitrateLabel => '目标码率';

  @override
  String get targetBitrateInfoTitle => '目标码率';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → 高压缩率，适合聊天应用\n4–8 Mbps → 1080p 标准/较好画质\n12 Mbps → 1080p 高画质 / 4K 低画质\n20 Mbps → 4K 流媒体画质\n\n自定义数值：点击铅笔图标（500–100000 kbps）\n\n与 CRF 不同，此模式的画质可能随场景变化。使用 CRF 可在相同文件大小下获得更好的画质。';

  @override
  String get targetBitrateWideScaleHint => 'VP9 和 AV1 仅需上述码率的一半左右即可达到相同画质。';

  @override
  String get rateAppTitle => '为应用评分';

  @override
  String get proHintTitle => '无广告使用';

  @override
  String get proHintBody => '一次性购买，即可永久移除应用内的广告。';

  @override
  String get proHintLater => '以后再说';

  @override
  String get restoreError => '无法恢复购买。Play 商店暂时不可用，请重试。';

  @override
  String get restoreNoPurchases => '未找到以往的购买记录。';

  @override
  String get hdrCodecSwitched => '检测到 HDR 视频，本次将使用 H.265 转换以保留色彩。';

  @override
  String get themeTitle => '外观';

  @override
  String get themeSubtitle => '跟随系统，或选择浅色或深色主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get targetBitrateEditTooltip => '输入码率';

  @override
  String targetBitrateRangeHint(String range) {
    return '允许范围：$range';
  }

  @override
  String get hwEncoderTitle => '硬件编码器（快速）';

  @override
  String get hwEncoderSubtitle => '速度快得多，但要达到相同画质，约需两倍码率。仅支持码率模式。';

  @override
  String get hwEncoderHdrHint => '这是 HDR 视频，将使用软件编码器转换以保留 HDR。';

  @override
  String get hwEncoderFallback => '硬件编码失败，正在改用软件编码器转换。';

  @override
  String hwEncoderContainerHint(String format) {
    return '硬件编码器不支持 $format，将使用软件编码器转换为此格式。';
  }

  @override
  String get hwEncoderDisabledForCrf => '硬件编码器已关闭，因为它仅支持码率模式。';

  @override
  String get resolutionPresetLabel => '预设';

  @override
  String get resolutionOriginal => '原始';

  @override
  String get resolutionCustom => '自定义';

  @override
  String get aspectRatioLabel => '宽高比';

  @override
  String get aspectOriginal => '原始';

  @override
  String get aspectCustom => '自定义';

  @override
  String get fitModeLabel => '适配方式';

  @override
  String get fitPad => '留黑边';

  @override
  String get fitCrop => '裁切';

  @override
  String get fitStretch => '拉伸';

  @override
  String get fitModeInfoContent =>
      '目标宽高比与视频不同。\n\n留黑边 → 保留完整画面，其余区域填充黑边\n裁切 → 保留画面中央部分，裁去边缘\n拉伸 → 拉伸画面以填满目标画幅，会导致变形';

  @override
  String get deleteOriginal => '删除原视频';

  @override
  String get originalTrashed => '原视频已移至回收站，可从中恢复。';

  @override
  String get originalTrashFailed => '无法删除原视频。';

  @override
  String get burnInSubtitlesLabel => '添加字幕';

  @override
  String get burnInSubtitlesInfoContent =>
      '永久烧录：字幕会融入视频画面，在任何播放器中都可见，之后无法关闭。在保留 HDR 的视频中，字幕可能会显得很亮。\n\n可开关：字幕会作为独立轨道添加，可在播放器中开启或关闭。并非所有播放器都能显示，分享视频时字幕也往往会丢失。AVI 和 MPEG-TS 不支持此模式。\n\n支持 SRT 和 ASS 文件。使用永久烧录或保存为 MKV 文件时，ASS 的样式和位置会完整保留。其他格式仅保留部分样式，不保留位置。';

  @override
  String get subtitleModeBurnIn => '永久烧录';

  @override
  String get subtitleModeTrack => '可开关';

  @override
  String get subtitleTrackEmpty => '所选视频片段中没有字幕。';

  @override
  String get sharedVideoBusy => '请先完成当前转换，然后重新分享视频。';

  @override
  String get burnInSubtitlesSelect => '选择 SRT 或 ASS 文件';

  @override
  String get burnInSubtitlesRemove => '移除字幕文件';

  @override
  String get burnInSubtitlesUnsupported => '请选择 .srt 或 .ass 文件。';

  @override
  String get burnInSubtitlesInvalid => '无法读取此字幕文件，或文件中没有有效字幕。';

  @override
  String get burnInSubtitlesMissing => '字幕文件已不可用，请重新选择。';

  @override
  String get subtitleTextSizeLabel => '字号';

  @override
  String get subtitleTextSizeSmall => '小';

  @override
  String get subtitleTextSizeMedium => '中';

  @override
  String get subtitleTextSizeLarge => '大';

  @override
  String get subtitlePositionLabel => '位置';

  @override
  String get subtitlePositionBottom => '底部';

  @override
  String get subtitlePositionTop => '顶部';

  @override
  String get subtitleBackgroundTitle => '灰色背景';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get qualityLabel => '畫質';

  @override
  String get quality2160pHigh => '2160p 高';

  @override
  String get quality2160pMedium => '2160p 中';

  @override
  String get quality2160pLow => '2160p 低';

  @override
  String get quality2160pVeryLow => '2160p 極低';

  @override
  String get quality1440pHigh => '1440p 高';

  @override
  String get quality1440pMedium => '1440p 中';

  @override
  String get quality1440pLow => '1440p 低';

  @override
  String get quality1440pVeryLow => '1440p 極低';

  @override
  String get quality1080pHigh => '1080p 高';

  @override
  String get quality1080pMedium => '1080p 中';

  @override
  String get quality1080pLow => '1080p 低';

  @override
  String get quality1080pVeryLow => '1080p 極低';

  @override
  String get quality720pHigh => '720p 高';

  @override
  String get quality720pMedium => '720p 中';

  @override
  String get quality720pLow => '720p 低';

  @override
  String get quality720pVeryLow => '720p 極低';

  @override
  String get quality480pHigh => '480p 高';

  @override
  String get quality480pMedium => '480p 中';

  @override
  String get quality480pLow => '480p 低';

  @override
  String get quality480pVeryLow => '480p 極低';

  @override
  String get quality360pHigh => '360p 高';

  @override
  String get quality360pMedium => '360p 中';

  @override
  String get quality360pLow => '360p 低';

  @override
  String get quality360pVeryLow => '360p 極低';

  @override
  String get mute => '靜音';

  @override
  String get ok => '確定';

  @override
  String get selectVideo => '選擇影片';

  @override
  String get videoLoading => '正在載入影片…';

  @override
  String get modeNormal => '一般';

  @override
  String get modeExpert => '專家';

  @override
  String get invalidVideoFile => '請選擇有效的影片檔案。';

  @override
  String get fileLoadError => '無法載入檔案。請選擇影片檔案。';

  @override
  String get previewNotAvailable => '無法預覽，仍可轉檔。';

  @override
  String get previewNotAvailableLabel => '無法預覽\n（解析度超出此裝置的支援範圍）';

  @override
  String get noVideoLoaded => '請先載入影片。';

  @override
  String get cancelConversionTitle => '要取消轉檔嗎？';

  @override
  String get cancelConversionContent => '目前的轉檔進度將會遺失。';

  @override
  String get continueConversion => '繼續';

  @override
  String get cancel => '取消';

  @override
  String get discardVideoTitle => '要捨棄影片嗎？';

  @override
  String get discardVideoContent => '轉檔後的影片將被刪除，不會儲存。';

  @override
  String get keep => '保留';

  @override
  String get discard => '捨棄';

  @override
  String get save => '儲存';

  @override
  String get saveVideoDialogTitle => '儲存影片';

  @override
  String get savedSuccess => '已儲存！';

  @override
  String get open => '開啟';

  @override
  String get openGallery => '開啟相簿';

  @override
  String get openVideo => '開啟影片';

  @override
  String get autoSaveTitle => '自動將影片儲存至相簿';

  @override
  String get autoSaveSubtitle => '轉檔完成後自動儲存影片。';

  @override
  String get videoCodecTitle => '影片編解碼器';

  @override
  String get videoCodecSubtitle => '一般模式轉檔時使用的影片編解碼器';

  @override
  String get videoCodecInfoTitle => 'H.264、H.265/HEVC 還是 AV1？';

  @override
  String get videoCodecInfoContent =>
      'H.264 的相容性最佳，轉檔通常也較快。\n\nH.265/HEVC 可在相近畫質下產生較小的檔案，但轉檔需要較長時間。較舊的裝置或應用程式可能無法播放轉檔後的影片。\n\nAV1 是專為縮小檔案而設計的現代編解碼器。較舊的裝置和應用程式通常無法播放轉檔後的影片。\n\n所有編碼器都已內建於應用程式中，不需依賴裝置上安裝的編解碼器。';

  @override
  String get saveError => '儲存失敗，儲存空間可能不足。';

  @override
  String get saveErrorOutOfMemory => '記憶體不足，無法儲存此檔案。請嘗試縮短片段或降低畫質。';

  @override
  String get conversionDone => '完成！';

  @override
  String conversionProgress(String percent) {
    return '轉檔中：$percent%';
  }

  @override
  String conversionFailed(String error) {
    return '轉檔失敗：$error';
  }

  @override
  String get settingsTitle => '設定';

  @override
  String get licensesTitle => '授權';

  @override
  String get licensesSubtitle => '本應用程式使用的開放原始碼授權';

  @override
  String get gplLicenseTitle => 'GPL-3.0 授權條款';

  @override
  String get sourceCodeTitle => '原始碼（GitHub）';

  @override
  String get privacyPolicyTitle => '隱私權政策';

  @override
  String get adConsentTitle => '隱私權設定';

  @override
  String get imprintTitle => '營運者資訊';

  @override
  String get linkOpenError => '無法開啟連結。';

  @override
  String get muteTooltip => '靜音說明';

  @override
  String get muteInfoContent => '完全移除轉檔後影片中的音訊。\n\n可用來移除背景雜音或縮小檔案。';

  @override
  String estimatedSize(String size) {
    return '預估大小：$size MB';
  }

  @override
  String get convertButton => '轉檔';

  @override
  String get crfLabel => '畫質（CRF）';

  @override
  String get crfInfoTitle => 'CRF — 畫質';

  @override
  String get crfInfoContent =>
      '0 → 無損（檔案極大）\n18 → 視覺上幾乎無損\n23 → 標準（畫質與檔案大小均衡）\n28 → 畫質明顯下降\n51 → 最低畫質\n\n建議：18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → 無損（檔案極大）\n25 → 視覺上幾乎無損\n30 → 標準（畫質與檔案大小均衡）\n38 → 畫質明顯下降\n63 → 最低畫質\n\n建議：25–38\n\nVP9 和 AV1 使用 0–63 的刻度：相同數值所對應的畫質與 H.264/H.265 不同。';

  @override
  String get resolutionLabel => '解析度';

  @override
  String get resolutionInfoTitle => '常見解析度';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\n提示：留空其中一個欄位 = 依另一個欄位的數值按比例計算。';

  @override
  String get widthLabel => '寬度';

  @override
  String get heightLabel => '高度';

  @override
  String get emptyEqualsOriginal => '留空 = 原始值';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => '每秒影格數';

  @override
  String get fpsInfoContent =>
      '原始  → 保留來源影片的 FPS\n24    → 電影標準\n25    → PAL/電視標準（歐洲）\n30    → NTSC/電視、社群媒體\n60    → 流暢畫面、遊戲、運動';

  @override
  String get audioBitrateLabel => '音訊位元率';

  @override
  String get silent => '無聲';

  @override
  String get audioBitrateInfoContent =>
      '無聲     → 無音訊\n64 kbps  → 人聲、Podcast\n96 kbps  → 良好的人聲音質\n128 kbps → 標準音樂音質\n192 kbps → 高音質\n320 kbps → MP3 最高音質';

  @override
  String get audioCodecLabel => '音訊編解碼器';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → 相容性最佳，編碼通常較快\nH.265 → 相近畫質下檔案較小，編碼較慢\nVP9 → 高效率的開放編解碼器，適用於 WebM 和 MKV，軟體編碼較慢\nAV1 → 適合小檔案的現代編解碼器，僅支援軟體編碼\nXvid → 舊式 MPEG-4 編解碼器，適用於 AVI 和較舊的播放器\n\n下方可用的輸出格式會依所選的影片及音訊編解碼器調整。';

  @override
  String get xvidLegacyLabel => 'Xvid（舊式）';

  @override
  String get av1SlowHint => 'AV1 僅支援軟體編碼，速度遠慢於 H.264/H.265。';

  @override
  String get av1HighResHint => '解析度高於 720p 時，建議先降低解析度。';

  @override
  String get audioCodecInfoContent =>
      'AAC → MP4 的標準音訊編解碼器，相容性最佳\nMP3 → 廣泛使用的舊式編解碼器\nOpus → 現代且高效率，適合 WebM 和 MKV\nAC3 → Dolby Digital，僅在來源為環繞音效時顯示（≥ 3 聲道）\nVorbis → 適用於 WebM 和 MKV 的開放編解碼器\n\n不相容的輸出格式會自動停用。';

  @override
  String get outputFormatLabel => '輸出格式';

  @override
  String get outputFormatInfoContent =>
      'MP4 → 通用格式，相容性最佳\nMKV → 彈性高的容器格式，支援所有提供的編解碼器\nMOV → 適用於 Apple/QuickTime 工作流程\nAVI → 使用 Xvid 的舊式格式\nMPEG-TS → 電視與串流使用的傳輸串流格式\nWebM → 現代網頁格式，使用 VP9 搭配 Opus 或 Vorbis\n\n不相容的格式會以灰色顯示。選取後會自動套用該格式的預設影片編解碼器，並視需要切換為相容的音訊編解碼器。';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '支援 $videoCodec + $audioCodec 的格式：$formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return '輸出格式已改為 $format。';
  }

  @override
  String get orig => '原始';

  @override
  String get resolutionExplainTitle => '各種解析度代表什麼？';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → 檔案很小，\n例如用於 WhatsApp\n\n480p  (854×480)   → 標準畫質（SD）\n\n720p  (1280×720)  → HD，適合行動裝置\n\n1080p (1920×1080) → Full HD，為下列平台的標準：\n                          YouTube 與電視\n\n高／中／低代表相同解析度下的畫質 — 畫質越高 = 檔案越大。';

  @override
  String get resolutionTooltip => '解析度說明';

  @override
  String get trimArea => '修剪範圍';

  @override
  String trimStartLabel(String time) {
    return '起點：$time';
  }

  @override
  String trimEndLabel(String time) {
    return '終點：$time';
  }

  @override
  String get adLoading => '正在載入廣告…';

  @override
  String get convertedPrefix => '已轉檔_';

  @override
  String get removeAdsTitle => '移除廣告';

  @override
  String removeAdsSubtitle(String price) {
    return '一次性購買 – $price';
  }

  @override
  String get removeAdsActiveTitle => '無廣告 ✓';

  @override
  String get removeAdsActiveSubtitle => '感謝支持！';

  @override
  String get restorePurchasesTitle => '還原購買項目';

  @override
  String get purchaseButton => '購買';

  @override
  String get purchaseError => '購買失敗，請再試一次。';

  @override
  String get purchaseSuccess => '謝謝！已移除廣告。';

  @override
  String get appName => '影片轉檔工具';

  @override
  String get audioOnly => '僅音訊';

  @override
  String get audioOnlyTooltip => '僅音訊說明';

  @override
  String get audioOnlyInfoContent =>
      '僅擷取影片中的音軌，不包含畫面。\n\n一般模式：MP3，位元率為 192 kbps。\n專家模式：使用音訊設定中的編解碼器和位元率。\n\n可用來儲存影片中的音樂或 Podcast。';

  @override
  String get aspectLocked => '已鎖定長寬比';

  @override
  String get aspectUnlocked => '已解除長寬比鎖定';

  @override
  String get cpuWarningTitle => '大型檔案';

  @override
  String get cpuWarningContent =>
      '這部影片超過 5 分鐘。在較舊的裝置上，轉檔可能會使 CPU 使用率升高，這是正常現象。\n\n你可以先把手機放在一旁，應用程式會繼續在背景執行。';

  @override
  String get cpuWarningCheckbox => '不再顯示';

  @override
  String get storageWarningTitle => '儲存空間不足';

  @override
  String storageWarningContent(String available, String required) {
    return '裝置僅剩 $available MB 的可用空間，轉檔約需 $required MB。請先釋放一些空間。';
  }

  @override
  String get feedbackTitle => '意見回饋與支援';

  @override
  String get feedbackSubtitle => '回報錯誤、提出建議或提供意見';

  @override
  String get feedbackCategoryLabel => '類別';

  @override
  String get feedbackCategoryBug => '回報錯誤';

  @override
  String get feedbackCategoryFeature => '功能建議';

  @override
  String get feedbackCategoryFeedback => '一般意見';

  @override
  String get feedbackMessageHint => '請描述遇到的問題…';

  @override
  String get feedbackSendButton => '傳送';

  @override
  String get notificationPermissionTitle => '背景轉檔';

  @override
  String get notificationPermissionContent =>
      '允許通知後，使用其他應用程式時仍可繼續轉檔。若不允許，必須保持此應用程式開啟。';

  @override
  String get notificationPermissionNotNow => '暫時不要';

  @override
  String get notificationPermissionAllow => '允許';

  @override
  String get notificationPermissionDenied => '請在設定中啟用通知，以便在背景轉檔。';

  @override
  String get notificationPermissionOpenSettings => '設定';

  @override
  String get backButton => '返回';

  @override
  String get appSettingsTitle => '應用程式設定';

  @override
  String get appSettingsSubtitle => '自動儲存與隱私權設定';

  @override
  String get openSourceTitle => '開放原始碼';

  @override
  String get openSourceSubtitle => '授權與原始碼';

  @override
  String get openSourceLicensesTitle => '開放原始碼授權';

  @override
  String get legalSectionTitle => '法律資訊';

  @override
  String get proSectionTitle => '進階版';

  @override
  String get encodingModeLabel => '編碼模式';

  @override
  String get encodingModeCrf => '畫質（CRF）';

  @override
  String get encodingModeBitrate => '位元率';

  @override
  String get audioChannelsLabel => '音訊聲道';

  @override
  String get audioChannelsInfoContent =>
      '原始 → 保留來源的聲道配置\n立體聲 → 2.0（必要時混音為較少聲道）\n單聲道 → 1 聲道（檔案最小）\n5.1 → 6 聲道環繞音效（僅適用於環繞音效來源）\n\n支援將多聲道混音為較少聲道（例如 5.1 → 立體聲），不提供增加聲道的混音功能。';

  @override
  String get audioChannelOriginal => '原始';

  @override
  String get targetBitrateLabel => '目標位元率';

  @override
  String get targetBitrateInfoTitle => '目標位元率';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → 高度壓縮，適合通訊應用程式\n4–8 Mbps → 1080p 標準／良好畫質\n12 Mbps → 1080p 高畫質／4K 低畫質\n20 Mbps → 4K 串流畫質\n\n自訂數值：使用鉛筆圖示（500–100000 kbps）\n\n與 CRF 不同，畫質可能隨場景而變化。使用 CRF 可在相同檔案大小下獲得更好的效果。';

  @override
  String get targetBitrateWideScaleHint => 'VP9 和 AV1 約以這些位元率的一半，就能達到相同畫質。';

  @override
  String get rateAppTitle => '為應用程式評分';

  @override
  String get proHintTitle => '享受無廣告體驗';

  @override
  String get proHintBody => '只需一次性購買，即可永久移除應用程式中的廣告。';

  @override
  String get proHintLater => '稍後再說';

  @override
  String get restoreError => '無法還原購買項目。Play 商店目前無法使用，請再試一次。';

  @override
  String get restoreNoPurchases => '找不到先前的購買項目。';

  @override
  String get hdrCodecSwitched => '偵測到 HDR 影片，這次將使用 H.265 轉檔以保留色彩。';

  @override
  String get themeTitle => '外觀';

  @override
  String get themeSubtitle => '跟隨系統，或選擇淺色或深色主題';

  @override
  String get themeSystem => '系統';

  @override
  String get themeLight => '淺色';

  @override
  String get themeDark => '深色';

  @override
  String get targetBitrateEditTooltip => '輸入位元率';

  @override
  String targetBitrateRangeHint(String range) {
    return '允許範圍：$range';
  }

  @override
  String get hwEncoderTitle => '硬體編碼器（快速）';

  @override
  String get hwEncoderSubtitle => '速度快很多，但要達到相同畫質，約需兩倍的位元率。僅適用於位元率模式。';

  @override
  String get hwEncoderHdrHint => '這是 HDR 影片，將使用軟體編碼器轉檔，以保留 HDR。';

  @override
  String get hwEncoderFallback => '硬體編碼失敗，改用軟體編碼器轉檔。';

  @override
  String hwEncoderContainerHint(String format) {
    return '硬體編碼器不支援 $format，此格式將使用軟體編碼器轉檔。';
  }

  @override
  String get hwEncoderDisabledForCrf => '已關閉硬體編碼器，因為它僅支援位元率模式。';

  @override
  String get resolutionPresetLabel => '預設';

  @override
  String get resolutionOriginal => '原始';

  @override
  String get resolutionCustom => '自訂';

  @override
  String get aspectRatioLabel => '長寬比';

  @override
  String get aspectOriginal => '原始';

  @override
  String get aspectCustom => '自訂';

  @override
  String get fitModeLabel => '調整方式';

  @override
  String get fitPad => '加黑邊';

  @override
  String get fitCrop => '裁切';

  @override
  String get fitStretch => '拉伸';

  @override
  String get fitModeInfoContent =>
      '目標長寬比與影片不同。\n\n加黑邊 → 保留完整畫面，其餘區域以黑邊填滿\n裁切 → 擷取中央區域，捨去邊緣\n拉伸 → 拉伸畫面以填滿影格，畫面會變形';

  @override
  String get deleteOriginal => '刪除原始影片';

  @override
  String get originalTrashed => '原始影片已移至垃圾桶，可從垃圾桶還原。';

  @override
  String get originalTrashFailed => '無法刪除原始影片。';

  @override
  String get burnInSubtitlesLabel => '加入字幕';

  @override
  String get burnInSubtitlesInfoContent =>
      '永久燒錄：將字幕直接繪入影片畫面，所有播放器都能顯示，之後無法關閉。影片若保留 HDR，字幕可能會顯得很亮。\n\n可開關：將字幕加入為獨立字幕軌，可在播放器中開啟或關閉。並非所有播放器都能顯示，分享影片時也常會遺失。不適用於 AVI 和 MPEG-TS。\n\n支援 SRT 和 ASS 檔案。使用永久燒錄或 MKV 檔案時，可完整保留 ASS 的樣式與位置。其他格式僅保留部分樣式，不保留位置。';

  @override
  String get subtitleModeBurnIn => '永久燒錄';

  @override
  String get subtitleModeTrack => '可開關';

  @override
  String get subtitleTrackEmpty => '所選的影片片段中沒有字幕。';

  @override
  String get sharedVideoBusy => '請先完成目前的轉檔，然後再次分享影片。';

  @override
  String get burnInSubtitlesSelect => '選擇 SRT 或 ASS 檔案';

  @override
  String get burnInSubtitlesRemove => '移除字幕檔案';

  @override
  String get burnInSubtitlesUnsupported => '請選擇 .srt 或 .ass 檔案。';

  @override
  String get burnInSubtitlesInvalid => '無法讀取此字幕檔案，或檔案中沒有有效字幕。';

  @override
  String get burnInSubtitlesMissing => '字幕檔案已無法使用，請重新選擇。';

  @override
  String get subtitleTextSizeLabel => '文字大小';

  @override
  String get subtitleTextSizeSmall => '小';

  @override
  String get subtitleTextSizeMedium => '中';

  @override
  String get subtitleTextSizeLarge => '大';

  @override
  String get subtitlePositionLabel => '位置';

  @override
  String get subtitlePositionBottom => '下方';

  @override
  String get subtitlePositionTop => '上方';

  @override
  String get subtitleBackgroundTitle => '灰色背景';
}
