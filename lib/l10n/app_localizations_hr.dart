// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get qualityLabel => 'Kvaliteta';

  @override
  String get quality2160pHigh => '2160p Visoka';

  @override
  String get quality2160pMedium => '2160p Srednja';

  @override
  String get quality2160pLow => '2160p Niska';

  @override
  String get quality2160pVeryLow => '2160p Vrlo niska';

  @override
  String get quality1440pHigh => '1440p Visoka';

  @override
  String get quality1440pMedium => '1440p Srednja';

  @override
  String get quality1440pLow => '1440p Niska';

  @override
  String get quality1440pVeryLow => '1440p Vrlo niska';

  @override
  String get quality1080pHigh => '1080p Visoka';

  @override
  String get quality1080pMedium => '1080p Srednja';

  @override
  String get quality1080pLow => '1080p Niska';

  @override
  String get quality1080pVeryLow => '1080p Vrlo niska';

  @override
  String get quality720pHigh => '720p Visoka';

  @override
  String get quality720pMedium => '720p Srednja';

  @override
  String get quality720pLow => '720p Niska';

  @override
  String get quality720pVeryLow => '720p Vrlo niska';

  @override
  String get quality480pHigh => '480p Visoka';

  @override
  String get quality480pMedium => '480p Srednja';

  @override
  String get quality480pLow => '480p Niska';

  @override
  String get quality480pVeryLow => '480p Vrlo niska';

  @override
  String get quality360pHigh => '360p Visoka';

  @override
  String get quality360pMedium => '360p Srednja';

  @override
  String get quality360pLow => '360p Niska';

  @override
  String get quality360pVeryLow => '360p Vrlo niska';

  @override
  String get mute => 'Ukloni zvuk';

  @override
  String get ok => 'U redu';

  @override
  String get selectVideo => 'Odaberi videozapis';

  @override
  String get videoLoading => 'Učitavanje videozapisa…';

  @override
  String get modeNormal => 'Uobičajeni';

  @override
  String get modeExpert => 'Stručni';

  @override
  String get invalidVideoFile => 'Odaberite valjanu videodatoteku.';

  @override
  String get fileLoadError =>
      'Datoteku nije moguće učitati. Odaberite videodatoteku.';

  @override
  String get previewNotAvailable =>
      'Pretpregled nije dostupan. Videozapis se i dalje može pretvoriti.';

  @override
  String get previewNotAvailableLabel =>
      'Pretpregled nije dostupan\n(Razlučivost je previsoka za ovaj uređaj)';

  @override
  String get noVideoLoaded => 'Najprije učitajte videozapis.';

  @override
  String get cancelConversionTitle => 'Prekinuti pretvorbu?';

  @override
  String get cancelConversionContent => 'Napredak pretvorbe bit će izgubljen.';

  @override
  String get continueConversion => 'Nastavi';

  @override
  String get cancel => 'Odustani';

  @override
  String get discardVideoTitle => 'Odbaciti videozapis?';

  @override
  String get discardVideoContent =>
      'Pretvoreni videozapis bit će izbrisan i neće se spremiti.';

  @override
  String get keep => 'Zadrži';

  @override
  String get discard => 'Odbaci';

  @override
  String get save => 'Spremi';

  @override
  String get saveVideoDialogTitle => 'Spremi videozapis';

  @override
  String get savedSuccess => 'Spremljeno!';

  @override
  String get open => 'Otvori';

  @override
  String get openGallery => 'Otvori galeriju';

  @override
  String get openVideo => 'Otvori videozapis';

  @override
  String get autoSaveTitle => 'Automatski spremaj videozapise u galeriju';

  @override
  String get autoSaveSubtitle =>
      'Videozapisi se automatski spremaju nakon pretvorbe.';

  @override
  String get videoCodecTitle => 'Videokodek';

  @override
  String get videoCodecSubtitle =>
      'Videokodek za pretvorbe u uobičajenom načinu rada';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC ili AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 nudi najbolju kompatibilnost i obično bržu pretvorbu.\n\nH.265/HEVC može stvoriti manje datoteke uz usporedivu kvalitetu slike, ali pretvorba traje dulje. Stariji uređaji ili aplikacije možda neće moći reproducirati rezultat.\n\nAV1 je moderan kodek osmišljen za male datoteke. Stariji uređaji i aplikacije često ne mogu reproducirati rezultat.\n\nSvi su koderi uključeni u aplikaciju i ne ovise o kodecima instaliranima na uređaju.';

  @override
  String get saveError =>
      'Pogreška pri spremanju. Možda nema dovoljno prostora za pohranu.';

  @override
  String get saveErrorOutOfMemory =>
      'Nema dovoljno memorije za spremanje ove datoteke. Pokušajte s kraćim isječkom ili nižom kvalitetom.';

  @override
  String get conversionDone => 'Gotovo!';

  @override
  String conversionProgress(String percent) {
    return 'Pretvorba: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Pretvorba nije uspjela: $error';
  }

  @override
  String get settingsTitle => 'Postavke';

  @override
  String get licensesTitle => 'Licencije';

  @override
  String get licensesSubtitle =>
      'Licencije otvorenog izvornog koda ove aplikacije';

  @override
  String get gplLicenseTitle => 'Tekst licencije GPL-3.0';

  @override
  String get sourceCodeTitle => 'Izvorni kod (GitHub)';

  @override
  String get privacyPolicyTitle => 'Pravila privatnosti';

  @override
  String get adConsentTitle => 'Postavke privatnosti';

  @override
  String get imprintTitle => 'Podaci o izdavaču';

  @override
  String get linkOpenError => 'Poveznicu nije moguće otvoriti.';

  @override
  String get muteTooltip => 'Objašnjenje uklanjanja zvuka';

  @override
  String get muteInfoContent =>
      'Potpuno uklanja zvuk iz pretvorenog videozapisa.\n\nKorisno, primjerice, za uklanjanje pozadinske buke ili smanjenje veličine datoteke.';

  @override
  String estimatedSize(String size) {
    return 'Procijenjena veličina: $size MB';
  }

  @override
  String get convertButton => 'Pretvori';

  @override
  String get crfLabel => 'Kvaliteta videozapisa (CRF)';

  @override
  String get crfInfoTitle => 'CRF — kvaliteta videozapisa';

  @override
  String get crfInfoContent =>
      '0 → bez gubitaka (vrlo velika datoteka)\n18 → gotovo bez vidljivih gubitaka\n23 → standardno (dobar omjer kvalitete i veličine)\n28 → vidljiv gubitak kvalitete\n51 → najniža kvaliteta\n\nPreporučeno: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → bez gubitaka (vrlo velika datoteka)\n25 → gotovo bez vidljivih gubitaka\n30 → standardno (dobar omjer kvalitete i veličine)\n38 → vidljiv gubitak kvalitete\n63 → najniža kvaliteta\n\nPreporučeno: 25–38\n\nVP9 i AV1 koriste ljestvicu 0–63: ista vrijednost označava drukčiju kvalitetu nego kod H.264/H.265.';

  @override
  String get resolutionLabel => 'Razlučivost';

  @override
  String get resolutionInfoTitle => 'Uobičajene razlučivosti';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nSavjet: Ostavite jedno polje prazno = drugo će se izračunati proporcionalno.';

  @override
  String get widthLabel => 'Širina';

  @override
  String get heightLabel => 'Visina';

  @override
  String get emptyEqualsOriginal => 'Prazno = Izvorno';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Broj sličica u sekundi';

  @override
  String get fpsInfoContent =>
      'Izv.  → Zadrži izvorni broj sličica u sekundi\n24    → Filmski standard\n25    → PAL/TV standard (Europa)\n30    → NTSC/TV, društvene mreže\n60    → Glatka slika, igre, sport';

  @override
  String get audioBitrateLabel => 'Brzina prijenosa zvuka';

  @override
  String get silent => 'Bez zvuka';

  @override
  String get audioBitrateInfoContent =>
      'Bez zvuka → nema zvuka\n64 kbps  → govor, podcasti\n96 kbps  → dobra kvaliteta govora\n128 kbps → standardna kvaliteta glazbe\n192 kbps → visoka kvaliteta zvuka\n320 kbps → najviša MP3 kvaliteta';

  @override
  String get audioCodecLabel => 'Audiokodek';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → najbolja kompatibilnost i obično brže kodiranje\nH.265 → manje datoteke uz usporedivu kvalitetu, sporije kodiranje\nVP9 → učinkovit otvoreni kodek za WebM i MKV, sporije softversko kodiranje\nAV1 → moderan kodek za male datoteke, isključivo softversko kodiranje\nXvid → stariji MPEG-4 kodek za AVI i starije reproduktore\n\nIzlazni formati u nastavku omogućuju se prema odabranim videokodecima i audiokodecima.';

  @override
  String get xvidLegacyLabel => 'Xvid (stariji)';

  @override
  String get av1SlowHint =>
      'AV1 koristi isključivo softversko kodiranje i mnogo je sporiji od H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Za razlučivosti iznad 720p razmislite o prethodnom smanjenju razlučivosti.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard za MP4, najbolja kompatibilnost\nMP3 → široko rasprostranjen stariji kodek\nOpus → moderan i učinkovit, idealan za WebM i MKV\nAC3 → Dolby Digital, prikazuje se samo za izvore s prostornim zvukom (≥ 3 kanala)\nVorbis → otvoreni kodek za WebM i MKV\n\nNekompatibilni izlazni formati automatski se onemogućuju.';

  @override
  String get outputFormatLabel => 'Izlazni format';

  @override
  String get outputFormatInfoContent =>
      'MP4 → univerzalan, najbolja kompatibilnost\nMKV → prilagodljiv spremnik za sve ponuđene kodeke\nMOV → rad u aplikacijama Apple/QuickTime\nAVI → stariji format koji koristi Xvid\nMPEG-TS → prijenosni tok za TV i strujanje\nWebM → moderan format za web koji koristi VP9 uz Opus ili Vorbis\n\nNekompatibilni formati prikazuju se zasivljeno. Odabirom takvog formata automatski se primjenjuje njegov zadani videokodek i, po potrebi, kompatibilan audiokodek.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return 'Podržani formati za $videoCodec + $audioCodec: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Izlazni format promijenjen je u $format.';
  }

  @override
  String get orig => 'Izv.';

  @override
  String get resolutionExplainTitle => 'Što znače razlučivosti?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → vrlo mala datoteka,\nnpr. za WhatsApp\n\n480p  (854×480)   → standardna razlučivost (SD)\n\n720p  (1280×720)  → HD, prikladno za mobilne uređaje\n\n1080p (1920×1080) → Full HD, standard za\n                          YouTube i TV\n\nVisoka/Srednja/Niska označava kvalitetu pri istoj razlučivosti — viša = veća datoteka.';

  @override
  String get resolutionTooltip => 'Objašnjenje razlučivosti';

  @override
  String get trimArea => 'Raspon obrezivanja';

  @override
  String trimStartLabel(String time) {
    return 'Početak: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Kraj: $time';
  }

  @override
  String get adLoading => 'Učitavanje oglasa…';

  @override
  String get convertedPrefix => 'pretvoreno_';

  @override
  String get removeAdsTitle => 'Ukloni oglase';

  @override
  String removeAdsSubtitle(String price) {
    return 'Jednokratna kupnja – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Bez oglasa ✓';

  @override
  String get removeAdsActiveSubtitle => 'Hvala na podršci!';

  @override
  String get restorePurchasesTitle => 'Vrati kupnju';

  @override
  String get purchaseButton => 'Kupi';

  @override
  String get purchaseError => 'Kupnja nije uspjela. Pokušajte ponovno.';

  @override
  String get purchaseSuccess => 'Hvala! Oglasi su onemogućeni.';

  @override
  String get appName => 'Pretvarač videa';

  @override
  String get audioOnly => 'Samo zvuk';

  @override
  String get audioOnlyTooltip => 'Objašnjenje izdvajanja zvuka';

  @override
  String get audioOnlyInfoContent =>
      'Izdvaja samo zvučni zapis iz videozapisa — bez slike.\n\nUobičajeni način rada: MP3 pri 192 kbps.\nStručni način rada: Kodek i brzina prijenosa iz postavki zvuka.\n\nKorisno, primjerice, za spremanje glazbe ili podcasta iz videozapisa.';

  @override
  String get aspectLocked => 'Omjer slike zaključan';

  @override
  String get aspectUnlocked => 'Omjer slike otključan';

  @override
  String get cpuWarningTitle => 'Velika datoteka';

  @override
  String get cpuWarningContent =>
      'Ovaj videozapis traje dulje od 5 minuta. Na starijim uređajima pretvorba može znatno opteretiti procesor — to je normalno.\n\nSlobodno odložite telefon; aplikacija će nastaviti raditi u pozadini.';

  @override
  String get cpuWarningCheckbox => 'Ne prikazuj više';

  @override
  String get storageWarningTitle => 'Nema dovoljno prostora';

  @override
  String storageWarningContent(String available, String required) {
    return 'Na uređaju je slobodno samo $available MB. Za pretvorbu je potrebno približno $required MB. Najprije oslobodite prostor.';
  }

  @override
  String get feedbackTitle => 'Povratne informacije i podrška';

  @override
  String get feedbackSubtitle =>
      'Pošaljite prijavu pogreške, prijedlog ili povratne informacije';

  @override
  String get feedbackCategoryLabel => 'Kategorija';

  @override
  String get feedbackCategoryBug => 'Prijava pogreške';

  @override
  String get feedbackCategoryFeature => 'Prijedlog značajke';

  @override
  String get feedbackCategoryFeedback => 'Opće povratne informacije';

  @override
  String get feedbackMessageHint => 'Opišite problem…';

  @override
  String get feedbackSendButton => 'Pošalji';

  @override
  String get notificationPermissionTitle => 'Pretvorba u pozadini';

  @override
  String get notificationPermissionContent =>
      'Dopustite obavijesti kako bi se pretvorba mogla nastaviti dok koristite druge aplikacije. Bez toga aplikacija mora ostati otvorena.';

  @override
  String get notificationPermissionNotNow => 'Ne sada';

  @override
  String get notificationPermissionAllow => 'Dopusti';

  @override
  String get notificationPermissionDenied =>
      'Omogućite obavijesti u postavkama za pretvorbu u pozadini.';

  @override
  String get notificationPermissionOpenSettings => 'Postavke';

  @override
  String get backButton => 'Natrag';

  @override
  String get appSettingsTitle => 'Postavke aplikacije';

  @override
  String get appSettingsSubtitle =>
      'Automatsko spremanje i postavke privatnosti';

  @override
  String get openSourceTitle => 'Otvoreni izvorni kod';

  @override
  String get openSourceSubtitle => 'Licencije i izvorni kod';

  @override
  String get openSourceLicensesTitle => 'Licencije otvorenog izvornog koda';

  @override
  String get legalSectionTitle => 'Pravne informacije';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Način kodiranja';

  @override
  String get encodingModeCrf => 'Kvaliteta (CRF)';

  @override
  String get encodingModeBitrate => 'Bitrate';

  @override
  String get audioChannelsLabel => 'Zvučni kanali';

  @override
  String get audioChannelsInfoContent =>
      'Izvorno → zadrži izvorni raspored kanala\nStereo → 2.0 (po potrebi smanji broj kanala)\nMono → 1 kanal (najmanja datoteka)\n5.1 → 6-kanalni prostorni zvuk (samo za izvore s prostornim zvukom)\n\nSmanjenje broja kanala (npr. 5.1 → Stereo) je podržano. Povećanje broja kanala nije dostupno.';

  @override
  String get audioChannelOriginal => 'Izvorno';

  @override
  String get targetBitrateLabel => 'Ciljna brzina prijenosa';

  @override
  String get targetBitrateInfoTitle => 'Ciljna brzina prijenosa';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → jako komprimiranje, aplikacije za razmjenu poruka\n4–8 Mbps → standardna/dobra kvaliteta pri 1080p\n12 Mbps → visoka kvaliteta pri 1080p / niska kvaliteta pri 4K\n20 Mbps → kvaliteta za strujanje u 4K\n\nPrilagođena vrijednost: upotrijebite ikonu olovke (500–100000 kbps)\n\nZa razliku od CRF-a, kvaliteta se može razlikovati od scene do scene. Koristite CRF za bolje rezultate pri istoj veličini datoteke.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 i AV1 postižu istu kvalitetu pri otprilike upola manjoj brzini prijenosa.';

  @override
  String get rateAppTitle => 'Ocijeni aplikaciju';

  @override
  String get proHintTitle => 'Koristi bez oglasa';

  @override
  String get proHintBody =>
      'Jednokratnom kupnjom možete trajno ukloniti oglase iz aplikacije.';

  @override
  String get proHintLater => 'Kasnije';

  @override
  String get restoreError =>
      'Kupnje nije moguće vratiti. Trgovina Play trenutačno nije dostupna — pokušajte ponovno.';

  @override
  String get restoreNoPurchases => 'Nisu pronađene prethodne kupnje.';

  @override
  String get hdrCodecSwitched =>
      'Otkriven je HDR videozapis — za ovaj videozapis koristi se H.265 kako bi se očuvale boje.';

  @override
  String get themeTitle => 'Izgled';

  @override
  String get themeSubtitle =>
      'Pratite postavke sustava ili odaberite svijetlu ili tamnu temu';

  @override
  String get themeSystem => 'Sustav';

  @override
  String get themeLight => 'Svijetla';

  @override
  String get themeDark => 'Tamna';

  @override
  String get targetBitrateEditTooltip => 'Unesi brzinu prijenosa';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Dopušteni raspon: $range';
  }

  @override
  String get hwEncoderTitle => 'Hardverski koder (brz)';

  @override
  String get hwEncoderSubtitle =>
      'Znatno brži, ali za istu kvalitetu treba otprilike dvostruku brzinu prijenosa. Samo u načinu rada s brzinom prijenosa.';

  @override
  String get hwEncoderHdrHint =>
      'HDR videozapis — pretvorit će se softverskim koderom kako bi se očuvao HDR.';

  @override
  String get hwEncoderFallback =>
      'Hardverski koder nije uspio — pretvorba se nastavlja softverskim koderom.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Hardverski koder ne podržava $format — ovaj će se format pretvoriti softverskim koderom.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Hardverski koder je isključen — podržava samo način rada s brzinom prijenosa.';

  @override
  String get resolutionPresetLabel => 'Predložak';

  @override
  String get resolutionOriginal => 'Izvorno';

  @override
  String get resolutionCustom => 'Prilagođeno';

  @override
  String get aspectRatioLabel => 'Omjer slike';

  @override
  String get aspectOriginal => 'Izvorno';

  @override
  String get aspectCustom => 'Prilagođeno';

  @override
  String get fitModeLabel => 'Prilagodba';

  @override
  String get fitPad => 'Trake';

  @override
  String get fitCrop => 'Izrezivanje';

  @override
  String get fitStretch => 'Rastezanje';

  @override
  String get fitModeInfoContent =>
      'Ciljni omjer slike razlikuje se od omjera slike videozapisa.\n\nTrake → cijela slika ostaje vidljiva, a ostatak ispunjavaju crne trake\nIzrezivanje → izdvaja se središnji dio slike, a rubovi se gube\nRastezanje → slika se izobličuje kako bi ispunila kadar';

  @override
  String get deleteOriginal => 'Izbriši izvornik';

  @override
  String get originalTrashed =>
      'Izvornik je premješten u smeće — odatle ga možete vratiti.';

  @override
  String get originalTrashFailed => 'Izvornik nije moguće izbrisati.';

  @override
  String get burnInSubtitlesLabel => 'Dodaj titlove';

  @override
  String get burnInSubtitlesInfoContent =>
      'Trajni: Titlovi postaju dio slike videozapisa. Vidljivi su u svakom reproduktoru i kasnije se ne mogu isključiti. U videozapisima koji ostaju u HDR-u mogu izgledati vrlo svijetlo.\n\nPo izboru: Titlovi se dodaju kao zaseban zapis koji se može uključiti ili isključiti u reproduktoru. Ne prikazuju ih svi reproduktori i često se gube pri dijeljenju videozapisa. Nije dostupno za AVI i MPEG-TS.\n\nPodržane su SRT i ASS datoteke. Oblikovanje i položaji iz ASS datoteka u potpunosti se čuvaju u načinu Trajni i u MKV datotekama. Ostali formati zadržavaju samo dio oblikovanja, bez položaja.';

  @override
  String get subtitleModeBurnIn => 'Trajni';

  @override
  String get subtitleModeTrack => 'Po izboru';

  @override
  String get subtitleTrackEmpty =>
      'U odabranom dijelu videozapisa nema titlova.';

  @override
  String get burnInSubtitlesSelect => 'Odaberi SRT ili ASS datoteku';

  @override
  String get burnInSubtitlesRemove => 'Ukloni datoteku titlova';

  @override
  String get burnInSubtitlesUnsupported => 'Odaberite .srt ili .ass datoteku.';

  @override
  String get burnInSubtitlesInvalid =>
      'Ovu datoteku titlova nije moguće pročitati ili ne sadrži valjane titlove.';

  @override
  String get burnInSubtitlesMissing =>
      'Datoteka titlova više nije dostupna. Odaberite je ponovno.';

  @override
  String get subtitleTextSizeLabel => 'Veličina teksta';

  @override
  String get subtitleTextSizeSmall => 'Mala';

  @override
  String get subtitleTextSizeMedium => 'Srednja';

  @override
  String get subtitleTextSizeLarge => 'Velika';

  @override
  String get subtitlePositionLabel => 'Položaj';

  @override
  String get subtitlePositionBottom => 'Dolje';

  @override
  String get subtitlePositionTop => 'Gore';

  @override
  String get subtitleBackgroundTitle => 'Siva pozadina';
}
