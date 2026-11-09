// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get qualityLabel => 'Kalidad';

  @override
  String get quality2160pHigh => '2160p Mataas';

  @override
  String get quality2160pMedium => '2160p Katamtaman';

  @override
  String get quality2160pLow => '2160p Mababa';

  @override
  String get quality2160pVeryLow => '2160p Napakababa';

  @override
  String get quality1440pHigh => '1440p Mataas';

  @override
  String get quality1440pMedium => '1440p Katamtaman';

  @override
  String get quality1440pLow => '1440p Mababa';

  @override
  String get quality1440pVeryLow => '1440p Napakababa';

  @override
  String get quality1080pHigh => '1080p Mataas';

  @override
  String get quality1080pMedium => '1080p Katamtaman';

  @override
  String get quality1080pLow => '1080p Mababa';

  @override
  String get quality1080pVeryLow => '1080p Napakababa';

  @override
  String get quality720pHigh => '720p Mataas';

  @override
  String get quality720pMedium => '720p Katamtaman';

  @override
  String get quality720pLow => '720p Mababa';

  @override
  String get quality720pVeryLow => '720p Napakababa';

  @override
  String get quality480pHigh => '480p Mataas';

  @override
  String get quality480pMedium => '480p Katamtaman';

  @override
  String get quality480pLow => '480p Mababa';

  @override
  String get quality480pVeryLow => '480p Napakababa';

  @override
  String get quality360pHigh => '360p Mataas';

  @override
  String get quality360pMedium => '360p Katamtaman';

  @override
  String get quality360pLow => '360p Mababa';

  @override
  String get quality360pVeryLow => '360p Napakababa';

  @override
  String get mute => 'Alisin ang audio';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Pumili ng video';

  @override
  String get videoLoading => 'Nilo-load ang video…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Pumili ng wastong video file.';

  @override
  String get fileLoadError => 'Hindi ma-load ang file. Pumili ng video file.';

  @override
  String get previewNotAvailable =>
      'Walang preview. Maaari pa ring i-convert ang video.';

  @override
  String get previewNotAvailableLabel =>
      'Walang preview\n(Masyadong mataas ang resolution para sa device na ito)';

  @override
  String get noVideoLoaded => 'Mag-load muna ng video.';

  @override
  String get cancelConversionTitle => 'Kanselahin ang conversion?';

  @override
  String get cancelConversionContent => 'Mawawala ang progreso ng conversion.';

  @override
  String get continueConversion => 'Magpatuloy';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get discardVideoTitle => 'Itapon ang video?';

  @override
  String get discardVideoContent =>
      'Ide-delete ang na-convert na video at hindi ito mase-save.';

  @override
  String get keep => 'Panatilihin';

  @override
  String get discard => 'Itapon';

  @override
  String get save => 'I-save';

  @override
  String get saveVideoDialogTitle => 'I-save ang video';

  @override
  String get savedSuccess => 'Na-save na!';

  @override
  String get open => 'Buksan';

  @override
  String get openGallery => 'Buksan ang gallery';

  @override
  String get openVideo => 'Buksan ang video';

  @override
  String get autoSaveTitle => 'Awtomatikong i-save ang mga video sa gallery';

  @override
  String get autoSaveSubtitle =>
      'Awtomatikong sine-save ang mga video pagkatapos ng conversion.';

  @override
  String get videoCodecTitle => 'Codec ng video';

  @override
  String get videoCodecSubtitle =>
      'Codec ng video para sa conversion sa Normal na Mode';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC o AV1?';

  @override
  String get videoCodecInfoContent =>
      'Pinakamalawak ang suporta sa H.264 at karaniwan itong mas mabilis mag-convert.\n\nKayang gumawa ng H.265/HEVC ng mas maliliit na file na may halos kaparehong kalidad ng larawan, pero mas matagal ang conversion. Maaaring hindi ma-play ang resulta sa mga mas lumang device o app.\n\nAng AV1 ay modernong codec na dinisenyo para sa maliliit na file. Madalas na hindi ma-play ang resulta sa mga mas lumang device at app.\n\nKasama na sa app ang lahat ng encoder at hindi nakadepende ang mga ito sa mga codec na naka-install sa device.';

  @override
  String get saveError =>
      'Hindi ma-save. Maaaring kulang ang espasyo sa storage.';

  @override
  String get saveErrorOutOfMemory =>
      'Kulang ang memory para i-save ang file na ito. Subukan ang mas maikling clip o mas mababang kalidad.';

  @override
  String get conversionDone => 'Tapos na!';

  @override
  String conversionProgress(String percent) {
    return 'Kino-convert: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Hindi na-convert: $error';
  }

  @override
  String get settingsTitle => 'Mga Setting';

  @override
  String get licensesTitle => 'Mga Lisensya';

  @override
  String get licensesSubtitle =>
      'Mga lisensya ng open source na ginagamit sa app na ito';

  @override
  String get gplLicenseTitle => 'Teksto ng Lisensya ng GPL-3.0';

  @override
  String get sourceCodeTitle => 'Source Code (GitHub)';

  @override
  String get privacyPolicyTitle => 'Patakaran sa Privacy';

  @override
  String get adConsentTitle => 'Mga Setting ng Privacy';

  @override
  String get imprintTitle => 'Impormasyon ng Publisher';

  @override
  String get linkOpenError => 'Hindi mabuksan ang link.';

  @override
  String get muteTooltip => 'Tungkol sa pag-alis ng audio';

  @override
  String get muteInfoContent =>
      'Ganap na inaalis ang audio sa na-convert na video.\n\nKapaki-pakinabang, halimbawa, para alisin ang ingay sa background o paliitin ang file.';

  @override
  String estimatedSize(String size) {
    return 'Tinantyang laki: $size MB';
  }

  @override
  String get convertButton => 'I-convert';

  @override
  String get crfLabel => 'Kalidad ng video (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Kalidad ng video';

  @override
  String get crfInfoContent =>
      '0 → walang bawas sa kalidad (napakalaking file)\n18 → halos walang nakikitang bawas sa kalidad\n23 → pamantayan (magandang balanse)\n28 → kapansin-pansing bawas sa kalidad\n51 → pinakamababang kalidad\n\nInirerekomenda: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → walang bawas sa kalidad (napakalaking file)\n25 → halos walang nakikitang bawas sa kalidad\n30 → pamantayan (magandang balanse)\n38 → kapansin-pansing bawas sa kalidad\n63 → pinakamababang kalidad\n\nInirerekomenda: 25–38\n\nGumagamit ang VP9 at AV1 ng sukat na 0–63: ang parehong halaga ay tumutugma sa ibang kalidad kumpara sa H.264/H.265.';

  @override
  String get resolutionLabel => 'Resolution';

  @override
  String get resolutionInfoTitle => 'Mga karaniwang resolution';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nTip: Iwang blangko ang isang field = awtomatikong kakalkulahin ang isa pa ayon sa proporsyon.';

  @override
  String get widthLabel => 'Lapad';

  @override
  String get heightLabel => 'Taas';

  @override
  String get emptyEqualsOriginal => 'Blangko = Orihinal';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Mga frame bawat segundo';

  @override
  String get fpsInfoContent =>
      'Orih  → Panatilihin ang FPS ng orihinal na video\n24    → Pamantayan sa sine\n25    → Pamantayan ng PAL/TV (Europa)\n30    → NTSC/TV, social media\n60    → Makinis na galaw, gaming, sports';

  @override
  String get audioBitrateLabel => 'Bitrate ng audio';

  @override
  String get silent => 'Walang audio';

  @override
  String get audioBitrateInfoContent =>
      'Walang audio → walang tunog\n64 kbps  → boses, mga podcast\n96 kbps  → magandang kalidad ng boses\n128 kbps → karaniwang kalidad ng musika\n192 kbps → mataas na kalidad ng audio\n320 kbps → pinakamataas na kalidad ng MP3';

  @override
  String get audioCodecLabel => 'Codec ng audio';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → pinakamalawak na suporta at karaniwang mas mabilis mag-encode\nH.265 → mas maliliit na file sa halos kaparehong kalidad, mas mabagal mag-encode\nVP9 → mahusay na open codec para sa WebM at MKV, mas mabagal na software encoding\nAV1 → modernong codec para sa maliliit na file, software encoding lang\nXvid → lumang MPEG-4 codec para sa AVI at mga mas lumang player\n\nNagiging available ang mga output format sa ibaba ayon sa napiling codec ng video at audio.';

  @override
  String get xvidLegacyLabel => 'Xvid (Luma)';

  @override
  String get av1SlowHint =>
      'Software encoding lang ang ginagamit ng AV1 at mas mabagal ito kaysa sa H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Para sa mga resolution na lampas 720p, isaalang-alang munang babaan ang resolution.';

  @override
  String get audioCodecInfoContent =>
      'AAC → pamantayan para sa MP4, pinakamalawak na suporta\nMP3 → lumang codec na malawakang ginagamit\nOpus → moderno at mahusay, mainam para sa WebM at MKV\nAC3 → Dolby Digital, ipinapakita lang kung surround ang orihinal na audio (≥ 3 channel)\nVorbis → open codec para sa WebM at MKV\n\nAwtomatikong dini-disable ang mga hindi tugmang output format.';

  @override
  String get outputFormatLabel => 'Output format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → pangkalahatan, pinakamalawak na suporta\nMKV → flexible na container para sa lahat ng available na codec\nMOV → para sa mga gawain sa Apple/QuickTime\nAVI → lumang format na gumagamit ng Xvid\nMPEG-TS → transport stream para sa TV at streaming\nWebM → modernong format para sa web na gumagamit ng VP9 kasama ang Opus o Vorbis\n\nNaka-gray ang mga hindi tugmang format. Kapag pumili ka ng isa, awtomatikong gagamitin ang default nitong codec ng video at, kung kailangan, isang tugmang codec ng audio.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return 'Sinusuportahan ang $videoCodec + $audioCodec ng: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Ginawang $format ang output format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle =>
      'Ano ang ibig sabihin ng mga resolution?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → napakaliit na file,\nhal. para sa WhatsApp\n\n480p  (854×480)   → Standard Definition (SD)\n\n720p  (1280×720)  → HD, mainam para sa mga mobile device\n\n1080p (1920×1080) → Full HD, pamantayan para sa\n                          YouTube at TV\n\nAng Mataas/Katamtaman/Mababa ay tumutukoy sa kalidad sa parehong resolution — mas mataas = mas malaking file.';

  @override
  String get resolutionTooltip => 'Tungkol sa mga resolution';

  @override
  String get trimArea => 'Bahaging iti-trim';

  @override
  String trimStartLabel(String time) {
    return 'Simula: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Dulo: $time';
  }

  @override
  String get adLoading => 'Nilo-load ang ad…';

  @override
  String get convertedPrefix => 'na_convert_';

  @override
  String get removeAdsTitle => 'Alisin ang mga Ad';

  @override
  String removeAdsSubtitle(String price) {
    return 'Isang beses na pagbili – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Walang ad ✓';

  @override
  String get removeAdsActiveSubtitle => 'Salamat sa iyong suporta!';

  @override
  String get restorePurchasesTitle => 'Ibalik ang pagbili';

  @override
  String get purchaseButton => 'Bumili';

  @override
  String get purchaseError => 'Hindi natuloy ang pagbili. Subukan ulit.';

  @override
  String get purchaseSuccess => 'Salamat! Na-disable na ang mga ad.';

  @override
  String get appName => 'Pang-convert ng Video';

  @override
  String get audioOnly => 'Audio Lang';

  @override
  String get audioOnlyTooltip => 'Tungkol sa Audio Lang';

  @override
  String get audioOnlyInfoContent =>
      'Kinukuha lang ang audio track mula sa video — walang larawan.\n\nNormal na Mode: MP3 sa 192 kbps.\nExpert Mode: Codec at bitrate mula sa mga setting ng audio.\n\nKapaki-pakinabang, halimbawa, para i-save ang musika o mga podcast mula sa mga video.';

  @override
  String get aspectLocked => 'Naka-lock ang aspect ratio';

  @override
  String get aspectUnlocked => 'Naka-unlock ang aspect ratio';

  @override
  String get cpuWarningTitle => 'Malaking file';

  @override
  String get cpuWarningContent =>
      'Mas mahaba sa 5 minuto ang video na ito. Sa mga mas lumang device, maaaring mataas ang paggamit ng CPU habang nagko-convert — normal lang iyon.\n\nMaaari mong itabi muna ang iyong telepono; patuloy na gagana ang app sa background.';

  @override
  String get cpuWarningCheckbox => 'Huwag nang ipakita ulit';

  @override
  String get storageWarningTitle => 'Kulang ang storage';

  @override
  String storageWarningContent(String available, String required) {
    return '$available MB na lang ang bakante sa iyong device. Kailangan ng humigit-kumulang $required MB para sa conversion. Magbakante muna ng espasyo.';
  }

  @override
  String get feedbackTitle => 'Feedback at Suporta';

  @override
  String get feedbackSubtitle => 'Magpadala ng mga bug, mungkahi o feedback';

  @override
  String get feedbackCategoryLabel => 'Kategorya';

  @override
  String get feedbackCategoryBug => 'Mag-ulat ng Bug';

  @override
  String get feedbackCategoryFeature => 'Humiling ng Feature';

  @override
  String get feedbackCategoryFeedback => 'Pangkalahatang Feedback';

  @override
  String get feedbackMessageHint => 'Ilarawan ang iyong problema…';

  @override
  String get feedbackSendButton => 'Ipadala';

  @override
  String get notificationPermissionTitle => 'Conversion sa Background';

  @override
  String get notificationPermissionContent =>
      'Payagan ang mga notification para magpatuloy ang conversion habang gumagamit ka ng ibang app. Kung hindi, kailangang manatiling bukas ang app.';

  @override
  String get notificationPermissionNotNow => 'Huwag Muna';

  @override
  String get notificationPermissionAllow => 'Payagan';

  @override
  String get notificationPermissionDenied =>
      'I-enable ang mga notification sa Mga Setting para mag-convert sa background.';

  @override
  String get notificationPermissionOpenSettings => 'Mga Setting';

  @override
  String get backButton => 'Bumalik';

  @override
  String get appSettingsTitle => 'Mga Setting ng App';

  @override
  String get appSettingsSubtitle =>
      'Mga setting ng awtomatikong pag-save at privacy';

  @override
  String get openSourceTitle => 'Open Source';

  @override
  String get openSourceSubtitle => 'Mga lisensya at source code';

  @override
  String get openSourceLicensesTitle => 'Mga Lisensya ng Open Source';

  @override
  String get legalSectionTitle => 'Legal';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Mode ng Encoding';

  @override
  String get encodingModeCrf => 'Kalidad (CRF)';

  @override
  String get encodingModeBitrate => 'Bitrate';

  @override
  String get audioChannelsLabel => 'Mga channel ng audio';

  @override
  String get audioChannelsInfoContent =>
      'Orihinal → panatilihin ang ayos ng mga channel ng orihinal na audio\nStereo → 2.0 (bawasan ang mga channel kung kailangan)\nMono → 1 channel (pinakamaliit na file)\n5.1 → surround na may 6 na channel (para lang sa orihinal na surround audio)\n\nPuwedeng bawasan ang mga channel (hal. 5.1 → Stereo). Hindi puwedeng dagdagan ang mga channel.';

  @override
  String get audioChannelOriginal => 'Orihinal';

  @override
  String get targetBitrateLabel => 'Target na Bitrate';

  @override
  String get targetBitrateInfoTitle => 'Target na Bitrate';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → matinding compression, mga messaging app\n4–8 Mbps → karaniwan/magandang kalidad sa 1080p\n12 Mbps → mataas na kalidad sa 1080p / mababang kalidad sa 4K\n20 Mbps → kalidad para sa 4K streaming\n\nSariling halaga: gamitin ang icon na lapis (500–100000 kbps)\n\nHindi gaya ng CRF, maaaring mag-iba ang kalidad depende sa eksena. Gamitin ang CRF para sa mas magandang resulta sa parehong laki ng file.';

  @override
  String get targetBitrateWideScaleHint =>
      'Nakakamit ng VP9 at AV1 ang parehong kalidad sa humigit-kumulang kalahati ng mga bitrate na ito.';

  @override
  String get rateAppTitle => 'I-rate ang App';

  @override
  String get proHintTitle => 'Gamitin nang walang ad';

  @override
  String get proHintBody =>
      'Sa isang beses na pagbili, maaari mong permanenteng alisin ang mga ad sa app.';

  @override
  String get proHintLater => 'Mamaya';

  @override
  String get restoreError =>
      'Hindi maibalik ang mga pagbili. Hindi available ang Play Store sa ngayon — subukan ulit.';

  @override
  String get restoreNoPurchases => 'Walang nakitang dating pagbili.';

  @override
  String get hdrCodecSwitched =>
      'May nakitang HDR video — gagamit ng H.265 para sa video na ito upang mapanatili ang mga kulay.';

  @override
  String get themeTitle => 'Hitsura';

  @override
  String get themeSubtitle =>
      'Sundin ang system o pumili ng maliwanag o madilim na tema';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Maliwanag';

  @override
  String get themeDark => 'Madilim';

  @override
  String get targetBitrateEditTooltip => 'Ilagay ang bitrate';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Pinapayagang saklaw: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardware encoder (mabilis)';

  @override
  String get hwEncoderSubtitle =>
      'Mas mabilis, pero kailangan ng humigit-kumulang doble ng bitrate para sa parehong kalidad. Para lang sa bitrate mode.';

  @override
  String get hwEncoderHdrHint =>
      'HDR video — gagamitin ang software encoder sa conversion para mapanatili ang HDR.';

  @override
  String get hwEncoderFallback =>
      'Hindi gumana ang hardware encoder — ginagamit ang software encoder para sa conversion.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Hindi sinusuportahan ng hardware encoder ang $format — gagamitin ang software encoder sa conversion ng format na ito.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Na-off ang hardware encoder — bitrate mode lang ang sinusuportahan nito.';

  @override
  String get resolutionPresetLabel => 'Preset';

  @override
  String get resolutionOriginal => 'Orihinal';

  @override
  String get resolutionCustom => 'Pasadya';

  @override
  String get aspectRatioLabel => 'Aspect ratio';

  @override
  String get aspectOriginal => 'Orihinal';

  @override
  String get aspectCustom => 'Pasadya';

  @override
  String get fitModeLabel => 'Pagkasyahin';

  @override
  String get fitPad => 'Itim na bar';

  @override
  String get fitCrop => 'I-crop';

  @override
  String get fitStretch => 'I-stretch';

  @override
  String get fitModeInfoContent =>
      'Iba ang target na aspect ratio sa aspect ratio ng video.\n\nItim na bar → makikita pa rin ang buong larawan, pupunan ng mga itim na bar ang natitirang espasyo\nI-crop → kukunin ang gitnang bahagi, mawawala ang mga gilid\nI-stretch → mababago ang proporsyon ng larawan para punuin ang frame';

  @override
  String get deleteOriginal => 'I-delete ang orihinal';

  @override
  String get originalTrashed =>
      'Nailipat na ang orihinal sa trash — maaari mo itong ibalik mula roon.';

  @override
  String get originalTrashFailed => 'Hindi ma-delete ang orihinal.';

  @override
  String get burnInSubtitlesLabel => 'Magdagdag ng mga subtitle';

  @override
  String get burnInSubtitlesInfoContent =>
      'Permanente: Isinasama ang mga subtitle sa mismong larawan ng video. Makikita ang mga ito sa lahat ng player at hindi na puwedeng i-off. Sa mga video na nananatiling HDR, maaaring magmukhang napakaliwanag ang mga ito.\n\nOpsyonal: Idinadagdag ang mga subtitle bilang hiwalay na track na puwedeng i-on o i-off sa player. Hindi lahat ng player ay nagpapakita ng mga ito, at madalas na nawawala ang mga ito kapag ibinahagi ang video. Hindi available para sa AVI at MPEG-TS.\n\nSinusuportahan ang mga SRT at ASS file. Ganap na napapanatili ang estilo at mga posisyon ng ASS kapag Permanente ang mode at sa mga MKV file. Sa ibang format, bahagi lang ng estilo ang napapanatili at hindi ang mga posisyon.';

  @override
  String get subtitleModeBurnIn => 'Permanente';

  @override
  String get subtitleModeTrack => 'Opsyonal';

  @override
  String get subtitleTrackEmpty =>
      'Walang mga subtitle sa napiling bahagi ng video.';

  @override
  String get burnInSubtitlesSelect => 'Pumili ng SRT o ASS file';

  @override
  String get burnInSubtitlesRemove => 'Alisin ang subtitle file';

  @override
  String get burnInSubtitlesUnsupported => 'Pumili ng .srt o .ass file.';

  @override
  String get burnInSubtitlesInvalid =>
      'Hindi mabasa ang subtitle file na ito o wala itong wastong mga subtitle.';

  @override
  String get burnInSubtitlesMissing =>
      'Hindi na available ang subtitle file. Piliin ito ulit.';

  @override
  String get subtitleTextSizeLabel => 'Laki ng teksto';

  @override
  String get subtitleTextSizeSmall => 'Maliit';

  @override
  String get subtitleTextSizeMedium => 'Katamtaman';

  @override
  String get subtitleTextSizeLarge => 'Malaki';

  @override
  String get subtitlePositionLabel => 'Posisyon';

  @override
  String get subtitlePositionBottom => 'Ibaba';

  @override
  String get subtitlePositionTop => 'Itaas';

  @override
  String get subtitleBackgroundTitle => 'Kulay-abong background';
}
