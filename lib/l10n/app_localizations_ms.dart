// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get qualityLabel => 'Kualiti';

  @override
  String get quality2160pHigh => '2160p Tinggi';

  @override
  String get quality2160pMedium => '2160p Sederhana';

  @override
  String get quality2160pLow => '2160p Rendah';

  @override
  String get quality2160pVeryLow => '2160p Sangat rendah';

  @override
  String get quality1440pHigh => '1440p Tinggi';

  @override
  String get quality1440pMedium => '1440p Sederhana';

  @override
  String get quality1440pLow => '1440p Rendah';

  @override
  String get quality1440pVeryLow => '1440p Sangat rendah';

  @override
  String get quality1080pHigh => '1080p Tinggi';

  @override
  String get quality1080pMedium => '1080p Sederhana';

  @override
  String get quality1080pLow => '1080p Rendah';

  @override
  String get quality1080pVeryLow => '1080p Sangat rendah';

  @override
  String get quality720pHigh => '720p Tinggi';

  @override
  String get quality720pMedium => '720p Sederhana';

  @override
  String get quality720pLow => '720p Rendah';

  @override
  String get quality720pVeryLow => '720p Sangat rendah';

  @override
  String get quality480pHigh => '480p Tinggi';

  @override
  String get quality480pMedium => '480p Sederhana';

  @override
  String get quality480pLow => '480p Rendah';

  @override
  String get quality480pVeryLow => '480p Sangat rendah';

  @override
  String get quality360pHigh => '360p Tinggi';

  @override
  String get quality360pMedium => '360p Sederhana';

  @override
  String get quality360pLow => '360p Rendah';

  @override
  String get quality360pVeryLow => '360p Sangat rendah';

  @override
  String get mute => 'Senyapkan';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Pilih video';

  @override
  String get videoLoading => 'Memuatkan video…';

  @override
  String get modeNormal => 'Biasa';

  @override
  String get modeExpert => 'Pakar';

  @override
  String get invalidVideoFile => 'Sila pilih fail video yang sah.';

  @override
  String get fileLoadError =>
      'Fail tidak dapat dimuatkan. Sila pilih fail video.';

  @override
  String get previewNotAvailable =>
      'Pratonton tidak tersedia. Video masih boleh ditukar.';

  @override
  String get previewNotAvailableLabel =>
      'Pratonton tidak tersedia\n(Resolusi terlalu tinggi untuk peranti ini)';

  @override
  String get noVideoLoaded => 'Sila muatkan video dahulu.';

  @override
  String get cancelConversionTitle => 'Batalkan penukaran?';

  @override
  String get cancelConversionContent => 'Kemajuan penukaran akan hilang.';

  @override
  String get continueConversion => 'Teruskan';

  @override
  String get cancel => 'Batal';

  @override
  String get discardVideoTitle => 'Buang video?';

  @override
  String get discardVideoContent =>
      'Video yang telah ditukar akan dipadamkan dan tidak disimpan.';

  @override
  String get keep => 'Kekalkan';

  @override
  String get discard => 'Buang';

  @override
  String get save => 'Simpan';

  @override
  String get saveVideoDialogTitle => 'Simpan video';

  @override
  String get savedSuccess => 'Disimpan!';

  @override
  String get open => 'Buka';

  @override
  String get openGallery => 'Buka galeri';

  @override
  String get openVideo => 'Buka video';

  @override
  String get autoSaveTitle => 'Simpan video ke galeri secara automatik';

  @override
  String get autoSaveSubtitle =>
      'Video disimpan secara automatik selepas penukaran.';

  @override
  String get videoCodecTitle => 'Kodek video';

  @override
  String get videoCodecSubtitle =>
      'Kodek video untuk penukaran dalam Mod Biasa';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC atau AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 menawarkan keserasian terbaik dan biasanya menukar video dengan lebih pantas.\n\nH.265/HEVC boleh menghasilkan fail yang lebih kecil dengan kualiti visual yang setanding, tetapi penukaran mengambil masa lebih lama. Peranti atau aplikasi lama mungkin tidak dapat memainkan hasilnya.\n\nAV1 ialah kodek moden yang direka untuk menghasilkan fail kecil. Peranti dan aplikasi lama selalunya tidak dapat memainkan hasilnya.\n\nSemua pengekod disertakan dalam aplikasi dan tidak bergantung pada kodek yang dipasang pada peranti.';

  @override
  String get saveError =>
      'Gagal menyimpan. Ruang storan mungkin tidak mencukupi.';

  @override
  String get saveErrorOutOfMemory =>
      'Memori tidak mencukupi untuk menyimpan fail ini. Cuba klip yang lebih pendek atau kualiti yang lebih rendah.';

  @override
  String get conversionDone => 'Selesai!';

  @override
  String conversionProgress(String percent) {
    return 'Menukar: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Penukaran gagal: $error';
  }

  @override
  String get settingsTitle => 'Tetapan';

  @override
  String get licensesTitle => 'Lesen';

  @override
  String get licensesSubtitle => 'Lesen sumber terbuka aplikasi ini';

  @override
  String get gplLicenseTitle => 'Teks Lesen GPL-3.0';

  @override
  String get sourceCodeTitle => 'Kod sumber (GitHub)';

  @override
  String get privacyPolicyTitle => 'Dasar privasi';

  @override
  String get adConsentTitle => 'Tetapan privasi';

  @override
  String get imprintTitle => 'Maklumat penerbit';

  @override
  String get linkOpenError => 'Pautan tidak dapat dibuka.';

  @override
  String get muteTooltip => 'Penerangan fungsi senyapkan';

  @override
  String get muteInfoContent =>
      'Membuang audio sepenuhnya daripada video yang ditukar.\n\nBerguna, contohnya untuk membuang hingar latar atau mengecilkan saiz fail.';

  @override
  String estimatedSize(String size) {
    return 'Anggaran saiz: $size MB';
  }

  @override
  String get convertButton => 'Tukar';

  @override
  String get crfLabel => 'Kualiti video (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Kualiti video';

  @override
  String get crfInfoContent =>
      '0 → tanpa kehilangan kualiti (fail sangat besar)\n18 → hampir tiada kehilangan kualiti secara visual\n23 → standard (seimbang)\n28 → kehilangan kualiti yang ketara\n51 → kualiti paling rendah\n\nDisyorkan: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → tanpa kehilangan kualiti (fail sangat besar)\n25 → hampir tiada kehilangan kualiti secara visual\n30 → standard (seimbang)\n38 → kehilangan kualiti yang ketara\n63 → kualiti paling rendah\n\nDisyorkan: 25–38\n\nVP9 dan AV1 menggunakan skala 0–63: nilai yang sama mewakili kualiti yang berbeza berbanding H.264/H.265.';

  @override
  String get resolutionLabel => 'Resolusi';

  @override
  String get resolutionInfoTitle => 'Resolusi lazim';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nPetua: Biarkan satu medan kosong = nilai yang satu lagi akan dikira mengikut perkadaran.';

  @override
  String get widthLabel => 'Lebar';

  @override
  String get heightLabel => 'Tinggi';

  @override
  String get emptyEqualsOriginal => 'Kosong = Asal';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Bingkai sesaat';

  @override
  String get fpsInfoContent =>
      'Asal  → Kekalkan FPS video sumber\n24    → Standard pawagam\n25    → Standard PAL/TV (Eropah)\n30    → NTSC/TV, media sosial\n60    → Lancar, permainan, sukan';

  @override
  String get audioBitrateLabel => 'Kadar bit audio';

  @override
  String get silent => 'Tanpa audio';

  @override
  String get audioBitrateInfoContent =>
      'Tanpa audio → tiada audio\n64 kbps  → suara, podcast\n96 kbps  → kualiti suara yang baik\n128 kbps → muzik standard\n192 kbps → kualiti audio tinggi\n320 kbps → kualiti MP3 maksimum';

  @override
  String get audioCodecLabel => 'Kodek audio';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → keserasian terbaik dan pengekodan biasanya lebih pantas\nH.265 → fail lebih kecil dengan kualiti setanding, pengekodan lebih perlahan\nVP9 → kodek terbuka yang cekap untuk WebM dan MKV, pengekodan perisian lebih perlahan\nAV1 → kodek moden untuk fail kecil, pengekodan perisian sahaja\nXvid → kodek MPEG-4 lama untuk AVI dan pemain lama\n\nFormat output di bawah diaktifkan mengikut kodek video dan audio yang dipilih.';

  @override
  String get xvidLegacyLabel => 'Xvid (Lama)';

  @override
  String get av1SlowHint =>
      'AV1 hanya menggunakan pengekodan perisian dan jauh lebih perlahan berbanding H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Untuk resolusi melebihi 720p, pertimbangkan untuk mengecilkan resolusi dahulu.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard untuk MP4, keserasian terbaik\nMP3 → kodek lama yang digunakan secara meluas\nOpus → moden dan cekap, sesuai untuk WebM dan MKV\nAC3 → Dolby Digital, hanya dipaparkan untuk sumber bunyi keliling (≥ 3 saluran)\nVorbis → kodek terbuka untuk WebM dan MKV\n\nFormat output yang tidak serasi dinyahaktifkan secara automatik.';

  @override
  String get outputFormatLabel => 'Format output';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, keserasian terbaik\nMKV → format bekas fleksibel untuk semua kodek yang ditawarkan\nMOV → aliran kerja Apple/QuickTime\nAVI → format lama yang menggunakan Xvid\nMPEG-TS → aliran pengangkutan untuk TV dan penstriman\nWebM → format web moden yang menggunakan VP9 bersama Opus atau Vorbis\n\nFormat yang tidak serasi dipaparkan malap. Memilihnya akan menggunakan kodek video lalainya secara automatik dan, jika perlu, kodek audio yang serasi.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec disokong oleh: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Format output ditukar kepada $format.';
  }

  @override
  String get orig => 'Asal';

  @override
  String get resolutionExplainTitle => 'Apakah maksud resolusi ini?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → fail sangat kecil,\ncth. untuk WhatsApp\n\n480p  (854×480)   → Definisi Standard (SD)\n\n720p  (1280×720)  → HD, sesuai untuk peranti mudah alih\n\n1080p (1920×1080) → Full HD, standard untuk\n                          YouTube & TV\n\nTinggi/Sederhana/Rendah menerangkan kualiti pada resolusi yang sama — lebih tinggi = fail lebih besar.';

  @override
  String get resolutionTooltip => 'Penerangan resolusi';

  @override
  String get trimArea => 'Julat pangkasan';

  @override
  String trimStartLabel(String time) {
    return 'Mula: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Akhir: $time';
  }

  @override
  String get adLoading => 'Memuatkan iklan…';

  @override
  String get convertedPrefix => 'ditukar_';

  @override
  String get removeAdsTitle => 'Buang iklan';

  @override
  String removeAdsSubtitle(String price) {
    return 'Pembelian sekali sahaja – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Tanpa iklan ✓';

  @override
  String get removeAdsActiveSubtitle => 'Terima kasih atas sokongan anda!';

  @override
  String get restorePurchasesTitle => 'Pulihkan pembelian';

  @override
  String get purchaseButton => 'Beli';

  @override
  String get purchaseError => 'Pembelian gagal. Sila cuba lagi.';

  @override
  String get purchaseSuccess => 'Terima kasih! Iklan telah dinyahaktifkan.';

  @override
  String get appName => 'Penukar Video';

  @override
  String get audioOnly => 'Audio sahaja';

  @override
  String get audioOnlyTooltip => 'Penerangan audio sahaja';

  @override
  String get audioOnlyInfoContent =>
      'Mengekstrak trek audio sahaja daripada video — tanpa gambar.\n\nMod Biasa: MP3 pada 192 kbps.\nMod Pakar: Kodek dan kadar bit daripada tetapan audio.\n\nBerguna, contohnya untuk menyimpan muzik atau podcast daripada video.';

  @override
  String get aspectLocked => 'Nisbah bidang dikunci';

  @override
  String get aspectUnlocked => 'Nisbah bidang tidak dikunci';

  @override
  String get cpuWarningTitle => 'Fail besar';

  @override
  String get cpuWarningContent =>
      'Video ini lebih panjang daripada 5 minit. Pada peranti lama, penukaran mungkin menyebabkan penggunaan CPU yang tinggi — ini perkara biasa.\n\nAnda boleh meletakkan telefon ke tepi; aplikasi akan terus berjalan di latar belakang.';

  @override
  String get cpuWarningCheckbox => 'Jangan tunjuk lagi';

  @override
  String get storageWarningTitle => 'Storan tidak mencukupi';

  @override
  String storageWarningContent(String available, String required) {
    return 'Peranti anda hanya mempunyai $available MB ruang kosong. Penukaran memerlukan kira-kira $required MB. Sila kosongkan sedikit ruang dahulu.';
  }

  @override
  String get feedbackTitle => 'Maklum balas & sokongan';

  @override
  String get feedbackSubtitle =>
      'Hantar laporan pepijat, cadangan atau maklum balas';

  @override
  String get feedbackCategoryLabel => 'Kategori';

  @override
  String get feedbackCategoryBug => 'Laporkan pepijat';

  @override
  String get feedbackCategoryFeature => 'Permintaan ciri';

  @override
  String get feedbackCategoryFeedback => 'Maklum balas umum';

  @override
  String get feedbackMessageHint => 'Terangkan masalah anda…';

  @override
  String get feedbackSendButton => 'Hantar';

  @override
  String get notificationPermissionTitle => 'Penukaran di latar belakang';

  @override
  String get notificationPermissionContent =>
      'Benarkan pemberitahuan supaya penukaran boleh diteruskan semasa anda menggunakan aplikasi lain. Tanpanya, aplikasi ini mesti kekal terbuka.';

  @override
  String get notificationPermissionNotNow => 'Bukan sekarang';

  @override
  String get notificationPermissionAllow => 'Benarkan';

  @override
  String get notificationPermissionDenied =>
      'Aktifkan pemberitahuan dalam Tetapan untuk menukar video di latar belakang.';

  @override
  String get notificationPermissionOpenSettings => 'Tetapan';

  @override
  String get backButton => 'Kembali';

  @override
  String get appSettingsTitle => 'Tetapan aplikasi';

  @override
  String get appSettingsSubtitle => 'Tetapan simpan automatik & privasi';

  @override
  String get openSourceTitle => 'Sumber terbuka';

  @override
  String get openSourceSubtitle => 'Lesen & kod sumber';

  @override
  String get openSourceLicensesTitle => 'Lesen sumber terbuka';

  @override
  String get legalSectionTitle => 'Undang-undang';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Mod pengekodan';

  @override
  String get encodingModeCrf => 'Kualiti (CRF)';

  @override
  String get encodingModeBitrate => 'Kadar bit';

  @override
  String get audioChannelsLabel => 'Saluran audio';

  @override
  String get audioChannelsInfoContent =>
      'Asal → kekalkan susun atur saluran sumber\nStereo → 2.0 (kurangkan saluran jika perlu)\nMono → 1 saluran (fail paling kecil)\n5.1 → bunyi keliling 6 saluran (sumber bunyi keliling sahaja)\n\nPengurangan saluran (cth. 5.1 → Stereo) disokong. Penambahan saluran tidak ditawarkan.';

  @override
  String get audioChannelOriginal => 'Asal';

  @override
  String get targetBitrateLabel => 'Kadar bit sasaran';

  @override
  String get targetBitrateInfoTitle => 'Kadar bit sasaran';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → pemampatan tinggi, aplikasi pemesejan\n4–8 Mbps → kualiti standard/baik pada 1080p\n12 Mbps → kualiti tinggi pada 1080p / kualiti rendah pada 4K\n20 Mbps → kualiti penstriman 4K\n\nNilai tersuai: gunakan ikon pensel (500–100000 kbps)\n\nBerbeza dengan CRF, kualiti mungkin berubah mengikut adegan. Gunakan CRF untuk hasil yang lebih baik pada saiz fail yang sama.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 dan AV1 mencapai kualiti yang sama pada kira-kira separuh kadar bit ini.';

  @override
  String get rateAppTitle => 'Nilaikan aplikasi';

  @override
  String get proHintTitle => 'Gunakan tanpa iklan';

  @override
  String get proHintBody =>
      'Dengan pembelian sekali sahaja, anda boleh membuang iklan daripada aplikasi secara kekal.';

  @override
  String get proHintLater => 'Kemudian';

  @override
  String get restoreError =>
      'Pembelian tidak dapat dipulihkan. Play Store tidak tersedia buat masa ini — sila cuba lagi.';

  @override
  String get restoreNoPurchases => 'Tiada pembelian terdahulu ditemui.';

  @override
  String get hdrCodecSwitched =>
      'Video HDR dikesan — H.265 digunakan untuk video ini supaya warnanya dikekalkan.';

  @override
  String get themeTitle => 'Penampilan';

  @override
  String get themeSubtitle => 'Ikut sistem atau pilih tema cerah atau gelap';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Cerah';

  @override
  String get themeDark => 'Gelap';

  @override
  String get targetBitrateEditTooltip => 'Masukkan kadar bit';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Julat yang dibenarkan: $range';
  }

  @override
  String get hwEncoderTitle => 'Pengekod perkakasan (pantas)';

  @override
  String get hwEncoderSubtitle =>
      'Jauh lebih pantas, tetapi memerlukan kira-kira dua kali ganda kadar bit untuk kualiti yang sama. Mod kadar bit sahaja.';

  @override
  String get hwEncoderHdrHint =>
      'Video HDR — video akan ditukar menggunakan pengekod perisian supaya HDR dikekalkan.';

  @override
  String get hwEncoderFallback =>
      'Pengekod perkakasan gagal — penukaran diteruskan menggunakan pengekod perisian.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format tidak disokong oleh pengekod perkakasan — format ini akan ditukar menggunakan pengekod perisian.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Pengekod perkakasan dimatikan — ia hanya menyokong mod kadar bit.';

  @override
  String get resolutionPresetLabel => 'Pratetap';

  @override
  String get resolutionOriginal => 'Asal';

  @override
  String get resolutionCustom => 'Tersuai';

  @override
  String get aspectRatioLabel => 'Nisbah bidang';

  @override
  String get aspectOriginal => 'Asal';

  @override
  String get aspectCustom => 'Tersuai';

  @override
  String get fitModeLabel => 'Penyesuaian';

  @override
  String get fitPad => 'Jalur hitam';

  @override
  String get fitCrop => 'Pangkas';

  @override
  String get fitStretch => 'Regang';

  @override
  String get fitModeInfoContent =>
      'Nisbah bidang sasaran berbeza daripada video.\n\nJalur hitam → seluruh gambar kekal kelihatan, jalur hitam mengisi ruang selebihnya\nPangkas → bahagian tengah diambil, bahagian tepi dibuang\nRegang → gambar diherotkan untuk memenuhi bingkai';

  @override
  String get deleteOriginal => 'Padam video asal';

  @override
  String get originalTrashed =>
      'Video asal dialihkan ke tong sampah — anda boleh memulihkannya dari situ.';

  @override
  String get originalTrashFailed => 'Video asal tidak dapat dipadamkan.';

  @override
  String get burnInSubtitlesLabel => 'Tambah sari kata';

  @override
  String get burnInSubtitlesInfoContent =>
      'Kekal: Sari kata diterapkan pada imej video. Sari kata kelihatan dalam setiap pemain dan tidak boleh dimatikan kemudian. Pada video yang kekal dalam HDR, sari kata mungkin kelihatan sangat terang.\n\nPilihan: Sari kata ditambah sebagai trek berasingan yang boleh dihidupkan atau dimatikan dalam pemain. Bukan semua pemain memaparkannya, dan sari kata sering hilang apabila video dikongsi. Tidak tersedia untuk AVI dan MPEG-TS.\n\nMenyokong fail SRT dan ASS. Gaya dan kedudukan ASS dikekalkan sepenuhnya dalam mod Kekal dan dalam fail MKV. Format lain hanya mengekalkan sebahagian gaya tanpa kedudukan.';

  @override
  String get subtitleModeBurnIn => 'Kekal';

  @override
  String get subtitleModeTrack => 'Pilihan';

  @override
  String get subtitleTrackEmpty =>
      'Tiada sari kata dalam bahagian video yang dipilih.';

  @override
  String get sharedVideoBusy =>
      'Selesaikan penukaran semasa dahulu, kemudian kongsi video sekali lagi.';

  @override
  String get burnInSubtitlesSelect => 'Pilih fail SRT atau ASS';

  @override
  String get burnInSubtitlesRemove => 'Buang fail sari kata';

  @override
  String get burnInSubtitlesUnsupported => 'Sila pilih fail .srt atau .ass.';

  @override
  String get burnInSubtitlesInvalid =>
      'Fail sari kata ini tidak dapat dibaca atau tidak mengandungi sari kata yang sah.';

  @override
  String get burnInSubtitlesMissing =>
      'Fail sari kata tidak lagi tersedia. Sila pilih semula.';

  @override
  String get subtitleTextSizeLabel => 'Saiz teks';

  @override
  String get subtitleTextSizeSmall => 'Kecil';

  @override
  String get subtitleTextSizeMedium => 'Sederhana';

  @override
  String get subtitleTextSizeLarge => 'Besar';

  @override
  String get subtitlePositionLabel => 'Kedudukan';

  @override
  String get subtitlePositionBottom => 'Bawah';

  @override
  String get subtitlePositionTop => 'Atas';

  @override
  String get subtitleBackgroundTitle => 'Latar belakang kelabu';
}
