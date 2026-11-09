// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get qualityLabel => 'Chất lượng';

  @override
  String get quality2160pHigh => '2160p Cao';

  @override
  String get quality2160pMedium => '2160p Trung bình';

  @override
  String get quality2160pLow => '2160p Thấp';

  @override
  String get quality2160pVeryLow => '2160p Rất thấp';

  @override
  String get quality1440pHigh => '1440p Cao';

  @override
  String get quality1440pMedium => '1440p Trung bình';

  @override
  String get quality1440pLow => '1440p Thấp';

  @override
  String get quality1440pVeryLow => '1440p Rất thấp';

  @override
  String get quality1080pHigh => '1080p Cao';

  @override
  String get quality1080pMedium => '1080p Trung bình';

  @override
  String get quality1080pLow => '1080p Thấp';

  @override
  String get quality1080pVeryLow => '1080p Rất thấp';

  @override
  String get quality720pHigh => '720p Cao';

  @override
  String get quality720pMedium => '720p Trung bình';

  @override
  String get quality720pLow => '720p Thấp';

  @override
  String get quality720pVeryLow => '720p Rất thấp';

  @override
  String get quality480pHigh => '480p Cao';

  @override
  String get quality480pMedium => '480p Trung bình';

  @override
  String get quality480pLow => '480p Thấp';

  @override
  String get quality480pVeryLow => '480p Rất thấp';

  @override
  String get quality360pHigh => '360p Cao';

  @override
  String get quality360pMedium => '360p Trung bình';

  @override
  String get quality360pLow => '360p Thấp';

  @override
  String get quality360pVeryLow => '360p Rất thấp';

  @override
  String get mute => 'Tắt tiếng';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Chọn video';

  @override
  String get videoLoading => 'Đang tải video…';

  @override
  String get modeNormal => 'Thông thường';

  @override
  String get modeExpert => 'Chuyên gia';

  @override
  String get invalidVideoFile => 'Vui lòng chọn một tệp video hợp lệ.';

  @override
  String get fileLoadError => 'Không thể tải tệp. Vui lòng chọn một tệp video.';

  @override
  String get previewNotAvailable =>
      'Không thể xem trước. Bạn vẫn có thể chuyển đổi video.';

  @override
  String get previewNotAvailableLabel =>
      'Không thể xem trước\n(Độ phân giải quá cao đối với thiết bị này)';

  @override
  String get noVideoLoaded => 'Vui lòng tải video trước.';

  @override
  String get cancelConversionTitle => 'Hủy chuyển đổi?';

  @override
  String get cancelConversionContent => 'Tiến trình chuyển đổi sẽ bị mất.';

  @override
  String get continueConversion => 'Tiếp tục';

  @override
  String get cancel => 'Hủy';

  @override
  String get discardVideoTitle => 'Bỏ video?';

  @override
  String get discardVideoContent =>
      'Video đã chuyển đổi sẽ bị xóa và không được lưu.';

  @override
  String get keep => 'Giữ lại';

  @override
  String get discard => 'Bỏ';

  @override
  String get save => 'Lưu';

  @override
  String get saveVideoDialogTitle => 'Lưu video';

  @override
  String get savedSuccess => 'Đã lưu!';

  @override
  String get open => 'Mở';

  @override
  String get openGallery => 'Mở thư viện';

  @override
  String get openVideo => 'Mở video';

  @override
  String get autoSaveTitle => 'Tự động lưu video vào thư viện';

  @override
  String get autoSaveSubtitle => 'Video được tự động lưu sau khi chuyển đổi.';

  @override
  String get videoCodecTitle => 'Bộ mã hóa video';

  @override
  String get videoCodecSubtitle =>
      'Bộ mã hóa video dùng trong chế độ thông thường';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC hay AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 có khả năng tương thích tốt nhất và thường chuyển đổi nhanh hơn.\n\nH.265/HEVC có thể tạo tệp nhỏ hơn với chất lượng hình ảnh tương đương, nhưng mất nhiều thời gian chuyển đổi hơn. Thiết bị hoặc ứng dụng cũ có thể không phát được tệp đầu ra.\n\nAV1 là bộ mã hóa hiện đại được thiết kế để tạo tệp nhỏ. Thiết bị và ứng dụng cũ thường không phát được tệp đầu ra.\n\nTất cả bộ mã hóa đều được tích hợp trong ứng dụng và không phụ thuộc vào bộ mã hóa đã cài trên thiết bị.';

  @override
  String get saveError => 'Lỗi khi lưu. Có thể không đủ dung lượng lưu trữ.';

  @override
  String get saveErrorOutOfMemory =>
      'Không đủ bộ nhớ để lưu tệp này. Hãy thử đoạn video ngắn hơn hoặc chất lượng thấp hơn.';

  @override
  String get conversionDone => 'Hoàn tất!';

  @override
  String conversionProgress(String percent) {
    return 'Đang chuyển đổi: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Chuyển đổi thất bại: $error';
  }

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get licensesTitle => 'Giấy phép';

  @override
  String get licensesSubtitle => 'Giấy phép mã nguồn mở của ứng dụng này';

  @override
  String get gplLicenseTitle => 'Nội dung giấy phép GPL-3.0';

  @override
  String get sourceCodeTitle => 'Mã nguồn (GitHub)';

  @override
  String get privacyPolicyTitle => 'Chính sách quyền riêng tư';

  @override
  String get adConsentTitle => 'Cài đặt quyền riêng tư';

  @override
  String get imprintTitle => 'Thông tin pháp lý';

  @override
  String get linkOpenError => 'Không thể mở liên kết.';

  @override
  String get muteTooltip => 'Giải thích về tắt tiếng';

  @override
  String get muteInfoContent =>
      'Xóa hoàn toàn âm thanh khỏi video đã chuyển đổi.\n\nHữu ích khi muốn loại bỏ tiếng ồn nền hoặc giảm kích thước tệp.';

  @override
  String estimatedSize(String size) {
    return 'Kích thước ước tính: $size MB';
  }

  @override
  String get convertButton => 'Chuyển đổi';

  @override
  String get crfLabel => 'Chất lượng video (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Chất lượng video';

  @override
  String get crfInfoContent =>
      '0 → không mất chất lượng (tệp rất lớn)\n18 → gần như không thấy suy giảm chất lượng\n23 → tiêu chuẩn (cân bằng tốt)\n28 → suy giảm chất lượng thấy rõ\n51 → chất lượng thấp nhất\n\nKhuyên dùng: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → không mất chất lượng (tệp rất lớn)\n25 → gần như không thấy suy giảm chất lượng\n30 → tiêu chuẩn (cân bằng tốt)\n38 → suy giảm chất lượng thấy rõ\n63 → chất lượng thấp nhất\n\nKhuyên dùng: 25–38\n\nVP9 và AV1 dùng thang 0–63: cùng một giá trị sẽ cho chất lượng khác với H.264/H.265.';

  @override
  String get resolutionLabel => 'Độ phân giải';

  @override
  String get resolutionInfoTitle => 'Các độ phân giải phổ biến';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nMẹo: Để trống một ô = ô còn lại sẽ được tính theo tỷ lệ.';

  @override
  String get widthLabel => 'Chiều rộng';

  @override
  String get heightLabel => 'Chiều cao';

  @override
  String get emptyEqualsOriginal => 'Để trống = Gốc';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Số khung hình mỗi giây';

  @override
  String get fpsInfoContent =>
      'Gốc   → Giữ nguyên FPS của video gốc\n24    → Chuẩn điện ảnh\n25    → Chuẩn PAL/TV (châu Âu)\n30    → NTSC/TV, mạng xã hội\n60    → Mượt mà, trò chơi, thể thao';

  @override
  String get audioBitrateLabel => 'Tốc độ bit âm thanh';

  @override
  String get silent => 'Không âm thanh';

  @override
  String get audioBitrateInfoContent =>
      'Không âm thanh → không có âm thanh\n64 kbps  → giọng nói, podcast\n96 kbps  → giọng nói chất lượng tốt\n128 kbps → nhạc chất lượng tiêu chuẩn\n192 kbps → âm thanh chất lượng cao\n320 kbps → chất lượng MP3 tối đa';

  @override
  String get audioCodecLabel => 'Bộ mã hóa âm thanh';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → tương thích tốt nhất và thường mã hóa nhanh hơn\nH.265 → tệp nhỏ hơn với chất lượng tương đương, mã hóa chậm hơn\nVP9 → bộ mã hóa mở hiệu quả cho WebM và MKV, mã hóa phần mềm chậm hơn\nAV1 → bộ mã hóa hiện đại cho tệp nhỏ, chỉ mã hóa bằng phần mềm\nXvid → bộ mã hóa MPEG-4 cũ cho AVI và các trình phát đời cũ\n\nCác định dạng đầu ra bên dưới được bật tùy theo bộ mã hóa video và âm thanh đã chọn.';

  @override
  String get xvidLegacyLabel => 'Xvid (Cũ)';

  @override
  String get av1SlowHint =>
      'AV1 chỉ mã hóa bằng phần mềm và chậm hơn nhiều so với H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Với độ phân giải trên 720p, hãy cân nhắc giảm độ phân giải trước.';

  @override
  String get audioCodecInfoContent =>
      'AAC → tiêu chuẩn cho MP4, tương thích tốt nhất\nMP3 → bộ mã hóa cũ được dùng rộng rãi\nOpus → hiện đại và hiệu quả, lý tưởng cho WebM và MKV\nAC3 → Dolby Digital, chỉ hiển thị khi nguồn có âm thanh vòm (≥ 3 kênh)\nVorbis → bộ mã hóa mở cho WebM và MKV\n\nCác định dạng đầu ra không tương thích sẽ tự động bị vô hiệu hóa.';

  @override
  String get outputFormatLabel => 'Định dạng đầu ra';

  @override
  String get outputFormatInfoContent =>
      'MP4 → phổ biến, tương thích tốt nhất\nMKV → định dạng chứa linh hoạt cho mọi bộ mã hóa có sẵn\nMOV → dành cho quy trình làm việc với Apple/QuickTime\nAVI → định dạng cũ dùng Xvid\nMPEG-TS → luồng truyền tải cho TV và phát trực tuyến\nWebM → định dạng web hiện đại dùng VP9 với Opus hoặc Vorbis\n\nCác định dạng không tương thích sẽ hiển thị mờ. Khi chọn một định dạng, bộ mã hóa video mặc định của định dạng đó sẽ tự động được áp dụng, cùng với bộ mã hóa âm thanh tương thích nếu cần.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec được hỗ trợ bởi: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Đã đổi định dạng đầu ra thành $format.';
  }

  @override
  String get orig => 'Gốc';

  @override
  String get resolutionExplainTitle => 'Các độ phân giải có ý nghĩa gì?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → tệp rất nhỏ,\nví dụ: dùng cho WhatsApp\n\n480p  (854×480)   → Độ nét tiêu chuẩn (SD)\n\n720p  (1280×720)  → HD, phù hợp với thiết bị di động\n\n1080p (1920×1080) → Full HD, tiêu chuẩn cho\n                          YouTube & TV\n\nCao/Trung bình/Thấp chỉ chất lượng ở cùng độ phân giải — càng cao = tệp càng lớn.';

  @override
  String get resolutionTooltip => 'Giải thích về độ phân giải';

  @override
  String get trimArea => 'Phạm vi cắt';

  @override
  String trimStartLabel(String time) {
    return 'Bắt đầu: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Kết thúc: $time';
  }

  @override
  String get adLoading => 'Đang tải quảng cáo…';

  @override
  String get convertedPrefix => 'da_chuyen_doi_';

  @override
  String get removeAdsTitle => 'Xóa quảng cáo';

  @override
  String removeAdsSubtitle(String price) {
    return 'Mua một lần – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Không quảng cáo ✓';

  @override
  String get removeAdsActiveSubtitle => 'Cảm ơn bạn đã ủng hộ!';

  @override
  String get restorePurchasesTitle => 'Khôi phục giao dịch mua';

  @override
  String get purchaseButton => 'Mua';

  @override
  String get purchaseError => 'Mua không thành công. Vui lòng thử lại.';

  @override
  String get purchaseSuccess => 'Cảm ơn bạn! Quảng cáo đã được tắt.';

  @override
  String get appName => 'Chuyển đổi video';

  @override
  String get audioOnly => 'Chỉ âm thanh';

  @override
  String get audioOnlyTooltip => 'Giải thích về chỉ âm thanh';

  @override
  String get audioOnlyInfoContent =>
      'Chỉ trích xuất luồng âm thanh từ video — không có hình ảnh.\n\nChế độ thông thường: MP3 ở 192 kbps.\nChế độ chuyên gia: Bộ mã hóa và tốc độ bit theo cài đặt âm thanh.\n\nHữu ích khi muốn lưu nhạc hoặc podcast từ video.';

  @override
  String get aspectLocked => 'Đã khóa tỷ lệ khung hình';

  @override
  String get aspectUnlocked => 'Đã mở khóa tỷ lệ khung hình';

  @override
  String get cpuWarningTitle => 'Tệp lớn';

  @override
  String get cpuWarningContent =>
      'Video này dài hơn 5 phút. Trên thiết bị cũ, quá trình chuyển đổi có thể khiến CPU hoạt động ở mức cao — điều này là bình thường.\n\nBạn có thể để điện thoại sang một bên; ứng dụng sẽ tiếp tục chạy nền.';

  @override
  String get cpuWarningCheckbox => 'Không hiện lại';

  @override
  String get storageWarningTitle => 'Không đủ dung lượng lưu trữ';

  @override
  String storageWarningContent(String available, String required) {
    return 'Thiết bị chỉ còn $available MB trống. Quá trình chuyển đổi cần khoảng $required MB. Vui lòng giải phóng dung lượng trước.';
  }

  @override
  String get feedbackTitle => 'Phản hồi & hỗ trợ';

  @override
  String get feedbackSubtitle => 'Gửi báo lỗi, đề xuất hoặc phản hồi';

  @override
  String get feedbackCategoryLabel => 'Danh mục';

  @override
  String get feedbackCategoryBug => 'Báo lỗi';

  @override
  String get feedbackCategoryFeature => 'Đề xuất tính năng';

  @override
  String get feedbackCategoryFeedback => 'Phản hồi chung';

  @override
  String get feedbackMessageHint => 'Mô tả vấn đề của bạn…';

  @override
  String get feedbackSendButton => 'Gửi';

  @override
  String get notificationPermissionTitle => 'Chuyển đổi trong nền';

  @override
  String get notificationPermissionContent =>
      'Cho phép thông báo để quá trình chuyển đổi tiếp tục khi bạn dùng ứng dụng khác. Nếu không, bạn phải giữ ứng dụng này mở.';

  @override
  String get notificationPermissionNotNow => 'Để sau';

  @override
  String get notificationPermissionAllow => 'Cho phép';

  @override
  String get notificationPermissionDenied =>
      'Bật thông báo trong Cài đặt để chuyển đổi trong nền.';

  @override
  String get notificationPermissionOpenSettings => 'Cài đặt';

  @override
  String get backButton => 'Quay lại';

  @override
  String get appSettingsTitle => 'Cài đặt ứng dụng';

  @override
  String get appSettingsSubtitle => 'Cài đặt tự động lưu & quyền riêng tư';

  @override
  String get openSourceTitle => 'Mã nguồn mở';

  @override
  String get openSourceSubtitle => 'Giấy phép & mã nguồn';

  @override
  String get openSourceLicensesTitle => 'Giấy phép mã nguồn mở';

  @override
  String get legalSectionTitle => 'Pháp lý';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Chế độ mã hóa';

  @override
  String get encodingModeCrf => 'Chất lượng (CRF)';

  @override
  String get encodingModeBitrate => 'Tốc độ bit';

  @override
  String get audioChannelsLabel => 'Kênh âm thanh';

  @override
  String get audioChannelsInfoContent =>
      'Gốc → giữ nguyên bố trí kênh của nguồn\nStereo → 2.0 (trộn giảm kênh nếu cần)\nMono → 1 kênh (tệp nhỏ nhất)\n5.1 → âm thanh vòm 6 kênh (chỉ dành cho nguồn âm thanh vòm)\n\nHỗ trợ trộn giảm kênh (ví dụ: 5.1 → Stereo). Không hỗ trợ trộn tăng kênh.';

  @override
  String get audioChannelOriginal => 'Gốc';

  @override
  String get targetBitrateLabel => 'Tốc độ bit mục tiêu';

  @override
  String get targetBitrateInfoTitle => 'Tốc độ bit mục tiêu';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → nén mạnh, dùng cho ứng dụng nhắn tin\n4–8 Mbps → chất lượng tiêu chuẩn/tốt ở 1080p\n12 Mbps → chất lượng cao ở 1080p / thấp ở 4K\n20 Mbps → chất lượng phát trực tuyến 4K\n\nGiá trị tùy chỉnh: dùng biểu tượng bút chì (500–100000 kbps)\n\nKhác với CRF, chất lượng có thể thay đổi theo từng cảnh. Dùng CRF để có kết quả tốt hơn với cùng kích thước tệp.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 và AV1 đạt chất lượng tương đương với tốc độ bit chỉ bằng khoảng một nửa các mức này.';

  @override
  String get rateAppTitle => 'Đánh giá ứng dụng';

  @override
  String get proHintTitle => 'Sử dụng không quảng cáo';

  @override
  String get proHintBody =>
      'Chỉ cần mua một lần để xóa quảng cáo vĩnh viễn khỏi ứng dụng.';

  @override
  String get proHintLater => 'Để sau';

  @override
  String get restoreError =>
      'Không thể khôi phục giao dịch mua. Cửa hàng Play hiện không khả dụng — vui lòng thử lại.';

  @override
  String get restoreNoPurchases => 'Không tìm thấy giao dịch mua trước đây.';

  @override
  String get hdrCodecSwitched =>
      'Đã phát hiện video HDR — dùng H.265 cho video này để giữ nguyên màu sắc.';

  @override
  String get themeTitle => 'Giao diện';

  @override
  String get themeSubtitle => 'Theo hệ thống hoặc chọn giao diện sáng hay tối';

  @override
  String get themeSystem => 'Hệ thống';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get targetBitrateEditTooltip => 'Nhập tốc độ bit';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Phạm vi cho phép: $range';
  }

  @override
  String get hwEncoderTitle => 'Bộ mã hóa phần cứng (nhanh)';

  @override
  String get hwEncoderSubtitle =>
      'Nhanh hơn nhiều, nhưng cần tốc độ bit cao gấp khoảng hai lần để đạt cùng chất lượng. Chỉ dùng được ở chế độ tốc độ bit.';

  @override
  String get hwEncoderHdrHint =>
      'Video HDR — sẽ dùng bộ mã hóa phần mềm để giữ nguyên HDR.';

  @override
  String get hwEncoderFallback =>
      'Bộ mã hóa phần cứng gặp lỗi — đang chuyển đổi bằng bộ mã hóa phần mềm.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Bộ mã hóa phần cứng không hỗ trợ $format — định dạng này sẽ được chuyển đổi bằng bộ mã hóa phần mềm.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Đã tắt bộ mã hóa phần cứng — chỉ hỗ trợ chế độ tốc độ bit.';

  @override
  String get resolutionPresetLabel => 'Mức có sẵn';

  @override
  String get resolutionOriginal => 'Gốc';

  @override
  String get resolutionCustom => 'Tùy chỉnh';

  @override
  String get aspectRatioLabel => 'Tỷ lệ khung hình';

  @override
  String get aspectOriginal => 'Gốc';

  @override
  String get aspectCustom => 'Tùy chỉnh';

  @override
  String get fitModeLabel => 'Cách khớp khung';

  @override
  String get fitPad => 'Thêm viền';

  @override
  String get fitCrop => 'Cắt xén';

  @override
  String get fitStretch => 'Kéo giãn';

  @override
  String get fitModeInfoContent =>
      'Tỷ lệ khung hình đầu ra khác với video.\n\nThêm viền → giữ toàn bộ hình ảnh, thêm viền đen vào phần còn lại\nCắt xén → giữ phần giữa, cắt bỏ các cạnh\nKéo giãn → kéo biến dạng hình ảnh để lấp đầy khung';

  @override
  String get deleteOriginal => 'Xóa bản gốc';

  @override
  String get originalTrashed =>
      'Đã chuyển bản gốc vào thùng rác — bạn có thể khôi phục từ đó.';

  @override
  String get originalTrashFailed => 'Không thể xóa bản gốc.';

  @override
  String get burnInSubtitlesLabel => 'Thêm phụ đề';

  @override
  String get burnInSubtitlesInfoContent =>
      'Cố định: Phụ đề được gắn vào hình ảnh video. Phụ đề luôn hiển thị trên mọi trình phát và không thể tắt về sau. Với video giữ nguyên HDR, phụ đề có thể trông rất sáng.\n\nCó thể bật/tắt: Phụ đề được thêm dưới dạng luồng riêng, có thể bật hoặc tắt trong trình phát. Không phải trình phát nào cũng hiển thị được, và phụ đề thường bị mất khi chia sẻ video. Không hỗ trợ AVI và MPEG-TS.\n\nHỗ trợ tệp SRT và ASS. Kiểu hiển thị và vị trí của ASS được giữ nguyên hoàn toàn khi dùng chế độ Cố định và trong tệp MKV. Các định dạng khác chỉ giữ được một phần kiểu hiển thị và không giữ vị trí.';

  @override
  String get subtitleModeBurnIn => 'Cố định';

  @override
  String get subtitleModeTrack => 'Có thể bật/tắt';

  @override
  String get subtitleTrackEmpty => 'Không có phụ đề trong đoạn video đã chọn.';

  @override
  String get sharedVideoBusy =>
      'Hãy hoàn tất quá trình chuyển đổi hiện tại trước, rồi chia sẻ lại video.';

  @override
  String get burnInSubtitlesSelect => 'Chọn tệp SRT hoặc ASS';

  @override
  String get burnInSubtitlesRemove => 'Xóa tệp phụ đề';

  @override
  String get burnInSubtitlesUnsupported => 'Vui lòng chọn tệp .srt hoặc .ass.';

  @override
  String get burnInSubtitlesInvalid =>
      'Không thể đọc tệp phụ đề này hoặc tệp không chứa phụ đề hợp lệ.';

  @override
  String get burnInSubtitlesMissing =>
      'Tệp phụ đề không còn khả dụng. Vui lòng chọn lại.';

  @override
  String get subtitleTextSizeLabel => 'Cỡ chữ';

  @override
  String get subtitleTextSizeSmall => 'Nhỏ';

  @override
  String get subtitleTextSizeMedium => 'Trung bình';

  @override
  String get subtitleTextSizeLarge => 'Lớn';

  @override
  String get subtitlePositionLabel => 'Vị trí';

  @override
  String get subtitlePositionBottom => 'Dưới';

  @override
  String get subtitlePositionTop => 'Trên';

  @override
  String get subtitleBackgroundTitle => 'Nền xám';
}
