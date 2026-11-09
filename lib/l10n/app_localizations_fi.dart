// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get qualityLabel => 'Laatu';

  @override
  String get quality2160pHigh => '2160p Hyvä';

  @override
  String get quality2160pMedium => '2160p Keskitaso';

  @override
  String get quality2160pLow => '2160p Heikko';

  @override
  String get quality2160pVeryLow => '2160p Hyvin heikko';

  @override
  String get quality1440pHigh => '1440p Hyvä';

  @override
  String get quality1440pMedium => '1440p Keskitaso';

  @override
  String get quality1440pLow => '1440p Heikko';

  @override
  String get quality1440pVeryLow => '1440p Hyvin heikko';

  @override
  String get quality1080pHigh => '1080p Hyvä';

  @override
  String get quality1080pMedium => '1080p Keskitaso';

  @override
  String get quality1080pLow => '1080p Heikko';

  @override
  String get quality1080pVeryLow => '1080p Hyvin heikko';

  @override
  String get quality720pHigh => '720p Hyvä';

  @override
  String get quality720pMedium => '720p Keskitaso';

  @override
  String get quality720pLow => '720p Heikko';

  @override
  String get quality720pVeryLow => '720p Hyvin heikko';

  @override
  String get quality480pHigh => '480p Hyvä';

  @override
  String get quality480pMedium => '480p Keskitaso';

  @override
  String get quality480pLow => '480p Heikko';

  @override
  String get quality480pVeryLow => '480p Hyvin heikko';

  @override
  String get quality360pHigh => '360p Hyvä';

  @override
  String get quality360pMedium => '360p Keskitaso';

  @override
  String get quality360pLow => '360p Heikko';

  @override
  String get quality360pVeryLow => '360p Hyvin heikko';

  @override
  String get mute => 'Mykistä';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Valitse video';

  @override
  String get videoLoading => 'Ladataan videota…';

  @override
  String get modeNormal => 'Normaali';

  @override
  String get modeExpert => 'Asiantuntija';

  @override
  String get invalidVideoFile => 'Valitse kelvollinen videotiedosto.';

  @override
  String get fileLoadError =>
      'Tiedostoa ei voitu ladata. Valitse videotiedosto.';

  @override
  String get previewNotAvailable =>
      'Esikatselu ei ole käytettävissä. Videon voi silti muuntaa.';

  @override
  String get previewNotAvailableLabel =>
      'Esikatselu ei ole käytettävissä\n(Tarkkuus on liian suuri tälle laitteelle)';

  @override
  String get noVideoLoaded => 'Lataa ensin video.';

  @override
  String get cancelConversionTitle => 'Keskeytetäänkö muunnos?';

  @override
  String get cancelConversionContent => 'Muunnoksen edistyminen menetetään.';

  @override
  String get continueConversion => 'Jatka';

  @override
  String get cancel => 'Peruuta';

  @override
  String get discardVideoTitle => 'Hylätäänkö video?';

  @override
  String get discardVideoContent =>
      'Muunnettu video poistetaan tallentamatta sitä.';

  @override
  String get keep => 'Säilytä';

  @override
  String get discard => 'Hylkää';

  @override
  String get save => 'Tallenna';

  @override
  String get saveVideoDialogTitle => 'Tallenna video';

  @override
  String get savedSuccess => 'Tallennettu!';

  @override
  String get open => 'Avaa';

  @override
  String get openGallery => 'Avaa galleria';

  @override
  String get openVideo => 'Avaa video';

  @override
  String get autoSaveTitle => 'Tallenna videot automaattisesti galleriaan';

  @override
  String get autoSaveSubtitle =>
      'Videot tallennetaan automaattisesti muunnoksen jälkeen.';

  @override
  String get videoCodecTitle => 'Videokoodekki';

  @override
  String get videoCodecSubtitle =>
      'Normaalitilan muunnoksissa käytettävä videokoodekki';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC vai AV1?';

  @override
  String get videoCodecInfoContent =>
      'H.264 tarjoaa parhaan yhteensopivuuden, ja muunnos on yleensä nopeampi.\n\nH.265/HEVC voi tuottaa pienempiä tiedostoja vastaavalla kuvanlaadulla, mutta muunnos kestää kauemmin. Vanhemmat laitteet tai sovellukset eivät välttämättä pysty toistamaan lopputulosta.\n\nAV1 on nykyaikainen koodekki, joka on suunniteltu pienille tiedostoille. Vanhemmat laitteet ja sovellukset eivät usein pysty toistamaan lopputulosta.\n\nKaikki kooderit sisältyvät sovellukseen eivätkä ole riippuvaisia laitteeseen asennetuista koodekeista.';

  @override
  String get saveError =>
      'Tallennus epäonnistui. Tallennustilaa ei ehkä ole riittävästi.';

  @override
  String get saveErrorOutOfMemory =>
      'Muisti ei riitä tämän tiedoston tallentamiseen. Kokeile lyhyempää leikettä tai heikompaa laatua.';

  @override
  String get conversionDone => 'Valmis!';

  @override
  String conversionProgress(String percent) {
    return 'Muunnetaan: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Muunnos epäonnistui: $error';
  }

  @override
  String get settingsTitle => 'Asetukset';

  @override
  String get licensesTitle => 'Lisenssit';

  @override
  String get licensesSubtitle => 'Sovelluksen avoimen lähdekoodin lisenssit';

  @override
  String get gplLicenseTitle => 'GPL-3.0-lisenssin teksti';

  @override
  String get sourceCodeTitle => 'Lähdekoodi (GitHub)';

  @override
  String get privacyPolicyTitle => 'Tietosuojakäytäntö';

  @override
  String get adConsentTitle => 'Tietosuoja-asetukset';

  @override
  String get imprintTitle => 'Julkaisutiedot';

  @override
  String get linkOpenError => 'Linkkiä ei voitu avata.';

  @override
  String get muteTooltip => 'Tietoa mykistyksestä';

  @override
  String get muteInfoContent =>
      'Poistaa äänen kokonaan muunnetusta videosta.\n\nHyödyllinen esimerkiksi taustamelun poistamiseen tai tiedostokoon pienentämiseen.';

  @override
  String estimatedSize(String size) {
    return 'Arvioitu koko: $size MB';
  }

  @override
  String get convertButton => 'Muunna';

  @override
  String get crfLabel => 'Videon laatu (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Videon laatu';

  @override
  String get crfInfoContent =>
      '0 → häviötön (erittäin suuri tiedosto)\n18 → silmämääräisesti lähes häviötön\n23 → vakio (hyvä tasapaino)\n28 → näkyvää laadun heikkenemistä\n51 → heikoin laatu\n\nSuositus: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → häviötön (erittäin suuri tiedosto)\n25 → silmämääräisesti lähes häviötön\n30 → vakio (hyvä tasapaino)\n38 → näkyvää laadun heikkenemistä\n63 → heikoin laatu\n\nSuositus: 25–38\n\nVP9 ja AV1 käyttävät asteikkoa 0–63: sama arvo vastaa eri laatua kuin H.264/H.265-koodekeilla.';

  @override
  String get resolutionLabel => 'Tarkkuus';

  @override
  String get resolutionInfoTitle => 'Yleiset tarkkuudet';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nVinkki: Jätä toinen kenttä tyhjäksi = sen arvo lasketaan kuvasuhteen mukaan.';

  @override
  String get widthLabel => 'Leveys';

  @override
  String get heightLabel => 'Korkeus';

  @override
  String get emptyEqualsOriginal => 'Tyhjä = alkuperäinen';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Kuvia sekunnissa';

  @override
  String get fpsInfoContent =>
      'Alkup. → Säilytä alkuperäisen videon kuvataajuus\n24    → Elokuvastandardi\n25    → PAL/TV-standardi (Eurooppa)\n30    → NTSC/TV, sosiaalinen media\n60    → Sulava kuva, pelit, urheilu';

  @override
  String get audioBitrateLabel => 'Äänen bittinopeus';

  @override
  String get silent => 'Äänetön';

  @override
  String get audioBitrateInfoContent =>
      'Äänetön  → ei ääntä\n64 kbps  → puhe, podcastit\n96 kbps  → hyvä puheen laatu\n128 kbps → musiikin vakiolaatu\n192 kbps → hyvä äänenlaatu\n320 kbps → paras MP3-laatu';

  @override
  String get audioCodecLabel => 'Äänikoodekki';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → paras yhteensopivuus ja yleensä nopeampi koodaus\nH.265 → pienemmät tiedostot vastaavalla laadulla, hitaampi koodaus\nVP9 → tehokas avoin koodekki WebM- ja MKV-muodoille, hitaampi ohjelmistokoodaus\nAV1 → nykyaikainen koodekki pienille tiedostoille, vain ohjelmistokoodaus\nXvid → vanha MPEG-4-koodekki AVI-muodolle ja vanhemmille soittimille\n\nAlla olevat tulostusmuodot ovat käytettävissä valittujen video- ja äänikoodekkien mukaan.';

  @override
  String get xvidLegacyLabel => 'Xvid (vanha)';

  @override
  String get av1SlowHint =>
      'AV1 käyttää vain ohjelmistokoodausta ja on paljon hitaampi kuin H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Jos tarkkuus on yli 720p, harkitse sen pienentämistä ensin.';

  @override
  String get audioCodecInfoContent =>
      'AAC → MP4-muodon vakiokoodekki, paras yhteensopivuus\nMP3 → laajasti käytetty vanha koodekki\nOpus → nykyaikainen ja tehokas, ihanteellinen WebM- ja MKV-muodoille\nAC3 → Dolby Digital, näkyy vain monikanavaisille lähteille (≥ 3 kanavaa)\nVorbis → avoin koodekki WebM- ja MKV-muodoille\n\nYhteensopimattomat tulostusmuodot poistetaan käytöstä automaattisesti.';

  @override
  String get outputFormatLabel => 'Tulostusmuoto';

  @override
  String get outputFormatInfoContent =>
      'MP4 → yleiskäyttöinen, paras yhteensopivuus\nMKV → joustava säiliömuoto kaikille tarjolla oleville koodekeille\nMOV → Apple/QuickTime-työnkulut\nAVI → vanha tiedostomuoto, joka käyttää Xvid-koodekkia\nMPEG-TS → TV-lähetysten ja suoratoiston siirtovirta\nWebM → nykyaikainen verkkomuoto, joka käyttää VP9-koodekkia sekä Opus- tai Vorbis-koodekkia\n\nYhteensopimattomat muodot näkyvät himmennettyinä. Kun valitset sellaisen, sen oletusvideokoodekki ja tarvittaessa yhteensopiva äänikoodekki otetaan automaattisesti käyttöön.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec on tuettu seuraavissa muodoissa: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Tulostusmuodoksi vaihdettiin $format.';
  }

  @override
  String get orig => 'Alkup.';

  @override
  String get resolutionExplainTitle => 'Mitä tarkkuudet tarkoittavat?';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → erittäin pieni tiedosto,\nesim. WhatsAppiin\n\n480p  (854×480)   → vakiotarkkuus (SD)\n\n720p  (1280×720)  → HD, sopii mobiililaitteille\n\n1080p (1920×1080) → Full HD, vakiotarkkuus\n                          YouTubeen ja TV:hen\n\nHyvä/Keskitaso/Heikko kuvaa laatua samalla tarkkuudella — parempi laatu = suurempi tiedosto.';

  @override
  String get resolutionTooltip => 'Tietoa tarkkuuksista';

  @override
  String get trimArea => 'Leikkausalue';

  @override
  String trimStartLabel(String time) {
    return 'Alku: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Loppu: $time';
  }

  @override
  String get adLoading => 'Ladataan mainosta…';

  @override
  String get convertedPrefix => 'muunnettu_';

  @override
  String get removeAdsTitle => 'Poista mainokset';

  @override
  String removeAdsSubtitle(String price) {
    return 'Kertaostos – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Mainokseton ✓';

  @override
  String get removeAdsActiveSubtitle => 'Kiitos tuestasi!';

  @override
  String get restorePurchasesTitle => 'Palauta ostos';

  @override
  String get purchaseButton => 'Osta';

  @override
  String get purchaseError => 'Osto epäonnistui. Yritä uudelleen.';

  @override
  String get purchaseSuccess => 'Kiitos! Mainokset on poistettu käytöstä.';

  @override
  String get appName => 'Videomuunnin';

  @override
  String get audioOnly => 'Vain ääni';

  @override
  String get audioOnlyTooltip => 'Tietoa äänen poiminnasta';

  @override
  String get audioOnlyInfoContent =>
      'Poimii videosta vain ääniraidan ilman kuvaa.\n\nNormaalitila: MP3, 192 kbps.\nAsiantuntijatila: Koodekki ja bittinopeus ääniasetusten mukaan.\n\nHyödyllinen esimerkiksi musiikin tai podcastien tallentamiseen videoista.';

  @override
  String get aspectLocked => 'Kuvasuhde lukittu';

  @override
  String get aspectUnlocked => 'Kuvasuhteen lukitus avattu';

  @override
  String get cpuWarningTitle => 'Suuri tiedosto';

  @override
  String get cpuWarningContent =>
      'Tämä video on yli 5 minuuttia pitkä. Vanhemmilla laitteilla muunnos voi kuormittaa suoritinta paljon — se on normaalia.\n\nVoit jättää puhelimen sivuun. Sovellus jatkaa toimintaansa taustalla.';

  @override
  String get cpuWarningCheckbox => 'Älä näytä uudelleen';

  @override
  String get storageWarningTitle => 'Tallennustila ei riitä';

  @override
  String storageWarningContent(String available, String required) {
    return 'Laitteessasi on vain $available MB vapaata tilaa. Muunnos tarvitsee noin $required MB. Vapauta ensin tallennustilaa.';
  }

  @override
  String get feedbackTitle => 'Palaute ja tuki';

  @override
  String get feedbackSubtitle => 'Lähetä virheilmoitus, ehdotus tai palautetta';

  @override
  String get feedbackCategoryLabel => 'Luokka';

  @override
  String get feedbackCategoryBug => 'Ilmoita virheestä';

  @override
  String get feedbackCategoryFeature => 'Ominaisuustoive';

  @override
  String get feedbackCategoryFeedback => 'Yleinen palaute';

  @override
  String get feedbackMessageHint => 'Kuvaile ongelmasi…';

  @override
  String get feedbackSendButton => 'Lähetä';

  @override
  String get notificationPermissionTitle => 'Muunnos taustalla';

  @override
  String get notificationPermissionContent =>
      'Salli ilmoitukset, jotta muunnos voi jatkua, kun käytät muita sovelluksia. Muuten sovelluksen on pysyttävä avoinna.';

  @override
  String get notificationPermissionNotNow => 'Ei nyt';

  @override
  String get notificationPermissionAllow => 'Salli';

  @override
  String get notificationPermissionDenied =>
      'Salli ilmoitukset asetuksissa, jotta voit muuntaa taustalla.';

  @override
  String get notificationPermissionOpenSettings => 'Asetukset';

  @override
  String get backButton => 'Takaisin';

  @override
  String get appSettingsTitle => 'Sovelluksen asetukset';

  @override
  String get appSettingsSubtitle =>
      'Automaattinen tallennus ja tietosuoja-asetukset';

  @override
  String get openSourceTitle => 'Avoin lähdekoodi';

  @override
  String get openSourceSubtitle => 'Lisenssit ja lähdekoodi';

  @override
  String get openSourceLicensesTitle => 'Avoimen lähdekoodin lisenssit';

  @override
  String get legalSectionTitle => 'Oikeudelliset tiedot';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Koodaustila';

  @override
  String get encodingModeCrf => 'Laatu (CRF)';

  @override
  String get encodingModeBitrate => 'Bittinopeus';

  @override
  String get audioChannelsLabel => 'Äänikanavat';

  @override
  String get audioChannelsInfoContent =>
      'Alkuperäinen → säilytä alkuperäinen kanavajako\nStereo → 2.0 (kanavien vähennys tarvittaessa)\nMono → 1 kanava (pienin tiedosto)\n5.1 → 6-kanavainen tilaääni (vain tilaäänilähteille)\n\nKanavien vähentämistä (esim. 5.1 → Stereo) tuetaan. Kanavien lisäämistä ei ole tarjolla.';

  @override
  String get audioChannelOriginal => 'Alkup.';

  @override
  String get targetBitrateLabel => 'Tavoitebittinopeus';

  @override
  String get targetBitrateInfoTitle => 'Tavoitebittinopeus';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → voimakas pakkaus, viestisovellukset\n4–8 Mbps → tavallinen/hyvä laatu tarkkuudella 1080p\n12 Mbps → hyvä laatu tarkkuudella 1080p / heikko laatu tarkkuudella 4K\n20 Mbps → 4K-suoratoistolaatu\n\nOma arvo: käytä kynäkuvaketta (500–100000 kbps)\n\nToisin kuin CRF-tilassa, laatu voi vaihdella kohtauksittain. CRF tuottaa parempia tuloksia samalla tiedostokoolla.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 ja AV1 saavuttavat saman laadun noin puolella näistä bittinopeuksista.';

  @override
  String get rateAppTitle => 'Arvostele sovellus';

  @override
  String get proHintTitle => 'Käytä ilman mainoksia';

  @override
  String get proHintBody =>
      'Voit poistaa mainokset sovelluksesta pysyvästi kertaostoksella.';

  @override
  String get proHintLater => 'Myöhemmin';

  @override
  String get restoreError =>
      'Ostoksia ei voitu palauttaa. Play Kauppa ei ole juuri nyt käytettävissä — yritä uudelleen.';

  @override
  String get restoreNoPurchases => 'Aiemmin tehtyjä ostoksia ei löytynyt.';

  @override
  String get hdrCodecSwitched =>
      'HDR-video havaittu — tälle videolle käytetään H.265-koodekkia, jotta värit säilyvät.';

  @override
  String get themeTitle => 'Ulkoasu';

  @override
  String get themeSubtitle =>
      'Noudata järjestelmän asetusta tai valitse vaalea tai tumma teema';

  @override
  String get themeSystem => 'Järjestelmä';

  @override
  String get themeLight => 'Vaalea';

  @override
  String get themeDark => 'Tumma';

  @override
  String get targetBitrateEditTooltip => 'Syötä bittinopeus';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Sallittu alue: $range';
  }

  @override
  String get hwEncoderTitle => 'Laitteistokooderi (nopea)';

  @override
  String get hwEncoderSubtitle =>
      'Paljon nopeampi, mutta tarvitsee noin kaksinkertaisen bittinopeuden samaan laatuun. Vain bittinopeustilassa.';

  @override
  String get hwEncoderHdrHint =>
      'HDR-video — muunnos tehdään ohjelmistokooderilla, jotta HDR säilyy.';

  @override
  String get hwEncoderFallback =>
      'Laitteistokooderi epäonnistui — muunnos tehdään ohjelmistokooderilla.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Laitteistokooderi ei tue muotoa $format — tämän muodon muunnos tehdään ohjelmistokooderilla.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Laitteistokooderi poistettiin käytöstä — se tukee vain bittinopeustilaa.';

  @override
  String get resolutionPresetLabel => 'Esiasetus';

  @override
  String get resolutionOriginal => 'Alkuperäinen';

  @override
  String get resolutionCustom => 'Oma';

  @override
  String get aspectRatioLabel => 'Kuvasuhde';

  @override
  String get aspectOriginal => 'Alkuperäinen';

  @override
  String get aspectCustom => 'Oma';

  @override
  String get fitModeLabel => 'Sovitus';

  @override
  String get fitPad => 'Reunukset';

  @override
  String get fitCrop => 'Rajaa';

  @override
  String get fitStretch => 'Venytä';

  @override
  String get fitModeInfoContent =>
      'Kohteen kuvasuhde eroaa videon kuvasuhteesta.\n\nReunukset → koko kuva säilyy näkyvissä, mustat reunukset täyttävät loput\nRajaa → kuvan keskiosa säilytetään, reunat jäävät pois\nVenytä → kuvaa vääristetään niin, että se täyttää koko kuva-alan';

  @override
  String get deleteOriginal => 'Poista alkuperäinen';

  @override
  String get originalTrashed =>
      'Alkuperäinen siirrettiin roskakoriin — voit palauttaa sen sieltä.';

  @override
  String get originalTrashFailed => 'Alkuperäistä ei voitu poistaa.';

  @override
  String get burnInSubtitlesLabel => 'Lisää tekstityksiä';

  @override
  String get burnInSubtitlesInfoContent =>
      'Pysyvä: Tekstitykset lisätään osaksi videokuvaa. Ne näkyvät kaikissa soittimissa, eikä niitä voi poistaa käytöstä myöhemmin. HDR-muodossa säilyvissä videoissa ne voivat näyttää hyvin kirkkailta.\n\nValittava: Tekstitykset lisätään erillisenä raitana, jonka voi ottaa käyttöön tai poistaa käytöstä soittimessa. Kaikki soittimet eivät näytä niitä, ja ne katoavat usein videota jaettaessa. Ei käytettävissä AVI- ja MPEG-TS-muodoissa.\n\nTukee SRT- ja ASS-tiedostoja. ASS-tyylit ja tekstitysten sijainnit säilyvät täysin Pysyvä-tilassa sekä MKV-tiedostoissa. Muissa muodoissa säilyy vain osa tyyleistä, eivätkä sijainnit säily.';

  @override
  String get subtitleModeBurnIn => 'Pysyvä';

  @override
  String get subtitleModeTrack => 'Valittava';

  @override
  String get subtitleTrackEmpty =>
      'Videon valitussa osassa ei ole tekstityksiä.';

  @override
  String get sharedVideoBusy =>
      'Viimeistele ensin nykyinen muunnos ja jaa video sitten uudelleen.';

  @override
  String get burnInSubtitlesSelect => 'Valitse SRT- tai ASS-tiedosto';

  @override
  String get burnInSubtitlesRemove => 'Poista tekstitystiedosto';

  @override
  String get burnInSubtitlesUnsupported => 'Valitse .srt- tai .ass-tiedosto.';

  @override
  String get burnInSubtitlesInvalid =>
      'Tekstitystiedostoa ei voitu lukea tai se ei sisällä kelvollisia tekstityksiä.';

  @override
  String get burnInSubtitlesMissing =>
      'Tekstitystiedosto ei ole enää käytettävissä. Valitse se uudelleen.';

  @override
  String get subtitleTextSizeLabel => 'Tekstin koko';

  @override
  String get subtitleTextSizeSmall => 'Pieni';

  @override
  String get subtitleTextSizeMedium => 'Keski';

  @override
  String get subtitleTextSizeLarge => 'Suuri';

  @override
  String get subtitlePositionLabel => 'Sijainti';

  @override
  String get subtitlePositionBottom => 'Alhaalla';

  @override
  String get subtitlePositionTop => 'Ylhäällä';

  @override
  String get subtitleBackgroundTitle => 'Harmaa tausta';
}
