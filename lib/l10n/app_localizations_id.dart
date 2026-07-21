// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get qualityLabel => 'Kualitas';

  @override
  String get quality2160pHigh => '2160p Tinggi';

  @override
  String get quality2160pMedium => '2160p Sedang';

  @override
  String get quality2160pLow => '2160p Rendah';

  @override
  String get quality2160pVeryLow => '2160p Sangat Rendah';

  @override
  String get quality1440pHigh => '1440p Tinggi';

  @override
  String get quality1440pMedium => '1440p Sedang';

  @override
  String get quality1440pLow => '1440p Rendah';

  @override
  String get quality1440pVeryLow => '1440p Sangat Rendah';

  @override
  String get quality1080pHigh => '1080p Tinggi';

  @override
  String get quality1080pMedium => '1080p Sedang';

  @override
  String get quality1080pLow => '1080p Rendah';

  @override
  String get quality1080pVeryLow => '1080p Sangat Rendah';

  @override
  String get quality720pHigh => '720p Tinggi';

  @override
  String get quality720pMedium => '720p Sedang';

  @override
  String get quality720pLow => '720p Rendah';

  @override
  String get quality720pVeryLow => '720p Sangat Rendah';

  @override
  String get quality480pHigh => '480p Tinggi';

  @override
  String get quality480pMedium => '480p Sedang';

  @override
  String get quality480pLow => '480p Rendah';

  @override
  String get quality480pVeryLow => '480p Sangat Rendah';

  @override
  String get quality360pHigh => ' 360p Tinggi';

  @override
  String get quality360pMedium => '360p Sedang';

  @override
  String get quality360pLow => '360p Rendah';

  @override
  String get quality360pVeryLow => '360p Sangat Rendah';

  @override
  String get mute => 'Nonaktifkan Suara';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Pilih Video';

  @override
  String get videoLoading => 'Video sedang dimuat…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Ahli';

  @override
  String get invalidVideoFile => 'Silakan pilih file video yang valid.';

  @override
  String get fileLoadError =>
      'File tidak dapat dimuat. Silakan pilih file video.';

  @override
  String get previewNotAvailable =>
      'Pratinjau tidak tersedia. Video tetap dapat dikonversi.';

  @override
  String get previewNotAvailableLabel =>
      'Pratinjau tidak tersedia\n(Resolusi terlalu tinggi untuk perangkat ini)';

  @override
  String get noVideoLoaded => 'Silakan muat video terlebih dahulu.';

  @override
  String get cancelConversionTitle => 'Batalkan konversi?';

  @override
  String get cancelConversionContent =>
      'Proses yang telah dilakukan akan hilang.';

  @override
  String get continueConversion => 'Lanjutkan';

  @override
  String get cancel => 'Batal';

  @override
  String get discardVideoTitle => 'Hapus video?';

  @override
  String get discardVideoContent =>
      'Video yang telah dikonversi akan dihapus dan tidak disimpan.';

  @override
  String get keep => 'Simpan';

  @override
  String get discard => 'Buang';

  @override
  String get save => 'Simpan';

  @override
  String get saveVideoDialogTitle => 'Simpan Video';

  @override
  String get savedSuccess => 'Tersimpan!';

  @override
  String get open => 'Buka';

  @override
  String get openGallery => 'Buka galeri';

  @override
  String get openVideo => 'Buka video';

  @override
  String get autoSaveTitle => 'Simpan video secara otomatis ke galeri';

  @override
  String get autoSaveSubtitle =>
      'Video disimpan secara otomatis setelah dikonversi.';

  @override
  String get videoCodecTitle => 'Codec video';

  @override
  String get videoCodecSubtitle =>
      'Codec video untuk konversi dalam mode normal';

  @override
  String get videoCodecInfoTitle => 'H.264 atau H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 menawarkan kompatibilitas terbaik dan biasanya dikonversi lebih cepat.\n\nH.265/HEVC dapat menghasilkan file yang lebih kecil dengan kualitas gambar yang sebanding, tetapi konversinya lebih lama. Perangkat atau aplikasi lama mungkin tidak dapat memutar hasilnya.\n\nKedua encoder sudah disertakan dalam aplikasi dan tidak bergantung pada codec yang terpasang di perangkat.';

  @override
  String get saveError =>
      'Kesalahan saat menyimpan. Mungkin ruang penyimpanan tidak cukup.';

  @override
  String get saveErrorOutOfMemory =>
      'Memori tidak cukup untuk menyimpan file ini. Coba gunakan klip yang lebih pendek atau kurangi kualitasnya.';

  @override
  String get conversionDone => 'Selesai!';

  @override
  String conversionProgress(String percent) {
    return 'Konversi: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konversi gagal: $error';
  }

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get licensesTitle => 'Lisensi';

  @override
  String get licensesSubtitle => 'Lisensi sumber terbuka aplikasi ini';

  @override
  String get gplLicenseTitle => 'Teks lisensi GPL-3.0';

  @override
  String get sourceCodeTitle => 'Kode sumber (GitHub)';

  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';

  @override
  String get adConsentTitle => 'Pengaturan Privasi';

  @override
  String get imprintTitle => 'Imprint';

  @override
  String get linkOpenError => 'Tautan tidak dapat dibuka.';

  @override
  String get muteTooltip => 'Penjelasan tentang mematikan suara';

  @override
  String get muteInfoContent =>
      'Menghapus suara sepenuhnya dari video yang dikonversi.\n\nBerguna misalnya untuk menghilangkan suara latar belakang atau mengurangi ukuran file.';

  @override
  String estimatedSize(String size) {
    return 'Ukuran Perkiraan: $size MB';
  }

  @override
  String get convertButton => 'Konversi';

  @override
  String get crfLabel => 'Kualitas Video (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Kualitas Video';

  @override
  String get crfInfoContent =>
      '0 → tanpa kehilangan kualitas (file sangat besar)\n18 → hampir tanpa kehilangan kualitas secara visual\n23 → Standar (keseimbangan yang baik)\n28 → penurunan kualitas yang terlihat\n51 → kualitas terendah\n\nRekomendasi: 18–28';

  @override
  String get resolutionLabel => 'Resolusi';

  @override
  String get resolutionInfoTitle => 'Resolusi Umum';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nTips: Biarkan satu kolom kosong = kolom lainnya akan dihitung secara proporsional.';

  @override
  String get widthLabel => 'Lebar';

  @override
  String get heightLabel => 'Tinggi';

  @override
  String get emptyEqualsOriginal => 'Kosong = Asli';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Frame per detik';

  @override
  String get fpsInfoContent =>
      'Orig → Pertahankan FPS video sumber\n24 → Standar bioskop\n25 → Standar PAL/TV (Eropa)\n30 → NTSC/TV, Media Sosial\n60 → Lancar, Game, Olahraga';

  @override
  String get audioBitrateLabel => 'Bitrate Audio';

  @override
  String get silent => 'Diam';

  @override
  String get audioBitrateInfoContent =>
      'Diam → tanpa audio\n64 kbps → Suara, Podcast\n96 kbps → kualitas suara yang baik\n128 kbps → Musik standar\n192 kbps → kualitas audio tinggi\n320 kbps → kualitas MP3 maksimal';

  @override
  String get audioCodecLabel => 'Codec Audio';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → kompatibilitas terbaik dan biasanya lebih cepat\nH.265 → file lebih kecil dengan kualitas setara, lebih lambat\nVP9 → codec terbuka yang efisien untuk WebM dan MKV, encoding perangkat lunak lebih lambat\nXvid → codec MPEG-4 lama untuk AVI dan pemutar lama\n\nFormat keluaran yang tersedia mengikuti codec video dan audio yang dipilih.';

  @override
  String get xvidLegacyLabel => 'Xvid (lama)';

  @override
  String get audioCodecInfoContent =>
      'AAC → standar untuk MP4, kompatibilitas terbaik\nMP3 → codec lama yang banyak digunakan\nOpus → modern dan efisien, ideal untuk WebM dan MKV\nAC3 → Dolby Digital, hanya untuk sumber surround (≥ 3 kanal)\nVorbis → codec terbuka untuk WebM dan MKV\n\nFormat keluaran yang tidak kompatibel dinonaktifkan secara otomatis.';

  @override
  String get outputFormatLabel => 'Format Keluaran';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, kompatibilitas terbaik\nMKV → kontainer fleksibel untuk semua codec yang tersedia\nMOV → alur kerja Apple/QuickTime\nAVI → format lama dengan Xvid\nMPEG-TS → transport stream untuk TV dan streaming\nWebM → format web modern dengan VP9 dan Opus atau Vorbis\n\nFormat yang tidak kompatibel ditampilkan redup. Memilihnya akan otomatis menerapkan codec video bawaan dan, jika diperlukan, codec audio yang kompatibel.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec didukung oleh: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Format keluaran diubah menjadi $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Apa arti resolusi?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → file sangat kecil,\nmisalnya untuk WhatsApp\n\n480p (854×480) → Definisi Standar (SD)\n\n720p (1280×720) → HD, cocok untuk perangkat seluler\n\n1080p (1920×1080) → Full HD, standar untuk\n YouTube & TV\n\nTinggi/Sedang/Rendah menggambarkan kualitas pada resolusi yang sama — semakin tinggi = file semakin besar.';

  @override
  String get resolutionTooltip => 'Penjelasan resolusi';

  @override
  String get trimArea => 'Area pemotongan';

  @override
  String trimStartLabel(String time) {
    return 'Awal: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Akhir: $time';
  }

  @override
  String get adLoading => 'Iklan sedang dimuat…';

  @override
  String get convertedPrefix => 'telah dikonversi_';

  @override
  String get removeAdsTitle => 'Hapus Iklan';

  @override
  String removeAdsSubtitle(String price) {
    return 'Pembelian Sekali – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Tanpa Iklan ✓';

  @override
  String get removeAdsActiveSubtitle => 'Terima kasih atas dukungannya!';

  @override
  String get restorePurchasesTitle => 'Pulihkan Pembelian';

  @override
  String get purchaseButton => 'Beli';

  @override
  String get purchaseError => 'Pembelian gagal. Silakan coba lagi.';

  @override
  String get purchaseSuccess => 'Terima kasih! Iklan telah dinonaktifkan.';

  @override
  String get appName => 'Konverter Video';

  @override
  String get audioOnly => 'Hanya Audio';

  @override
  String get audioOnlyTooltip => 'Penjelasan Hanya Audio';

  @override
  String get audioOnlyInfoContent =>
      'Hanya mengekstrak trek audio dari video – tanpa gambar.\n\nMode Normal: MP3 dengan 192 kbps.\nMode Ahli: Codec dan bitrate dari pengaturan audio.\n\nBerguna, misalnya, untuk menyimpan musik atau podcast dari video.';

  @override
  String get aspectLocked => 'Rasio aspek terkunci';

  @override
  String get aspectUnlocked => 'Rasio aspek bebas';

  @override
  String get cpuWarningTitle => 'File besar';

  @override
  String get cpuWarningContent =>
      'Video ini berdurasi lebih dari 5 menit. Pada perangkat lama, proses konversi dapat menyebabkan penggunaan prosesor yang tinggi – hal ini normal.\n\nAnda dapat meletakkan ponsel di samping, aplikasi akan tetap berjalan di latar belakang.';

  @override
  String get cpuWarningCheckbox => 'Jangan tampilkan lagi';

  @override
  String get storageWarningTitle => 'Ruang penyimpanan tidak cukup';

  @override
  String storageWarningContent(String available, String required) {
    return 'Perangkat Anda hanya memiliki sisa ruang $available MB. Konversi membutuhkan sekitar $required MB. Silakan kosongkan ruang penyimpanan terlebih dahulu.';
  }

  @override
  String get feedbackTitle => 'Umpan Balik & Dukungan';

  @override
  String get feedbackSubtitle => 'Kirim bug, saran perbaikan, atau umpan balik';

  @override
  String get feedbackCategoryLabel => 'Kategori';

  @override
  String get feedbackCategoryBug => 'Laporkan bug';

  @override
  String get feedbackCategoryFeature => 'Saran perbaikan';

  @override
  String get feedbackCategoryFeedback => 'Umpan balik umum';

  @override
  String get feedbackMessageHint => 'Jelaskan masalah Anda…';

  @override
  String get feedbackSendButton => 'Kirim';

  @override
  String get notificationPermissionTitle => 'Konversi Latar Belakang';

  @override
  String get notificationPermissionContent =>
      'Izinkan pemberitahuan agar proses konversi dapat terus berjalan saat Anda menggunakan aplikasi lain. Tanpa izin ini, aplikasi harus tetap terbuka.';

  @override
  String get notificationPermissionNotNow => 'Tidak Sekarang';

  @override
  String get notificationPermissionAllow => 'Izinkan';

  @override
  String get notificationPermissionDenied =>
      'Aktifkan pemberitahuan di pengaturan untuk konversi latar belakang.';

  @override
  String get notificationPermissionOpenSettings => 'Pengaturan';

  @override
  String get backButton => 'Kembali';

  @override
  String get appSettingsTitle => 'Pengaturan Aplikasi';

  @override
  String get appSettingsSubtitle => 'Pengaturan penyimpanan otomatis & privasi';

  @override
  String get openSourceTitle => 'Sumber Terbuka';

  @override
  String get openSourceSubtitle => 'Lisensi & kode sumber';

  @override
  String get openSourceLicensesTitle => 'Lisensi Sumber Terbuka';

  @override
  String get legalSectionTitle => 'Hukum';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Mode Pengkodean';

  @override
  String get encodingModeCrf => 'Kualitas (CRF)';

  @override
  String get encodingModeBitrate => 'Laju bit';

  @override
  String get audioChannelsLabel => 'Saluran audio';

  @override
  String get audioChannelsInfoContent =>
      'Asli → pertahankan tata letak saluran sumber\nStereo → 2.0 (downmix jika diperlukan)\nMono → 1 saluran (file terkecil)\n5.1 → surround 6 saluran (hanya untuk sumber surround)\n\nDownmixing (mis. 5.1 → Stereo) didukung. Upmixing tidak ditawarkan.';

  @override
  String get audioChannelOriginal => 'Asli';

  @override
  String get targetBitrateLabel => 'Bitrate Tujuan';

  @override
  String get targetBitrateInfoTitle => 'Bitrate Tujuan';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps  → kompresi tinggi, pesan\n4–8 Mbps → 1080p kualitas normal/baik\n12 Mbps → 1080p kualitas tinggi / 4K kualitas rendah\n20 Mbps → kualitas streaming 4K\n\nEntri kustom: 500–40000 kbps atau misalnya \"8 Mbps\"\n\nTidak seperti CRF, kualitas dapat bervariasi antar adegan. Gunakan CRF untuk hasil yang lebih baik pada ukuran file yang sama.';

  @override
  String get rateAppTitle => 'Beri Peringkat Aplikasi';

  @override
  String get proHintTitle => 'Gunakan tanpa iklan';

  @override
  String get proHintBody =>
      'Dengan pembelian satu kali, Anda dapat menghapus iklan secara permanen dari aplikasi.';

  @override
  String get proHintLater => 'Nanti';

  @override
  String get restoreError =>
      'Tidak dapat memulihkan pembelian. Play Store saat ini sedang tidak tersedia — silakan coba lagi.';

  @override
  String get restoreNoPurchases => 'Tidak ditemukan pembelian sebelumnya.';
}
