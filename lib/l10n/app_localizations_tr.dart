// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get qualityLabel => 'Kalite';

  @override
  String get quality1080pHigh => '1080p Yüksek';

  @override
  String get quality1080pMedium => '1080p Orta';

  @override
  String get quality1080pLow => '1080p Düşük';

  @override
  String get quality1080pVeryLow => '1080p Çok Düşük';

  @override
  String get quality720pHigh => '720p Yüksek';

  @override
  String get quality720pMedium => '720p Orta';

  @override
  String get quality720pLow => '720p Düşük';

  @override
  String get quality720pVeryLow => '720p Çok Düşük';

  @override
  String get quality480pHigh => '480p Yüksek';

  @override
  String get quality480pMedium => '480p Orta';

  @override
  String get quality480pLow => '480p Düşük';

  @override
  String get quality480pVeryLow => '480p Çok Düşük';

  @override
  String get quality360pHigh => ' 360p Yüksek';

  @override
  String get quality360pMedium => '360p Orta';

  @override
  String get quality360pLow => '360p Düşük';

  @override
  String get quality360pVeryLow => '360p Çok Düşük';

  @override
  String get mute => 'Sesi Kapat';

  @override
  String get ok => 'Tamam';

  @override
  String get selectVideo => 'Video seç';

  @override
  String get videoLoading => 'Video yükleniyor…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Uzman';

  @override
  String get invalidVideoFile => 'Lütfen geçerli bir video dosyası seçin.';

  @override
  String get fileLoadError =>
      'Dosya yüklenemedi. Lütfen bir video dosyası seçin.';

  @override
  String get previewNotAvailable =>
      'Önizleme mevcut değil. Video yine de dönüştürülebilir.';

  @override
  String get previewNotAvailableLabel =>
      'Önizleme mevcut değil\n(Bu cihaz için çözünürlük çok yüksek)';

  @override
  String get noVideoLoaded => 'Lütfen önce bir video yükleyin.';

  @override
  String get cancelConversionTitle =>
      'Dönüştürmeyi iptal etmek istiyor musunuz?';

  @override
  String get cancelConversionContent =>
      'Şu ana kadar yapılan işlemler kaybolacaktır.';

  @override
  String get continueConversion => 'Devam et';

  @override
  String get cancel => 'İptal';

  @override
  String get discardVideoTitle => 'Videoyu silmek istiyor musunuz?';

  @override
  String get discardVideoContent =>
      'Dönüştürülen video silinecek ve kaydedilmeyecektir.';

  @override
  String get keep => 'Sakla';

  @override
  String get discard => 'Sil';

  @override
  String get save => 'Kaydet';

  @override
  String get saveVideoDialogTitle => 'Videoyu kaydet';

  @override
  String get savedSuccess => 'Kaydedildi!';

  @override
  String get open => 'Aç';

  @override
  String get saveError =>
      'Kaydetme hatası. Yeterli depolama alanı olmayabilir.';

  @override
  String get conversionDone => 'Tamam!';

  @override
  String conversionProgress(String percent) {
    return 'Dönüştürme: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Dönüştürme başarısız: $error';
  }

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get licensesTitle => 'Lisanslar';

  @override
  String get licensesSubtitle => 'Bu uygulamanın açık kaynak lisansları';

  @override
  String get gplLicenseTitle => 'GPL-3.0 Lisans Metni';

  @override
  String get sourceCodeTitle => 'Kaynak Kodu (GitHub)';

  @override
  String get privacyPolicyTitle => 'Gizlilik Politikası';

  @override
  String get imprintTitle => 'Yasal Uyarı';

  @override
  String get linkOpenError => 'Bağlantı açılamadı.';

  @override
  String get muteTooltip => 'Sessize alma hakkında';

  @override
  String get muteInfoContent =>
      'Dönüştürülen videodan sesi tamamen kaldırır.\n\nÖrneğin arka plan seslerini kaldırmak veya dosya boyutunu küçültmek için kullanışlıdır.';

  @override
  String estimatedSize(String size) {
    return 'Tahmini boyut: $size MB';
  }

  @override
  String get convertButton => 'Dönüştür';

  @override
  String get crfLabel => 'Video kalitesi (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Video kalitesi';

  @override
  String get crfInfoContent =>
      '0 → kayıpsız (çok büyük dosya)\n18 → görsel olarak neredeyse kayıpsız\n23 → Standart (iyi denge)\n28 → gözle görülür kalite kaybı\n51 → en düşük kalite\n\nÖneri: 18–28';

  @override
  String get resolutionLabel => 'Çözünürlük';

  @override
  String get resolutionInfoTitle => 'Yaygın çözünürlükler';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nİpucu: Bir alanı boş bırakın = diğeri orantılı olarak hesaplanır.';

  @override
  String get widthLabel => 'Genişlik';

  @override
  String get heightLabel => 'Yükseklik';

  @override
  String get emptyEqualsOriginal => 'Boş = Orijinal';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Saniye Başına Kare Sayısı';

  @override
  String get fpsInfoContent =>
      'Orig → Kaynak videonun FPS\'sini koru\n24 → Sinema standardı\n25 → PAL/TV standardı (Avrupa)\n30 → NTSC/TV, Sosyal Medya\n60 → Akıcı, Oyun, Spor';

  @override
  String get audioBitrateLabel => 'Ses Bit Hızı';

  @override
  String get silent => 'Sessiz';

  @override
  String get audioBitrateInfoContent =>
      'Sessiz → ses yok\n64 kbps → konuşma, podcast\'ler\n96 kbps → iyi konuşma kalitesi\n128 kbps → standart müzik\n192 kbps → yüksek ses kalitesi\n320 kbps → maksimum MP3 kalitesi';

  @override
  String get audioCodecLabel => 'Ses Kodek';

  @override
  String get audioCodecInfoContent =>
      'AAC → MP4 için standart, en iyi uyumluluk\nMP3 → yaygın olarak kullanılır, biraz eski\nOpus → modern ve verimli, MKV için iyi';

  @override
  String get outputFormatLabel => 'Çıkış Formatı';

  @override
  String get outputFormatInfoContent =>
      'MP4 → evrensel, en iyi uyumluluk\nMKV → esnek, çok sayıda kodek, daha az uyumlu\nMOV → Apple/QuickTime formatı\nAVI → modası geçmiş, geniş uyumluluk\nTS → MPEG Aktarım Akışı, TV/Akış';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Çözünürlükler ne anlama geliyor?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → çok küçük dosya,\n örneğin WhatsApp için\n\n480p (854×480) → Standart Çözünürlük (SD)\n\n720p (1280×720) → HD, mobil cihazlar için uygun\n\n1080p (1920×1080) → Full HD, YouTube ve TV için standart\n\nYüksek/Orta/Düşük, aynı çözünürlükte kaliteyi tanımlar — daha yüksek = daha büyük dosya.';

  @override
  String get resolutionTooltip => 'Çözünürlükler hakkında açıklama';

  @override
  String get trimArea => 'Kırpma alanı';

  @override
  String trimStartLabel(String time) {
    return 'Başlangıç: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Bitiş: $time';
  }

  @override
  String get adLoading => 'Reklam yükleniyor…';

  @override
  String get convertedPrefix => 'dönüştürülmüş_';

  @override
  String get removeAdsTitle => 'Reklamları kaldır';

  @override
  String removeAdsSubtitle(String price) {
    return 'Tek seferlik satın alma – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Reklamsız ✓';

  @override
  String get removeAdsActiveSubtitle => 'Desteğin için teşekkürler!';

  @override
  String get restorePurchasesTitle => 'Satın almayı geri yükle';

  @override
  String get purchaseButton => 'Satın al';

  @override
  String get purchaseError =>
      'Satın alma işlemi başarısız. Lütfen tekrar deneyin.';

  @override
  String get purchaseSuccess => 'Teşekkürler! Reklamlar devre dışı bırakıldı.';

  @override
  String get appName => 'Video Dönüştürücü FFmpeg';

  @override
  String get audioOnly => 'Sadece Ses';

  @override
  String get audioOnlyTooltip => 'Sadece Ses Açıklaması';

  @override
  String get audioOnlyInfoContent =>
      'Videodan sadece ses parçasını çıkarır – görüntü yok.\n\nNormal Mod: 192 kbps MP3.\nUzman Mod: Ses ayarlarından kodek ve bit hızı.\n\nÖrneğin videolardan müzik veya podcast\'leri kaydetmek için kullanışlıdır.';

  @override
  String get aspectLocked => 'En boy oranı kilitli';

  @override
  String get aspectUnlocked => 'En boy oranı serbest';

  @override
  String get cpuWarningTitle => 'Büyük dosya';

  @override
  String get cpuWarningContent =>
      'Bu dosya 200 MB\'den büyük. Eski cihazlarda dönüştürme işlemi işlemci yükünü artırabilir – bu normaldir.\n\nTelefonu bir kenara bırakabilirsin, uygulama arka planda çalışmaya devam eder.';

  @override
  String get cpuWarningCheckbox => 'Bir daha gösterme';

  @override
  String get storageWarningTitle => 'Yeterli depolama alanı yok';

  @override
  String storageWarningContent(String available, String required) {
    return 'Cihazında sadece $available MB boş alan kaldı. Dönüştürme işlemi için yaklaşık $required MB gereklidir. Lütfen önce depolama alanını boşalt.';
  }

  @override
  String get feedbackTitle => 'Geri Bildirim & Destek';

  @override
  String get feedbackSubtitle =>
      'Hatalar, iyileştirmeler veya geri bildirim gönder';

  @override
  String get feedbackCategoryLabel => 'Kategori';

  @override
  String get feedbackCategoryBug => 'Hata bildir';

  @override
  String get feedbackCategoryFeature => 'İyileştirme önerisi';

  @override
  String get feedbackCategoryFeedback => 'Genel geri bildirim';

  @override
  String get feedbackMessageHint => 'Sorununuzu açıklayın…';

  @override
  String get feedbackSendButton => 'Gönder';
}
