// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get qualityLabel => 'Calitate';

  @override
  String get quality2160pHigh => '2160p Ridicată';

  @override
  String get quality2160pMedium => '2160p Medie';

  @override
  String get quality2160pLow => '2160p Scăzută';

  @override
  String get quality2160pVeryLow => '2160p Foarte scăzută';

  @override
  String get quality1440pHigh => '1440p Ridicată';

  @override
  String get quality1440pMedium => '1440p Medie';

  @override
  String get quality1440pLow => '1440p Scăzută';

  @override
  String get quality1440pVeryLow => '1440p Foarte scăzută';

  @override
  String get quality1080pHigh => '1080p Ridicată';

  @override
  String get quality1080pMedium => '1080p Medie';

  @override
  String get quality1080pLow => '1080p Scăzută';

  @override
  String get quality1080pVeryLow => '1080p Foarte scăzută';

  @override
  String get quality720pHigh => '720p Ridicată';

  @override
  String get quality720pMedium => '720p Medie';

  @override
  String get quality720pLow => '720p Scăzută';

  @override
  String get quality720pVeryLow => '720p Foarte scăzută';

  @override
  String get quality480pHigh => '480p Ridicată';

  @override
  String get quality480pMedium => '480p Medie';

  @override
  String get quality480pLow => '480p Scăzută';

  @override
  String get quality480pVeryLow => '480p Foarte scăzută';

  @override
  String get quality360pHigh => '360p Ridicată';

  @override
  String get quality360pMedium => '360p Medie';

  @override
  String get quality360pLow => '360p Scăzută';

  @override
  String get quality360pVeryLow => '360p Foarte scăzută';

  @override
  String get mute => 'Fără sunet';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Selectează un videoclip';

  @override
  String get videoLoading => 'Se încarcă videoclipul…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile => 'Selectează un fișier video valid.';

  @override
  String get fileLoadError =>
      'Fișierul nu a putut fi încărcat. Selectează un fișier video.';

  @override
  String get previewNotAvailable =>
      'Previzualizarea nu este disponibilă. Videoclipul poate fi totuși convertit.';

  @override
  String get previewNotAvailableLabel =>
      'Previzualizarea nu este disponibilă\n(Rezoluție prea mare pentru acest dispozitiv)';

  @override
  String get noVideoLoaded => 'Încarcă mai întâi un videoclip.';

  @override
  String get cancelConversionTitle => 'Anulezi conversia?';

  @override
  String get cancelConversionContent => 'Progresul conversiei se va pierde.';

  @override
  String get continueConversion => 'Continuă';

  @override
  String get cancel => 'Anulează';

  @override
  String get discardVideoTitle => 'Renunți la videoclip?';

  @override
  String get discardVideoContent =>
      'Videoclipul convertit va fi șters fără a fi salvat.';

  @override
  String get keep => 'Păstrează';

  @override
  String get discard => 'Renunță';

  @override
  String get save => 'Salvează';

  @override
  String get saveVideoDialogTitle => 'Salvează videoclipul';

  @override
  String get savedSuccess => 'Salvat!';

  @override
  String get open => 'Deschide';

  @override
  String get openGallery => 'Deschide galeria';

  @override
  String get openVideo => 'Deschide videoclipul';

  @override
  String get autoSaveTitle => 'Salvează automat videoclipurile în galerie';

  @override
  String get autoSaveSubtitle =>
      'Videoclipurile sunt salvate automat după conversie.';

  @override
  String get videoCodecTitle => 'Codec video';

  @override
  String get videoCodecSubtitle =>
      'Codec video pentru conversiile în modul normal';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC sau AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 oferă cea mai bună compatibilitate și, de obicei, conversii mai rapide.\n\nH.265/HEVC poate produce fișiere mai mici la o calitate vizuală comparabilă, dar conversia durează mai mult. Dispozitivele sau aplicațiile mai vechi s-ar putea să nu poată reda rezultatul.\n\nAV1 este un codec modern conceput pentru fișiere mici. Dispozitivele și aplicațiile mai vechi adesea nu pot reda rezultatul.\n\nToate codificatoarele sunt incluse în aplicație și nu depind de codecurile instalate pe dispozitiv.';

  @override
  String get saveError =>
      'Eroare la salvare. Este posibil să nu fie suficient spațiu de stocare.';

  @override
  String get saveErrorOutOfMemory =>
      'Memorie insuficientă pentru a salva acest fișier. Încearcă un clip mai scurt sau o calitate mai scăzută.';

  @override
  String get conversionDone => 'Gata!';

  @override
  String conversionProgress(String percent) {
    return 'Conversie: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Conversia a eșuat: $error';
  }

  @override
  String get settingsTitle => 'Setări';

  @override
  String get licensesTitle => 'Licențe';

  @override
  String get licensesSubtitle => 'Licențele cu sursă deschisă ale aplicației';

  @override
  String get gplLicenseTitle => 'Textul licenței GPL-3.0';

  @override
  String get sourceCodeTitle => 'Cod sursă (GitHub)';

  @override
  String get privacyPolicyTitle => 'Politica de confidențialitate';

  @override
  String get adConsentTitle => 'Setări de confidențialitate';

  @override
  String get imprintTitle => 'Informații legale';

  @override
  String get linkOpenError => 'Linkul nu a putut fi deschis.';

  @override
  String get muteTooltip => 'Despre eliminarea sunetului';

  @override
  String get muteInfoContent =>
      'Elimină complet sunetul din videoclipul convertit.\n\nUtil, de exemplu, pentru a elimina zgomotul de fundal sau a reduce dimensiunea fișierului.';

  @override
  String estimatedSize(String size) {
    return 'Dimensiune estimată: $size MB';
  }

  @override
  String get convertButton => 'Convertește';

  @override
  String get crfLabel => 'Calitate video (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Calitate video';

  @override
  String get crfInfoContent =>
      '0 → fără pierderi (fișier foarte mare)\n18 → aproape fără pierderi vizibile\n23 → standard (echilibru bun)\n28 → pierderi vizibile de calitate\n51 → cea mai scăzută calitate\n\nRecomandat: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → fără pierderi (fișier foarte mare)\n25 → aproape fără pierderi vizibile\n30 → standard (echilibru bun)\n38 → pierderi vizibile de calitate\n63 → cea mai scăzută calitate\n\nRecomandat: 25–38\n\nVP9 și AV1 folosesc o scară 0–63: aceeași valoare corespunde unei calități diferite față de H.264/H.265.';

  @override
  String get resolutionLabel => 'Rezoluție';

  @override
  String get resolutionInfoTitle => 'Rezoluții uzuale';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nSfat: Lasă un câmp gol = celălalt va fi calculat proporțional.';

  @override
  String get widthLabel => 'Lățime';

  @override
  String get heightLabel => 'Înălțime';

  @override
  String get emptyEqualsOriginal => 'Gol = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Cadre pe secundă';

  @override
  String get fpsInfoContent =>
      'Orig  → Păstrează FPS din videoclipul sursă\n24    → Standard cinematografic\n25    → Standard PAL/TV (Europa)\n30    → NTSC/TV, rețele sociale\n60    → Fluiditate, jocuri, sport';

  @override
  String get audioBitrateLabel => 'Rată de biți audio';

  @override
  String get silent => 'Fără sunet';

  @override
  String get audioBitrateInfoContent =>
      'Fără sunet   → fără audio\n64 kbps  → voce, podcasturi\n96 kbps  → calitate bună a vocii\n128 kbps → calitate standard pentru muzică\n192 kbps → calitate audio ridicată\n320 kbps → calitate MP3 maximă';

  @override
  String get audioCodecLabel => 'Codec audio';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → cea mai bună compatibilitate și, de obicei, codificare mai rapidă\nH.265 → fișiere mai mici la o calitate comparabilă, codificare mai lentă\nVP9 → codec deschis eficient pentru WebM și MKV, codificare software mai lentă\nAV1 → codec modern pentru fișiere mici, doar codificare software\nXvid → codec MPEG-4 vechi pentru AVI și playere mai vechi\n\nFormatele de ieșire de mai jos sunt activate în funcție de codecurile video și audio selectate.';

  @override
  String get xvidLegacyLabel => 'Xvid (vechi)';

  @override
  String get av1SlowHint =>
      'AV1 folosește doar codificare software și este mult mai lent decât H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Pentru rezoluții peste 720p, ia în calcul reducerea rezoluției mai întâi.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard pentru MP4, cea mai bună compatibilitate\nMP3 → codec vechi, folosit pe scară largă\nOpus → modern și eficient, ideal pentru WebM și MKV\nAC3 → Dolby Digital, afișat doar pentru surse surround (≥ 3 canale)\nVorbis → codec deschis pentru WebM și MKV\n\nFormatele de ieșire incompatibile sunt dezactivate automat.';

  @override
  String get outputFormatLabel => 'Format de ieșire';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, cea mai bună compatibilitate\nMKV → container flexibil pentru toate codecurile oferite\nMOV → fluxuri de lucru Apple/QuickTime\nAVI → format vechi care folosește Xvid\nMPEG-TS → flux de transport pentru TV și streaming\nWebM → format web modern care folosește VP9 cu Opus sau Vorbis\n\nFormatele incompatibile apar estompate. Selectarea unuia aplică automat codecul video implicit al acestuia și, dacă este necesar, un codec audio compatibil.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return 'Combinația $videoCodec + $audioCodec este acceptată de: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Formatul de ieșire a fost schimbat în $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Ce înseamnă rezoluțiile?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → fișier foarte mic,\nde exemplu, pentru WhatsApp\n\n480p  (854×480)   → definiție standard (SD)\n\n720p  (1280×720)  → HD, potrivit pentru dispozitive mobile\n\n1080p (1920×1080) → Full HD, standard pentru\n                          YouTube și TV\n\nRidicată/Medie/Scăzută descrie calitatea la aceeași rezoluție — mai ridicată = fișier mai mare.';

  @override
  String get resolutionTooltip => 'Despre rezoluții';

  @override
  String get trimArea => 'Interval de decupare';

  @override
  String trimStartLabel(String time) {
    return 'Început: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Sfârșit: $time';
  }

  @override
  String get adLoading => 'Se încarcă reclama…';

  @override
  String get convertedPrefix => 'convertit_';

  @override
  String get removeAdsTitle => 'Elimină reclamele';

  @override
  String removeAdsSubtitle(String price) {
    return 'Achiziție unică – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Fără reclame ✓';

  @override
  String get removeAdsActiveSubtitle => 'Îți mulțumim pentru susținere!';

  @override
  String get restorePurchasesTitle => 'Restabilește achiziția';

  @override
  String get purchaseButton => 'Cumpără';

  @override
  String get purchaseError => 'Achiziția a eșuat. Încearcă din nou.';

  @override
  String get purchaseSuccess => 'Mulțumim! Reclamele au fost dezactivate.';

  @override
  String get appName => 'Convertor video';

  @override
  String get audioOnly => 'Doar audio';

  @override
  String get audioOnlyTooltip => 'Despre extragerea sunetului';

  @override
  String get audioOnlyInfoContent =>
      'Extrage doar pista audio din videoclip — fără imagine.\n\nMod normal: MP3 la 192 kbps.\nMod expert: Codecul și rata de biți din setările audio.\n\nUtil, de exemplu, pentru a salva muzică sau podcasturi din videoclipuri.';

  @override
  String get aspectLocked => 'Raport de aspect blocat';

  @override
  String get aspectUnlocked => 'Raport de aspect deblocat';

  @override
  String get cpuWarningTitle => 'Fișier mare';

  @override
  String get cpuWarningContent =>
      'Acest videoclip durează mai mult de 5 minute. Pe dispozitivele mai vechi, conversia poate solicita intens procesorul — este normal.\n\nPoți lăsa telefonul deoparte; aplicația va continua să ruleze în fundal.';

  @override
  String get cpuWarningCheckbox => 'Nu mai afișa';

  @override
  String get storageWarningTitle => 'Spațiu de stocare insuficient';

  @override
  String storageWarningContent(String available, String required) {
    return 'Dispozitivul tău mai are doar $available MB liberi. Conversia necesită aproximativ $required MB. Eliberează mai întâi spațiu.';
  }

  @override
  String get feedbackTitle => 'Feedback și asistență';

  @override
  String get feedbackSubtitle => 'Trimite erori, sugestii sau feedback';

  @override
  String get feedbackCategoryLabel => 'Categorie';

  @override
  String get feedbackCategoryBug => 'Raportează o eroare';

  @override
  String get feedbackCategoryFeature => 'Propune o funcție';

  @override
  String get feedbackCategoryFeedback => 'Feedback general';

  @override
  String get feedbackMessageHint => 'Descrie problema…';

  @override
  String get feedbackSendButton => 'Trimite';

  @override
  String get notificationPermissionTitle => 'Conversie în fundal';

  @override
  String get notificationPermissionContent =>
      'Permite notificările pentru ca procesul de conversie să continue în timp ce folosești alte aplicații. Altfel, aplicația trebuie să rămână deschisă.';

  @override
  String get notificationPermissionNotNow => 'Nu acum';

  @override
  String get notificationPermissionAllow => 'Permite';

  @override
  String get notificationPermissionDenied =>
      'Activează notificările din Setări pentru a converti în fundal.';

  @override
  String get notificationPermissionOpenSettings => 'Setări';

  @override
  String get backButton => 'Înapoi';

  @override
  String get appSettingsTitle => 'Setările aplicației';

  @override
  String get appSettingsSubtitle =>
      'Salvare automată și setări de confidențialitate';

  @override
  String get openSourceTitle => 'Sursă deschisă';

  @override
  String get openSourceSubtitle => 'Licențe și cod sursă';

  @override
  String get openSourceLicensesTitle => 'Licențe cu sursă deschisă';

  @override
  String get legalSectionTitle => 'Informații legale';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Mod de codificare';

  @override
  String get encodingModeCrf => 'Calitate (CRF)';

  @override
  String get encodingModeBitrate => 'Rată de biți';

  @override
  String get audioChannelsLabel => 'Canale audio';

  @override
  String get audioChannelsInfoContent =>
      'Original → păstrează configurația canalelor sursei\nStereo → 2.0 (cu reducerea numărului de canale, dacă este necesar)\nMono → 1 canal (cel mai mic fișier)\n5.1 → surround pe 6 canale (doar pentru surse surround)\n\nConversia la mai puține canale (de exemplu, 5.1 → Stereo) este acceptată. Conversia la mai multe canale nu este disponibilă.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Rată de biți țintă';

  @override
  String get targetBitrateInfoTitle => 'Rată de biți țintă';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → comprimare puternică, aplicații de mesagerie\n4–8 Mbps → calitate standard/bună la 1080p\n12 Mbps → calitate ridicată la 1080p / calitate scăzută la 4K\n20 Mbps → calitate de streaming 4K\n\nValoare personalizată: folosește pictograma creion (500–100000 kbps)\n\nSpre deosebire de CRF, calitatea poate varia de la o scenă la alta. Folosește CRF pentru rezultate mai bune la aceeași dimensiune a fișierului.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 și AV1 ating aceeași calitate la aproximativ jumătate din aceste rate de biți.';

  @override
  String get rateAppTitle => 'Evaluează aplicația';

  @override
  String get proHintTitle => 'Folosește fără reclame';

  @override
  String get proHintBody =>
      'Printr-o achiziție unică, poți elimina definitiv reclamele din aplicație.';

  @override
  String get proHintLater => 'Mai târziu';

  @override
  String get restoreError =>
      'Achizițiile nu au putut fi restabilite. Magazinul Play este momentan indisponibil — încearcă din nou.';

  @override
  String get restoreNoPurchases => 'Nu s-au găsit achiziții anterioare.';

  @override
  String get hdrCodecSwitched =>
      'Videoclip HDR detectat — se folosește H.265 pentru acest videoclip, pentru a păstra culorile.';

  @override
  String get themeTitle => 'Aspect';

  @override
  String get themeSubtitle =>
      'Urmează setarea sistemului sau alege o temă luminoasă ori întunecată';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Luminoasă';

  @override
  String get themeDark => 'Întunecată';

  @override
  String get targetBitrateEditTooltip => 'Introdu rata de biți';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Interval permis: $range';
  }

  @override
  String get hwEncoderTitle => 'Codificator hardware (rapid)';

  @override
  String get hwEncoderSubtitle =>
      'Mult mai rapid, dar necesită aproximativ dublul ratei de biți pentru aceeași calitate. Doar în modul Rată de biți.';

  @override
  String get hwEncoderHdrHint =>
      'Videoclip HDR — va fi convertit cu codificatorul software pentru a păstra HDR.';

  @override
  String get hwEncoderFallback =>
      'Codificatorul hardware a eșuat — conversia se face cu codificatorul software.';

  @override
  String hwEncoderContainerHint(String format) {
    return '$format nu este acceptat de codificatorul hardware — acest format va fi convertit cu codificatorul software.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Codificatorul hardware a fost dezactivat — acceptă doar modul Rată de biți.';

  @override
  String get resolutionPresetLabel => 'Presetare';

  @override
  String get resolutionOriginal => 'Originală';

  @override
  String get resolutionCustom => 'Personalizată';

  @override
  String get aspectRatioLabel => 'Raport de aspect';

  @override
  String get aspectOriginal => 'Original';

  @override
  String get aspectCustom => 'Personalizat';

  @override
  String get fitModeLabel => 'Ajustare';

  @override
  String get fitPad => 'Benzi';

  @override
  String get fitCrop => 'Decupare';

  @override
  String get fitStretch => 'Întindere';

  @override
  String get fitModeInfoContent =>
      'Raportul de aspect țintă diferă de cel al videoclipului.\n\nBenzi → întreaga imagine rămâne vizibilă, iar restul este completat cu benzi negre\nDecupare → se păstrează zona centrală, iar marginile se pierd\nÎntindere → imaginea este deformată pentru a umple cadrul';

  @override
  String get deleteOriginal => 'Șterge originalul';

  @override
  String get originalTrashed =>
      'Originalul a fost mutat în coșul de gunoi — îl poți restabili de acolo.';

  @override
  String get originalTrashFailed => 'Originalul nu a putut fi șters.';

  @override
  String get burnInSubtitlesLabel => 'Adaugă subtitrări';

  @override
  String get burnInSubtitlesInfoContent =>
      'Permanente: Subtitrările sunt imprimate în imaginea videoclipului. Sunt vizibile în orice player și nu pot fi dezactivate ulterior. În videoclipurile care rămân în HDR, pot părea foarte luminoase.\n\nOpționale: Subtitrările sunt adăugate ca pistă separată, care poate fi activată sau dezactivată în player. Nu toate playerele le afișează și se pierd adesea când videoclipul este partajat. Indisponibile pentru AVI și MPEG-TS.\n\nAcceptă fișiere SRT și ASS. Stilurile și pozițiile ASS sunt păstrate integral cu opțiunea Permanente și în fișierele MKV. Celelalte formate păstrează doar o parte din stiluri, fără poziții.';

  @override
  String get subtitleModeBurnIn => 'Permanente';

  @override
  String get subtitleModeTrack => 'Opționale';

  @override
  String get subtitleTrackEmpty =>
      'Nu există subtitrări în porțiunea selectată a videoclipului.';

  @override
  String get burnInSubtitlesSelect => 'Selectează un fișier SRT sau ASS';

  @override
  String get burnInSubtitlesRemove => 'Elimină fișierul de subtitrări';

  @override
  String get burnInSubtitlesUnsupported =>
      'Selectează un fișier .srt sau .ass.';

  @override
  String get burnInSubtitlesInvalid =>
      'Acest fișier de subtitrări nu a putut fi citit sau nu conține subtitrări valide.';

  @override
  String get burnInSubtitlesMissing =>
      'Fișierul de subtitrări nu mai este disponibil. Selectează-l din nou.';

  @override
  String get subtitleTextSizeLabel => 'Dimensiune text';

  @override
  String get subtitleTextSizeSmall => 'Mică';

  @override
  String get subtitleTextSizeMedium => 'Medie';

  @override
  String get subtitleTextSizeLarge => 'Mare';

  @override
  String get subtitlePositionLabel => 'Poziție';

  @override
  String get subtitlePositionBottom => 'Jos';

  @override
  String get subtitlePositionTop => 'Sus';

  @override
  String get subtitleBackgroundTitle => 'Fundal gri';
}
