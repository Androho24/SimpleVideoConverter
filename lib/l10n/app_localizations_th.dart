// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get qualityLabel => 'คุณภาพ';

  @override
  String get quality1080pHigh => '1080p สูง';

  @override
  String get quality1080pMedium => '1080p ปานกลาง';

  @override
  String get quality1080pLow => '1080p ต่ำ';

  @override
  String get quality1080pVeryLow => '1080p ต่ำมาก';

  @override
  String get quality720pHigh => '720p สูง';

  @override
  String get quality720pMedium => '720p ปานกลาง';

  @override
  String get quality720pLow => '720p ต่ำ';

  @override
  String get quality720pVeryLow => '720p ต่ำมาก';

  @override
  String get quality480pHigh => '480p สูง';

  @override
  String get quality480pMedium => '480p ปานกลาง';

  @override
  String get quality480pLow => '480p ต่ำ';

  @override
  String get quality480pVeryLow => '480p ต่ำมาก';

  @override
  String get quality360pHigh => '360p สูง';

  @override
  String get quality360pMedium => '360p ปานกลาง';

  @override
  String get quality360pLow => '360p ต่ำ';

  @override
  String get quality360pVeryLow => '360p ต่ำมาก';

  @override
  String get mute => 'ปิดเสียง';

  @override
  String get ok => 'ตกลง';

  @override
  String get selectVideo => 'เลือกวิดีโอ';

  @override
  String get videoLoading => 'กำลังโหลดวิดีโอ…';

  @override
  String get modeNormal => 'ปกติ';

  @override
  String get modeExpert => 'ขั้นสูง';

  @override
  String get invalidVideoFile => 'กรุณาเลือกไฟล์วิดีโอที่ถูกต้อง';

  @override
  String get fileLoadError => 'ไม่สามารถโหลดไฟล์ได้ กรุณาเลือกไฟล์วิดีโอ';

  @override
  String get previewNotAvailable =>
      'ไม่สามารถแสดงตัวอย่างได้ แต่วิดีโอยังสามารถแปลงได้';

  @override
  String get previewNotAvailableLabel =>
      'ไม่สามารถแสดงตัวอย่างได้\n(ความละเอียดสูงเกินไปสำหรับอุปกรณ์นี้)';

  @override
  String get noVideoLoaded => 'กรุณาโหลดวิดีโอก่อน';

  @override
  String get cancelConversionTitle => 'ยกเลิกการแปลง?';

  @override
  String get cancelConversionContent => 'ความคืบหน้าในการแปลงจะหายไป';

  @override
  String get continueConversion => 'ดำเนินการต่อ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get discardVideoTitle => 'ทิ้งวิดีโอ?';

  @override
  String get discardVideoContent => 'วิดีโอที่แปลงแล้วจะถูกลบและจะไม่ถูกบันทึก';

  @override
  String get keep => 'เก็บไว้';

  @override
  String get discard => 'ทิ้ง';

  @override
  String get save => 'บันทึก';

  @override
  String get saveVideoDialogTitle => 'บันทึกวิดีโอ';

  @override
  String get savedSuccess => 'บันทึกแล้ว!';

  @override
  String get open => 'เปิด';

  @override
  String get saveError =>
      'เกิดข้อผิดพลาดในการบันทึก อาจมีพื้นที่จัดเก็บไม่เพียงพอ';

  @override
  String get conversionDone => 'เสร็จสิ้น!';

  @override
  String conversionProgress(String percent) {
    return 'กำลังแปลง: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'การแปลงล้มเหลว: $error';
  }

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get licensesTitle => 'ใบอนุญาต';

  @override
  String get licensesSubtitle => 'ใบอนุญาตโอเพนซอร์สของแอปนี้';

  @override
  String get gplLicenseTitle => 'ข้อความใบอนุญาต GPL-3.0';

  @override
  String get sourceCodeTitle => 'ซอร์สโค้ด (GitHub)';

  @override
  String get privacyPolicyTitle => 'นโยบายความเป็นส่วนตัว';

  @override
  String get adConsentTitle => 'การตั้งค่าความเป็นส่วนตัว';

  @override
  String get imprintTitle => 'ข้อมูลผู้ให้บริการ';

  @override
  String get linkOpenError => 'ไม่สามารถเปิดลิงก์ได้';

  @override
  String get muteTooltip => 'คำอธิบายการปิดเสียง';

  @override
  String get muteInfoContent =>
      'ลบเสียงออกจากวิดีโอที่แปลงแล้วทั้งหมด\n\nมีประโยชน์ เช่น ใช้ลบเสียงรบกวนพื้นหลังหรือลดขนาดไฟล์';

  @override
  String estimatedSize(String size) {
    return 'ขนาดโดยประมาณ: $size MB';
  }

  @override
  String get convertButton => 'แปลง';

  @override
  String get crfLabel => 'คุณภาพวิดีโอ (CRF)';

  @override
  String get crfInfoTitle => 'CRF — คุณภาพวิดีโอ';

  @override
  String get crfInfoContent =>
      '0 → ไม่สูญเสียข้อมูล (ไฟล์ใหญ่มาก)\n18 → แทบไม่สูญเสียคุณภาพ\n23 → มาตรฐาน (สมดุลดี)\n28 → คุณภาพลดลงอย่างเห็นได้ชัด\n51 → คุณภาพต่ำสุด\n\nแนะนำ: 18–28';

  @override
  String get resolutionLabel => 'ความละเอียด';

  @override
  String get resolutionInfoTitle => 'ความละเอียดทั่วไป';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n854 × 480 — 480p\n640 × 360 — 360p\n426 × 240 — 240p\n\nคำแนะนำ: เว้นช่องหนึ่งไว้ = อีกช่องจะถูกคำนวณตามสัดส่วน';

  @override
  String get widthLabel => 'ความกว้าง';

  @override
  String get heightLabel => 'ความสูง';

  @override
  String get emptyEqualsOriginal => 'ว่าง = ต้นฉบับ';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'เฟรมต่อวินาที';

  @override
  String get fpsInfoContent =>
      'ต้นฉบับ → ใช้ค่า FPS เดิมของวิดีโอต้นฉบับ\n24 → มาตรฐานภาพยนตร์\n25 → มาตรฐาน PAL/ทีวี (ยุโรป)\n30 → NTSC/ทีวี, โซเชียลมีเดีย\n60 → ลื่นไหล, เกม, กีฬา';

  @override
  String get audioBitrateLabel => 'บิตเรตเสียง';

  @override
  String get silent => 'ไม่มีเสียง';

  @override
  String get audioBitrateInfoContent =>
      'ไม่มีเสียง → ไม่มีเสียงประกอบ\n64 kbps → เสียงพูด, พอดแคสต์\n96 kbps → คุณภาพเสียงพูดดี\n128 kbps → มาตรฐานสำหรับเพลง\n192 kbps → คุณภาพเสียงสูง\n320 kbps → คุณภาพ MP3 สูงสุด';

  @override
  String get audioCodecLabel => 'โคเดกเสียง';

  @override
  String get audioCodecInfoContent =>
      'AAC → มาตรฐานสำหรับ MP4, รองรับได้ดีที่สุด\nMP3 → ใช้กันอย่างแพร่หลาย, ค่อนข้างเก่า\nOpus → ทันสมัยและมีประสิทธิภาพ, เหมาะสำหรับ MKV';

  @override
  String get outputFormatLabel => 'รูปแบบเอาต์พุต';

  @override
  String get outputFormatInfoContent =>
      'MP4 → ใช้งานได้ทั่วไป, รองรับได้ดีที่สุด\nMKV → ยืดหยุ่น, รองรับโคเดกหลากหลาย, แต่เข้ากันได้น้อยกว่า\nMOV → รูปแบบของ Apple/QuickTime\nAVI → รูปแบบเก่า, รองรับได้กว้าง\nTS → MPEG transport stream, ใช้กับทีวี/สตรีมมิง';

  @override
  String get orig => 'ต้นฉบับ';

  @override
  String get resolutionExplainTitle => 'ความละเอียดหมายถึงอะไร?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → ไฟล์ขนาดเล็กมาก,\nเช่น สำหรับ WhatsApp\n\n480p (854×480) → ความละเอียดมาตรฐาน (SD)\n\n720p (1280×720) → HD, เหมาะสำหรับอุปกรณ์พกพา\n\n1080p (1920×1080) → Full HD, เป็นมาตรฐานสำหรับ\nYouTube และทีวี\n\nHigh/Medium/Low หมายถึงระดับคุณภาพที่ความละเอียดเดียวกัน — ยิ่งสูง ไฟล์ก็ยิ่งใหญ่';

  @override
  String get resolutionTooltip => 'คำอธิบายความละเอียด';

  @override
  String get trimArea => 'ช่วงการตัด';

  @override
  String trimStartLabel(String time) {
    return 'เริ่มต้น: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'สิ้นสุด: $time';
  }

  @override
  String get adLoading => 'กำลังโหลดโฆษณา…';

  @override
  String get convertedPrefix => 'converted_';

  @override
  String get removeAdsTitle => 'ลบโฆษณา';

  @override
  String removeAdsSubtitle(String price) {
    return 'ซื้อครั้งเดียว – $price';
  }

  @override
  String get removeAdsActiveTitle => 'ไม่มีโฆษณา ✓';

  @override
  String get removeAdsActiveSubtitle => 'ขอบคุณสำหรับการสนับสนุนของคุณ!';

  @override
  String get restorePurchasesTitle => 'กู้คืนการซื้อ';

  @override
  String get purchaseButton => 'ซื้อ';

  @override
  String get purchaseError => 'การซื้อไม่สำเร็จ กรุณาลองอีกครั้ง';

  @override
  String get purchaseSuccess => 'ขอบคุณ! ปิดโฆษณาแล้ว';

  @override
  String get appName => 'ตัวแปลงวิดีโอ';

  @override
  String get audioOnly => 'เสียงเท่านั้น';

  @override
  String get audioOnlyTooltip => 'คำอธิบายโหมดเสียงเท่านั้น';

  @override
  String get audioOnlyInfoContent =>
      'แยกเฉพาะแทร็กเสียงออกจากวิดีโอ — ไม่มีภาพ\n\nโหมดปกติ: MP3 ที่ 192 kbps\nโหมดขั้นสูง: ใช้โคเดกและบิตเรตจากการตั้งค่าเสียง\n\nมีประโยชน์ เช่น บันทึกเพลงหรือพอดแคสต์จากวิดีโอ';

  @override
  String get aspectLocked => 'ล็อกอัตราส่วนภาพ';

  @override
  String get aspectUnlocked => 'ปลดล็อกอัตราส่วนภาพ';

  @override
  String get cpuWarningTitle => 'ไฟล์ขนาดใหญ่';

  @override
  String get cpuWarningContent =>
      'วิดีโอนี้มีความยาวมากกว่า 5 นาที บนอุปกรณ์รุ่นเก่า การแปลงอาจใช้ CPU สูง — เป็นเรื่องปกติ\n\nคุณสามารถวางโทรศัพท์ทิ้งไว้ได้ แอปจะทำงานต่อในพื้นหลัง';

  @override
  String get cpuWarningCheckbox => 'อย่าแสดงอีก';

  @override
  String get storageWarningTitle => 'พื้นที่เก็บข้อมูลไม่เพียงพอ';

  @override
  String storageWarningContent(String available, String required) {
    return 'อุปกรณ์ของคุณมีพื้นที่ว่างเพียง $available MB การแปลงต้องใช้พื้นที่ประมาณ $required MB โปรด';
  }

  @override
  String get feedbackTitle => 'ข้อเสนอแนะและการสนับสนุน';

  @override
  String get feedbackSubtitle => 'ส่งบั๊ก ข้อเสนอแนะ หรือความคิดเห็น';

  @override
  String get feedbackCategoryLabel => 'หมวดหมู่';

  @override
  String get feedbackCategoryBug => 'รายงานบั๊ก';

  @override
  String get feedbackCategoryFeature => 'คำขอเพิ่มฟีเจอร์';

  @override
  String get feedbackCategoryFeedback => 'ข้อเสนอแนะทั่วไป';

  @override
  String get feedbackMessageHint => 'อธิบายปัญหาของคุณ…';

  @override
  String get feedbackSendButton => 'ส่ง';

  @override
  String get notificationPermissionTitle => 'การแปลงพื้นหลัง';

  @override
  String get notificationPermissionContent =>
      'อนุญาตการแจ้งเตือนเพื่อให้การแปลงสามารถดำเนินต่อไปได้ในขณะที่คุณใช้แอปอื่น ๆ หากไม่มีการอนุญาตนี้ แอปจะต้องเปิดอยู่ตลอดเวลา';

  @override
  String get notificationPermissionNotNow => 'ไม่ตอนนี้';

  @override
  String get notificationPermissionAllow => 'อนุญาต';

  @override
  String get notificationPermissionDenied =>
      'เปิดการแจ้งเตือนในการตั้งค่าการแปลงพื้นหลัง';

  @override
  String get notificationPermissionOpenSettings => 'การตั้งค่า';
}
