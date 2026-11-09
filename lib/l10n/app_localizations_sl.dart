// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get qualityLabel => 'Kakovost';

  @override
  String get quality2160pHigh => '2160p Visoka';

  @override
  String get quality2160pMedium => '2160p Srednja';

  @override
  String get quality2160pLow => '2160p Nizka';

  @override
  String get quality2160pVeryLow => '2160p Zelo nizka';

  @override
  String get quality1440pHigh => '1440p Visoka';

  @override
  String get quality1440pMedium => '1440p Srednja';

  @override
  String get quality1440pLow => '1440p Nizka';

  @override
  String get quality1440pVeryLow => '1440p Zelo nizka';

  @override
  String get quality1080pHigh => '1080p Visoka';

  @override
  String get quality1080pMedium => '1080p Srednja';

  @override
  String get quality1080pLow => '1080p Nizka';

  @override
  String get quality1080pVeryLow => '1080p Zelo nizka';

  @override
  String get quality720pHigh => '720p Visoka';

  @override
  String get quality720pMedium => '720p Srednja';

  @override
  String get quality720pLow => '720p Nizka';

  @override
  String get quality720pVeryLow => '720p Zelo nizka';

  @override
  String get quality480pHigh => '480p Visoka';

  @override
  String get quality480pMedium => '480p Srednja';

  @override
  String get quality480pLow => '480p Nizka';

  @override
  String get quality480pVeryLow => '480p Zelo nizka';

  @override
  String get quality360pHigh => '360p Visoka';

  @override
  String get quality360pMedium => '360p Srednja';

  @override
  String get quality360pLow => '360p Nizka';

  @override
  String get quality360pVeryLow => '360p Zelo nizka';

  @override
  String get mute => 'Odstrani zvok';

  @override
  String get ok => 'V redu';

  @override
  String get selectVideo => 'Izberi videoposnetek';

  @override
  String get videoLoading => 'Nalaganje videoposnetka…';

  @override
  String get modeNormal => 'Običajni';

  @override
  String get modeExpert => 'Napredni';

  @override
  String get invalidVideoFile => 'Izberite veljavno videodatoteko.';

  @override
  String get fileLoadError =>
      'Datoteke ni bilo mogoče naložiti. Izberite videodatoteko.';

  @override
  String get previewNotAvailable =>
      'Predogled ni na voljo. Videoposnetek lahko vseeno pretvorite.';

  @override
  String get previewNotAvailableLabel =>
      'Predogled ni na voljo\n(Ločljivost je previsoka za to napravo)';

  @override
  String get noVideoLoaded => 'Najprej naložite videoposnetek.';

  @override
  String get cancelConversionTitle => 'Prekličete pretvorbo?';

  @override
  String get cancelConversionContent => 'Napredek pretvorbe bo izgubljen.';

  @override
  String get continueConversion => 'Nadaljuj';

  @override
  String get cancel => 'Prekliči';

  @override
  String get discardVideoTitle => 'Zavržete videoposnetek?';

  @override
  String get discardVideoContent =>
      'Pretvorjeni videoposnetek bo izbrisan in se ne bo shranil.';

  @override
  String get keep => 'Obdrži';

  @override
  String get discard => 'Zavrzi';

  @override
  String get save => 'Shrani';

  @override
  String get saveVideoDialogTitle => 'Shrani videoposnetek';

  @override
  String get savedSuccess => 'Shranjeno!';

  @override
  String get open => 'Odpri';

  @override
  String get openGallery => 'Odpri galerijo';

  @override
  String get openVideo => 'Odpri videoposnetek';

  @override
  String get autoSaveTitle =>
      'Samodejno shranjevanje videoposnetkov v galerijo';

  @override
  String get autoSaveSubtitle =>
      'Videoposnetki se po pretvorbi samodejno shranijo.';

  @override
  String get videoCodecTitle => 'Videokodek';

  @override
  String get videoCodecSubtitle => 'Videokodek za pretvorbe v običajnem načinu';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC ali AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 ponuja najboljšo združljivost in običajno hitrejšo pretvorbo.\n\nH.265/HEVC lahko ustvari manjše datoteke pri primerljivi kakovosti slike, vendar pretvorba traja dlje. Starejše naprave ali aplikacije morda ne bodo mogle predvajati rezultata.\n\nAV1 je sodoben kodek, zasnovan za majhne datoteke. Starejše naprave in aplikacije pogosto ne morejo predvajati rezultata.\n\nVsi kodirniki so vključeni v aplikacijo in niso odvisni od kodekov, nameščenih v napravi.';

  @override
  String get saveError =>
      'Napaka pri shranjevanju. Morda ni dovolj prostora za shranjevanje.';

  @override
  String get saveErrorOutOfMemory =>
      'Za shranjevanje te datoteke ni dovolj pomnilnika. Poskusite s krajšim izsekom ali nižjo kakovostjo.';

  @override
  String get conversionDone => 'Končano!';

  @override
  String conversionProgress(String percent) {
    return 'Pretvarjanje: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Pretvorba ni uspela: $error';
  }

  @override
  String get settingsTitle => 'Nastavitve';

  @override
  String get licensesTitle => 'Licence';

  @override
  String get licensesSubtitle => 'Odprtokodne licence te aplikacije';

  @override
  String get gplLicenseTitle => 'Besedilo licence GPL-3.0';

  @override
  String get sourceCodeTitle => 'Izvorna koda (GitHub)';

  @override
  String get privacyPolicyTitle => 'Pravilnik o zasebnosti';

  @override
  String get adConsentTitle => 'Nastavitve zasebnosti';

  @override
  String get imprintTitle => 'Podatki o izdajatelju';

  @override
  String get linkOpenError => 'Povezave ni bilo mogoče odpreti.';

  @override
  String get muteTooltip => 'Pojasnilo odstranjevanja zvoka';

  @override
  String get muteInfoContent =>
      'Iz pretvorjenega videoposnetka povsem odstrani zvok.\n\nUporabno na primer za odstranjevanje hrupa v ozadju ali zmanjšanje velikosti datoteke.';

  @override
  String estimatedSize(String size) {
    return 'Ocenjena velikost: $size MB';
  }

  @override
  String get convertButton => 'Pretvori';

  @override
  String get crfLabel => 'Kakovost videa (CRF)';

  @override
  String get crfInfoTitle => 'CRF — kakovost videa';

  @override
  String get crfInfoContent =>
      '0 → brez izgub (zelo velika datoteka)\n18 → skoraj brez vidnih izgub\n23 → standardno (dobro ravnovesje)\n28 → vidna izguba kakovosti\n51 → najnižja kakovost\n\nPriporočeno: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → brez izgub (zelo velika datoteka)\n25 → skoraj brez vidnih izgub\n30 → standardno (dobro ravnovesje)\n38 → vidna izguba kakovosti\n63 → najnižja kakovost\n\nPriporočeno: 25–38\n\nVP9 in AV1 uporabljata lestvico 0–63: ista vrednost pomeni drugačno kakovost kot pri H.264/H.265.';

  @override
  String get resolutionLabel => 'Ločljivost';

  @override
  String get resolutionInfoTitle => 'Pogoste ločljivosti';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nNasvet: Pustite eno polje prazno = druga vrednost se izračuna sorazmerno.';

  @override
  String get widthLabel => 'Širina';

  @override
  String get heightLabel => 'Višina';

  @override
  String get emptyEqualsOriginal => 'Prazno = izvirno';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Sličice na sekundo';

  @override
  String get fpsInfoContent =>
      'Izvirno → Ohrani hitrost sličic izvornega videoposnetka\n24    → Filmski standard\n25    → Standard PAL/TV (Evropa)\n30    → NTSC/TV, družbena omrežja\n60    → Tekoče predvajanje, igre, šport';

  @override
  String get audioBitrateLabel => 'Bitna hitrost zvoka';

  @override
  String get silent => 'Brez zvoka';

  @override
  String get audioBitrateInfoContent =>
      'Brez zvoka → brez zvočne steze\n64 kbps  → govor, podkasti\n96 kbps  → dobra kakovost govora\n128 kbps → standardna kakovost glasbe\n192 kbps → visoka kakovost zvoka\n320 kbps → najvišja kakovost MP3';

  @override
  String get audioCodecLabel => 'Zvočni kodek';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → najboljša združljivost in običajno hitrejše kodiranje\nH.265 → manjše datoteke pri primerljivi kakovosti, počasnejše kodiranje\nVP9 → učinkovit odprt kodek za WebM in MKV, počasnejše programsko kodiranje\nAV1 → sodoben kodek za majhne datoteke, samo programsko kodiranje\nXvid → starejši kodek MPEG-4 za AVI in starejše predvajalnike\n\nSpodnji izhodni formati so na voljo glede na izbrana videokodek in zvočni kodek.';

  @override
  String get xvidLegacyLabel => 'Xvid (starejši)';

  @override
  String get av1SlowHint =>
      'AV1 uporablja samo programsko kodiranje in je precej počasnejši od H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Pri ločljivostih nad 720p razmislite o predhodnem zmanjšanju ločljivosti.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard za MP4, najboljša združljivost\nMP3 → razširjen starejši kodek\nOpus → sodoben in učinkovit, idealen za WebM in MKV\nAC3 → Dolby Digital, prikazan samo pri virih s prostorskim zvokom (≥ 3 kanali)\nVorbis → odprt kodek za WebM in MKV\n\nNezdružljivi izhodni formati se samodejno onemogočijo.';

  @override
  String get outputFormatLabel => 'Izhodni format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → univerzalen, najboljša združljivost\nMKV → prilagodljiv vsebnik za vse ponujene kodeke\nMOV → delo z Apple/QuickTime\nAVI → starejši format s kodekom Xvid\nMPEG-TS → prenosni tok za TV in pretočno predvajanje\nWebM → sodoben spletni format z VP9 in Opus ali Vorbis\n\nNezdružljivi formati so zatemnjeni. Če izberete tak format, se samodejno uporabita njegov privzeti videokodek in po potrebi združljiv zvočni kodek.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec podpirajo: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Izhodni format je spremenjen v $format.';
  }

  @override
  String get orig => 'Izvirno';

  @override
  String get resolutionExplainTitle => 'Kaj pomenijo ločljivosti?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → zelo majhna datoteka,\nna primer za WhatsApp\n\n480p  (854×480)   → standardna ločljivost (SD)\n\n720p  (1280×720)  → HD, primerno za mobilne naprave\n\n1080p (1920×1080) → Full HD, standard za\n                          YouTube in TV\n\nVisoka/Srednja/Nizka označuje kakovost pri isti ločljivosti — višja = večja datoteka.';

  @override
  String get resolutionTooltip => 'Pojasnilo ločljivosti';

  @override
  String get trimArea => 'Obseg obrezovanja';

  @override
  String trimStartLabel(String time) {
    return 'Začetek: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Konec: $time';
  }

  @override
  String get adLoading => 'Nalaganje oglasa…';

  @override
  String get convertedPrefix => 'pretvorjeno_';

  @override
  String get removeAdsTitle => 'Odstrani oglase';

  @override
  String removeAdsSubtitle(String price) {
    return 'Enkratni nakup – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Brez oglasov ✓';

  @override
  String get removeAdsActiveSubtitle => 'Hvala za podporo!';

  @override
  String get restorePurchasesTitle => 'Obnovi nakup';

  @override
  String get purchaseButton => 'Kupi';

  @override
  String get purchaseError => 'Nakup ni uspel. Poskusite znova.';

  @override
  String get purchaseSuccess => 'Hvala! Oglasi so onemogočeni.';

  @override
  String get appName => 'Pretvorba videa';

  @override
  String get audioOnly => 'Samo zvok';

  @override
  String get audioOnlyTooltip => 'Pojasnilo možnosti Samo zvok';

  @override
  String get audioOnlyInfoContent =>
      'Iz videoposnetka izlušči samo zvočno stezo — brez slike.\n\nObičajni način: MP3 pri 192 kbps.\nNapredni način: kodek in bitna hitrost iz zvočnih nastavitev.\n\nUporabno na primer za shranjevanje glasbe ali podkastov iz videoposnetkov.';

  @override
  String get aspectLocked => 'Razmerje stranic je zaklenjeno';

  @override
  String get aspectUnlocked => 'Razmerje stranic je odklenjeno';

  @override
  String get cpuWarningTitle => 'Velika datoteka';

  @override
  String get cpuWarningContent =>
      'Ta videoposnetek je daljši od 5 minut. Na starejših napravah lahko pretvorba močno obremeni procesor — to je običajno.\n\nTelefon lahko odložite; aplikacija bo še naprej delovala v ozadju.';

  @override
  String get cpuWarningCheckbox => 'Ne prikaži več';

  @override
  String get storageWarningTitle => 'Ni dovolj prostora za shranjevanje';

  @override
  String storageWarningContent(String available, String required) {
    return 'V napravi je na voljo le še $available MB prostora. Pretvorba potrebuje približno $required MB. Najprej sprostite nekaj prostora.';
  }

  @override
  String get feedbackTitle => 'Povratne informacije in podpora';

  @override
  String get feedbackSubtitle =>
      'Pošljite poročilo o napaki, predlog ali povratne informacije';

  @override
  String get feedbackCategoryLabel => 'Kategorija';

  @override
  String get feedbackCategoryBug => 'Prijava napake';

  @override
  String get feedbackCategoryFeature => 'Predlog funkcije';

  @override
  String get feedbackCategoryFeedback => 'Splošne povratne informacije';

  @override
  String get feedbackMessageHint => 'Opišite težavo…';

  @override
  String get feedbackSendButton => 'Pošlji';

  @override
  String get notificationPermissionTitle => 'Pretvarjanje v ozadju';

  @override
  String get notificationPermissionContent =>
      'Dovolite obvestila, da se pretvorba lahko nadaljuje med uporabo drugih aplikacij. Brez tega mora aplikacija ostati odprta.';

  @override
  String get notificationPermissionNotNow => 'Ne zdaj';

  @override
  String get notificationPermissionAllow => 'Dovoli';

  @override
  String get notificationPermissionDenied =>
      'Za pretvarjanje v ozadju omogočite obvestila v nastavitvah.';

  @override
  String get notificationPermissionOpenSettings => 'Nastavitve';

  @override
  String get backButton => 'Nazaj';

  @override
  String get appSettingsTitle => 'Nastavitve aplikacije';

  @override
  String get appSettingsSubtitle =>
      'Samodejno shranjevanje in nastavitve zasebnosti';

  @override
  String get openSourceTitle => 'Odprta izvorna koda';

  @override
  String get openSourceSubtitle => 'Licence in izvorna koda';

  @override
  String get openSourceLicensesTitle => 'Odprtokodne licence';

  @override
  String get legalSectionTitle => 'Pravne informacije';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Način kodiranja';

  @override
  String get encodingModeCrf => 'Kakovost (CRF)';

  @override
  String get encodingModeBitrate => 'Bitna hitrost';

  @override
  String get audioChannelsLabel => 'Zvočni kanali';

  @override
  String get audioChannelsInfoContent =>
      'Izvirno → ohrani izvorno razporeditev kanalov\nStereo → 2.0 (po potrebi združevanje kanalov)\nMono → 1 kanal (najmanjša datoteka)\n5.1 → 6-kanalni prostorski zvok (samo za vire s prostorskim zvokom)\n\nZdruževanje v manj kanalov (npr. 5.1 → Stereo) je podprto. Povečanje števila kanalov ni na voljo.';

  @override
  String get audioChannelOriginal => 'Izvirno';

  @override
  String get targetBitrateLabel => 'Ciljna bitna hitrost';

  @override
  String get targetBitrateInfoTitle => 'Ciljna bitna hitrost';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → močno stiskanje, aplikacije za sporočanje\n4–8 Mbps → standardna/dobra kakovost pri 1080p\n12 Mbps → visoka kakovost pri 1080p / nizka kakovost pri 4K\n20 Mbps → kakovost pretočnega predvajanja v 4K\n\nVrednost po meri: uporabite ikono svinčnika (500–100000 kbps)\n\nZa razliko od CRF se kakovost lahko spreminja glede na prizor. Za boljše rezultate pri isti velikosti datoteke uporabite CRF.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 in AV1 dosežeta isto kakovost pri približno polovici teh bitnih hitrosti.';

  @override
  String get rateAppTitle => 'Oceni aplikacijo';

  @override
  String get proHintTitle => 'Uporaba brez oglasov';

  @override
  String get proHintBody =>
      'Z enkratnim nakupom lahko trajno odstranite oglase iz aplikacije.';

  @override
  String get proHintLater => 'Pozneje';

  @override
  String get restoreError =>
      'Nakupov ni bilo mogoče obnoviti. Trgovina Play trenutno ni na voljo — poskusite znova.';

  @override
  String get restoreNoPurchases => 'Najden ni bil noben prejšnji nakup.';

  @override
  String get hdrCodecSwitched =>
      'Zaznan je videoposnetek HDR — za ta videoposnetek se bo uporabil H.265, da se ohranijo barve.';

  @override
  String get themeTitle => 'Videz';

  @override
  String get themeSubtitle =>
      'Sledite sistemu ali izberite svetlo ali temno temo';

  @override
  String get themeSystem => 'Sistemska';

  @override
  String get themeLight => 'Svetla';

  @override
  String get themeDark => 'Temna';

  @override
  String get targetBitrateEditTooltip => 'Vnesi bitno hitrost';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Dovoljeni razpon: $range';
  }

  @override
  String get hwEncoderTitle => 'Strojni kodirnik (hiter)';

  @override
  String get hwEncoderSubtitle =>
      'Precej hitrejši, vendar za isto kakovost potrebuje približno dvakrat višjo bitno hitrost. Samo v načinu bitne hitrosti.';

  @override
  String get hwEncoderHdrHint =>
      'Videoposnetek HDR — za ohranitev HDR se bo pretvoril s programskim kodirnikom.';

  @override
  String get hwEncoderFallback =>
      'Napaka strojnega kodirnika — pretvorba se nadaljuje s programskim kodirnikom.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Strojni kodirnik ne podpira formata $format — ta format se bo pretvoril s programskim kodirnikom.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Strojni kodirnik je izklopljen — podpira samo način bitne hitrosti.';

  @override
  String get resolutionPresetLabel => 'Prednastavitev';

  @override
  String get resolutionOriginal => 'Izvirna';

  @override
  String get resolutionCustom => 'Po meri';

  @override
  String get aspectRatioLabel => 'Razmerje stranic';

  @override
  String get aspectOriginal => 'Izvirno';

  @override
  String get aspectCustom => 'Po meri';

  @override
  String get fitModeLabel => 'Prilagoditev';

  @override
  String get fitPad => 'Črni robovi';

  @override
  String get fitCrop => 'Obrezovanje';

  @override
  String get fitStretch => 'Raztezanje';

  @override
  String get fitModeInfoContent =>
      'Ciljno razmerje stranic se razlikuje od razmerja videoposnetka.\n\nČrni robovi → celotna slika ostane vidna, preostanek zapolnijo črni robovi\nObrezovanje → ohrani se sredinski izrez, robovi se izgubijo\nRaztezanje → slika se popači, da zapolni okvir';

  @override
  String get deleteOriginal => 'Izbriši izvirnik';

  @override
  String get originalTrashed =>
      'Izvirnik je premaknjen v koš — od tam ga lahko obnovite.';

  @override
  String get originalTrashFailed => 'Izvirnika ni bilo mogoče izbrisati.';

  @override
  String get burnInSubtitlesLabel => 'Dodaj podnapise';

  @override
  String get burnInSubtitlesInfoContent =>
      'Trajni: Podnapisi so trajno vdelani v sliko videoposnetka. Vidni so v vsakem predvajalniku in jih pozneje ni mogoče izklopiti. Pri videoposnetkih, ki ostanejo v HDR, so lahko videti zelo svetli.\n\nPreklopni: Podnapisi so dodani kot ločena steza, ki jo lahko v predvajalniku vklopite ali izklopite. Nekateri predvajalniki jih ne prikažejo, pri deljenju videoposnetka pa se pogosto izgubijo. Ni na voljo za AVI in MPEG-TS.\n\nPodprte so datoteke SRT in ASS. Oblikovanje in položaji iz datotek ASS se v celoti ohranijo v načinu Trajni in v datotekah MKV. Drugi formati ohranijo le del oblikovanja, položajev pa ne.';

  @override
  String get subtitleModeBurnIn => 'Trajni';

  @override
  String get subtitleModeTrack => 'Preklopni';

  @override
  String get subtitleTrackEmpty =>
      'V izbranem delu videoposnetka ni podnapisov.';

  @override
  String get sharedVideoBusy =>
      'Najprej dokončajte trenutno pretvorbo, nato znova delite videoposnetek.';

  @override
  String get burnInSubtitlesSelect => 'Izberi datoteko SRT ali ASS';

  @override
  String get burnInSubtitlesRemove => 'Odstrani datoteko s podnapisi';

  @override
  String get burnInSubtitlesUnsupported => 'Izberite datoteko .srt ali .ass.';

  @override
  String get burnInSubtitlesInvalid =>
      'Te datoteke s podnapisi ni bilo mogoče prebrati ali pa ne vsebuje veljavnih podnapisov.';

  @override
  String get burnInSubtitlesMissing =>
      'Datoteka s podnapisi ni več na voljo. Izberite jo znova.';

  @override
  String get subtitleTextSizeLabel => 'Velikost besedila';

  @override
  String get subtitleTextSizeSmall => 'Majhna';

  @override
  String get subtitleTextSizeMedium => 'Srednja';

  @override
  String get subtitleTextSizeLarge => 'Velika';

  @override
  String get subtitlePositionLabel => 'Položaj';

  @override
  String get subtitlePositionBottom => 'Spodaj';

  @override
  String get subtitlePositionTop => 'Zgoraj';

  @override
  String get subtitleBackgroundTitle => 'Sivo ozadje';
}
