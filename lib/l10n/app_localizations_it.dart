// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get qualityLabel => 'Qualità';

  @override
  String get quality2160pHigh => '2160p Alta';

  @override
  String get quality2160pMedium => '2160p Media';

  @override
  String get quality2160pLow => '2160p Bassa';

  @override
  String get quality2160pVeryLow => '2160p Molto bassa';

  @override
  String get quality1440pHigh => '1440p Alta';

  @override
  String get quality1440pMedium => '1440p Media';

  @override
  String get quality1440pLow => '1440p Bassa';

  @override
  String get quality1440pVeryLow => '1440p Molto bassa';

  @override
  String get quality1080pHigh => '1080p Alta';

  @override
  String get quality1080pMedium => '1080p Media';

  @override
  String get quality1080pLow => '1080p Bassa';

  @override
  String get quality1080pVeryLow => '1080p Molto bassa';

  @override
  String get quality720pHigh => '720p Alta';

  @override
  String get quality720pMedium => '720p Media';

  @override
  String get quality720pLow => '720p Bassa';

  @override
  String get quality720pVeryLow => '720p Molto bassa';

  @override
  String get quality480pHigh => '480p Alta';

  @override
  String get quality480pMedium => '480p Media';

  @override
  String get quality480pLow => '480p Bassa';

  @override
  String get quality480pVeryLow => '480p Molto bassa';

  @override
  String get quality360pHigh => ' 360p Alta';

  @override
  String get quality360pMedium => '360p Media';

  @override
  String get quality360pLow => '360p Bassa';

  @override
  String get quality360pVeryLow => '360p Molto bassa';

  @override
  String get mute => 'Disattiva audio';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Seleziona video';

  @override
  String get videoLoading => 'Caricamento video in corso…';

  @override
  String get modeNormal => 'Normale';

  @override
  String get modeExpert => 'Esperto';

  @override
  String get invalidVideoFile => 'Seleziona un file video valido.';

  @override
  String get fileLoadError =>
      'Impossibile caricare il file. Seleziona un file video.';

  @override
  String get previewNotAvailable =>
      'Anteprima non disponibile. Il video può comunque essere convertito.';

  @override
  String get previewNotAvailableLabel =>
      'Anteprima non disponibile\n(Risoluzione troppo alta per questo dispositivo)';

  @override
  String get noVideoLoaded => 'Carica prima un video.';

  @override
  String get cancelConversionTitle => 'Annullare la conversione?';

  @override
  String get cancelConversionContent =>
      'L\'elaborazione effettuata finora andrà persa.';

  @override
  String get continueConversion => 'Continua';

  @override
  String get cancel => 'Annulla';

  @override
  String get discardVideoTitle => 'Eliminare il video?';

  @override
  String get discardVideoContent =>
      'Il video convertito verrà eliminato e non salvato.';

  @override
  String get keep => 'Conserva';

  @override
  String get discard => 'Elimina';

  @override
  String get save => 'Salva';

  @override
  String get saveVideoDialogTitle => 'Salva video';

  @override
  String get savedSuccess => 'Salvato!';

  @override
  String get open => 'Apri';

  @override
  String get openGallery => 'Apri galleria';

  @override
  String get openVideo => 'Apri video';

  @override
  String get autoSaveTitle => 'Salva automaticamente i video nella galleria';

  @override
  String get autoSaveSubtitle =>
      'I video vengono salvati automaticamente dopo la conversione.';

  @override
  String get videoCodecTitle => 'Codec video';

  @override
  String get videoCodecSubtitle =>
      'Codec video per le conversioni in modalità normale';

  @override
  String get videoCodecInfoTitle => 'H.264 o H.265/HEVC?';

  @override
  String get videoCodecInfoContent =>
      'H.264 offre la migliore compatibilità e in genere una conversione più rapida.\n\nH.265/HEVC può produrre file più piccoli con una qualità dell’immagine paragonabile, ma la conversione richiede più tempo. I dispositivi o le app meno recenti potrebbero non riprodurre il risultato.\n\nEntrambi gli encoder sono inclusi nell’app e non dipendono dai codec installati sul dispositivo.';

  @override
  String get saveError =>
      'Errore durante il salvataggio. Forse non c\'è abbastanza spazio di archiviazione.';

  @override
  String get saveErrorOutOfMemory =>
      'La memoria disponibile non è sufficiente per salvare questo file. Prova con un clip più breve o una qualità inferiore.';

  @override
  String get conversionDone => 'Fatto!';

  @override
  String conversionProgress(String percent) {
    return 'Conversione: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Conversione fallita: $error';
  }

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get licensesTitle => 'Licenze';

  @override
  String get licensesSubtitle => 'Licenze open source di questa app';

  @override
  String get gplLicenseTitle => 'Testo della licenza GPL-3.0';

  @override
  String get sourceCodeTitle => 'Codice sorgente (GitHub)';

  @override
  String get privacyPolicyTitle => 'Informativa sulla privacy';

  @override
  String get adConsentTitle => 'Impostazioni privacy';

  @override
  String get imprintTitle => 'Note legali';

  @override
  String get linkOpenError => 'Impossibile aprire il link.';

  @override
  String get muteTooltip => 'Spiegazione della funzione Muto';

  @override
  String get muteInfoContent =>
      'Rimuove completamente l\'audio dal video convertito.\n\nUtile, ad esempio, per rimuovere i rumori di fondo o ridurre le dimensioni del file.';

  @override
  String estimatedSize(String size) {
    return 'Dimensione stimata: $size MB';
  }

  @override
  String get convertButton => 'Converti';

  @override
  String get crfLabel => 'Qualità video (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Qualità video';

  @override
  String get crfInfoContent =>
      '0 → senza perdita di dati (file molto grande)\n18 → visivamente quasi senza perdita di dati\n23 → Standard (buon equilibrio)\n28 → perdita di qualità visibile\n51 → qualità più bassa\n\nRaccomandazione: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → senza perdita di dati (file molto grande)\n25 → visivamente quasi senza perdita di dati\n30 → Standard (buon equilibrio)\n38 → perdita di qualità visibile\n63 → qualità più bassa\n\nRaccomandazione: 25–38\n\nVP9 e AV1 usano una scala 0–63: lo stesso numero indica una qualità diversa rispetto a H.264/H.265.';

  @override
  String get resolutionLabel => 'Risoluzione';

  @override
  String get resolutionInfoTitle => 'Risoluzioni comuni';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nSuggerimento: lasciare un campo vuoto = l\'altro verrà calcolato proporzionalmente.';

  @override
  String get widthLabel => 'Larghezza';

  @override
  String get heightLabel => 'Altezza';

  @override
  String get emptyEqualsOriginal => 'Vuoto = Originale';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Fotogrammi al secondo';

  @override
  String get fpsInfoContent =>
      'Orig → Mantieni FPS del video sorgente\n24 → Standard cinematografico\n25 → Standard PAL/TV (Europa)\n30 → NTSC/TV, social media\n60 → Fluido, giochi, sport';

  @override
  String get audioBitrateLabel => 'Bitrate audio';

  @override
  String get silent => 'Muto';

  @override
  String get audioBitrateInfoContent =>
      'Muto → nessun audio\n64 kbps → voce, podcast\n96 kbps → buona qualità vocale\n128 kbps → musica standard\n192 kbps → alta qualità audio\n320 kbps → massima qualità MP3';

  @override
  String get audioCodecLabel => 'Codec audio';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → massima compatibilità e codifica generalmente più rapida\nH.265 → file più piccoli a qualità comparabile, codifica più lenta\nVP9 → codec aperto ed efficiente per WebM e MKV, codifica software più lenta\nAV1 → migliore compressione, codifica solo software, sperimentale\nXvid → codec MPEG-4 legacy per AVI e lettori meno recenti\n\nI formati di output disponibili dipendono dai codec video e audio selezionati.';

  @override
  String get xvidLegacyLabel => 'Xvid (legacy)';

  @override
  String get av1SlowHint =>
      'AV1 viene codificato solo via software ed è molto più lento di H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Oltre i 720p conviene ridurre prima la risoluzione.';

  @override
  String get av1ExperimentalTitle => 'AV1 (sperimentale)';

  @override
  String get av1ExperimentalSubtitle =>
      'Aggiunge AV1 alla selezione dei codec nelle modalità normale ed esperta. Codec moderno e molto efficiente, non ancora del tutto collaudato.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard per MP4, massima compatibilità\nMP3 → codec legacy molto diffuso\nOpus → moderno ed efficiente, ideale per WebM e MKV\nAC3 → Dolby Digital, solo per sorgenti surround (≥ 3 canali)\nVorbis → codec aperto per WebM e MKV\n\nI formati di output incompatibili vengono disattivati automaticamente.';

  @override
  String get outputFormatLabel => 'Formato di output';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universale, massima compatibilità\nMKV → contenitore flessibile per tutti i codec disponibili\nMOV → flussi di lavoro Apple/QuickTime\nAVI → formato legacy con Xvid\nMPEG-TS → flusso di trasporto per TV e streaming\nWebM → formato web moderno con VP9 e Opus o Vorbis\n\nI formati incompatibili appaiono attenuati. Se ne selezioni uno, vengono applicati automaticamente il codec video predefinito e, se necessario, un codec audio compatibile.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec è supportato da: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Il formato di output è stato cambiato in $format.';
  }

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Cosa significano le risoluzioni?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → file molto piccolo,\n ad es. per WhatsApp\n\n480p (854×480) → definizione standard (SD)\n\n720p (1280×720) → HD, ottimo per dispositivi mobili\n\n1080p (1920×1080) → Full HD, standard per\n YouTube e TV\n\nAlta/Media/Bassa descrive la qualità a parità di risoluzione — più alta = file più grande.';

  @override
  String get resolutionTooltip => 'Spiegazione delle risoluzioni';

  @override
  String get trimArea => 'Area di ritaglio';

  @override
  String trimStartLabel(String time) {
    return 'Inizio: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Fine: $time';
  }

  @override
  String get adLoading => 'Caricamento pubblicità in corso…';

  @override
  String get convertedPrefix => 'convertito_';

  @override
  String get removeAdsTitle => 'Rimuovi pubblicità';

  @override
  String removeAdsSubtitle(String price) {
    return 'Acquisto una tantum – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Senza pubblicità ✓';

  @override
  String get removeAdsActiveSubtitle => 'Grazie per il tuo sostegno!';

  @override
  String get restorePurchasesTitle => 'Ripristina acquisto';

  @override
  String get purchaseButton => 'Acquista';

  @override
  String get purchaseError => 'Acquisto non riuscito. Riprova.';

  @override
  String get purchaseSuccess => 'Grazie! La pubblicità è stata disattivata.';

  @override
  String get appName => 'Convertitore Video';

  @override
  String get audioOnly => 'Solo audio';

  @override
  String get audioOnlyTooltip => 'Spiegazione di Solo audio';

  @override
  String get audioOnlyInfoContent =>
      'Estrae solo la traccia audio dal video – nessuna immagine.\n\nModalità Normale: MP3 a 192 kbps.\nModalità Esperto: codec e bitrate dalle impostazioni audio.\n\nUtile, ad esempio, per salvare musica o podcast dai video.';

  @override
  String get aspectLocked => 'Formato bloccato';

  @override
  String get aspectUnlocked => 'Formato libero';

  @override
  String get cpuWarningTitle => 'File di grandi dimensioni';

  @override
  String get cpuWarningContent =>
      'Questo video supera i 5 minuti. Su dispositivi meno recenti, la conversione potrebbe causare un carico eccessivo del processore – è normale.\n\nPuoi semplicemente mettere il cellulare da parte, l\'app continuerà a funzionare in background.';

  @override
  String get cpuWarningCheckbox => 'Non mostrare più';

  @override
  String get storageWarningTitle => 'Spazio di archiviazione insufficiente';

  @override
  String storageWarningContent(String available, String required) {
    return 'Il tuo dispositivo ha solo $available MB di spazio libero. Per la conversione sono necessari circa $required MB. Libera prima dello spazio.';
  }

  @override
  String get feedbackTitle => 'Feedback e assistenza';

  @override
  String get feedbackSubtitle => 'Segnala bug, miglioramenti o invia feedback';

  @override
  String get feedbackCategoryLabel => 'Categoria';

  @override
  String get feedbackCategoryBug => 'Segnala un bug';

  @override
  String get feedbackCategoryFeature => 'Suggerimento di miglioramento';

  @override
  String get feedbackCategoryFeedback => 'Feedback generale';

  @override
  String get feedbackMessageHint => 'Descrivi la tua richiesta…';

  @override
  String get feedbackSendButton => 'Invia';

  @override
  String get notificationPermissionTitle => 'Conversione in background';

  @override
  String get notificationPermissionContent =>
      'Consenti le notifiche affinché la conversione possa continuare mentre utilizzi altre app. Senza questa autorizzazione, l\'app deve rimanere aperta.';

  @override
  String get notificationPermissionNotNow => 'Non ora';

  @override
  String get notificationPermissionAllow => 'Consenti';

  @override
  String get notificationPermissionDenied =>
      'Attiva le notifiche nelle impostazioni per la conversione in background.';

  @override
  String get notificationPermissionOpenSettings => 'Impostazioni';

  @override
  String get backButton => 'Indietro';

  @override
  String get appSettingsTitle => 'Impostazioni app';

  @override
  String get appSettingsSubtitle =>
      'Salvataggio automatico e impostazioni sulla privacy';

  @override
  String get openSourceTitle => 'Open Source';

  @override
  String get openSourceSubtitle => 'Licenze e codice sorgente';

  @override
  String get openSourceLicensesTitle => 'Licenze Open Source';

  @override
  String get legalSectionTitle => 'Note legali';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Modalità di codifica';

  @override
  String get encodingModeCrf => 'Qualità (CRF)';

  @override
  String get encodingModeBitrate => 'Bitrate';

  @override
  String get audioChannelsLabel => 'Canali audio';

  @override
  String get audioChannelsInfoContent =>
      'Originale → mantiene la configurazione dei canali della sorgente\nStereo → 2.0 (downmix se necessario)\nMono → 1 canale (file più piccolo)\n5.1 → surround a 6 canali (solo per sorgenti surround)\n\nIl downmixing (ad es. da 5.1 a stereo) è supportato. L\'upmixing non è disponibile.';

  @override
  String get audioChannelOriginal => 'Originale';

  @override
  String get targetBitrateLabel => 'Bitrate di destinazione';

  @override
  String get targetBitrateInfoTitle => 'Bitrate di destinazione';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → compressione elevata, app di messaggistica\n4–8 Mbps → qualità normale/buona a 1080p\n12 Mbps → qualità alta a 1080p / bassa a 4K\n20 Mbps → qualità streaming a 4K\n\nValore personalizzato: tramite l\'icona della matita (500–100000 kbps)\n\nA differenza del CRF, la qualità può variare da una scena all\'altra. Usa il CRF per ottenere risultati migliori a parità di dimensione del file.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 e AV1 raggiungono la stessa qualità con circa la metà di questi bitrate.';

  @override
  String get rateAppTitle => 'Valuta l\'app';

  @override
  String get proHintTitle => 'Usa l\'app senza pubblicità';

  @override
  String get proHintBody =>
      'Con un unico acquisto potrai rimuovere definitivamente la pubblicità dall\'app.';

  @override
  String get proHintLater => 'Più tardi';

  @override
  String get restoreError =>
      'Impossibile ripristinare gli acquisti. Il Play Store non è attualmente disponibile: riprova più tardi.';

  @override
  String get restoreNoPurchases =>
      'Non sono stati trovati acquisti precedenti.';

  @override
  String get hdrCodecSwitched =>
      'Video HDR rilevato: per questo video verrà usato H.265 per preservare i colori.';

  @override
  String get themeTitle => 'Aspetto';

  @override
  String get themeSubtitle => 'Impostazione di sistema o tema chiaro/scuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get targetBitrateEditTooltip => 'Inserisci il bitrate';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Intervallo consentito: $range';
  }

  @override
  String get hwEncoderTitle => 'Encoder hardware (veloce)';

  @override
  String get hwEncoderSubtitle =>
      'Molto più veloce, ma richiede circa il doppio del bitrate per la stessa qualità. Solo in modalità bitrate.';

  @override
  String get hwEncoderHdrHint =>
      'Video HDR: verrà convertito con l\'encoder software per preservare l\'HDR.';

  @override
  String get hwEncoderFallback =>
      'Encoder hardware non riuscito: conversione con l\'encoder software.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'L\'encoder hardware non supporta $format: questo formato verrà convertito con l\'encoder software.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Encoder hardware disattivato: supporta solo la modalità bitrate.';

  @override
  String get resolutionPresetLabel => 'Preset';

  @override
  String get resolutionOriginal => 'Originale';

  @override
  String get resolutionCustom => 'Personalizzata';

  @override
  String get aspectRatioLabel => 'Proporzioni';

  @override
  String get aspectOriginal => 'Originali';

  @override
  String get aspectCustom => 'Personalizzate';

  @override
  String get fitModeLabel => 'Adattamento';

  @override
  String get fitPad => 'Bande';

  @override
  String get fitCrop => 'Ritaglia';

  @override
  String get fitStretch => 'Allunga';

  @override
  String get fitModeInfoContent =>
      'La destinazione ha proporzioni diverse da quelle del video.\n\nBande → l\'immagine resta intera, bande nere riempiono il resto\nRitaglia → viene ritagliato il centro, i bordi vanno persi\nAllunga → l\'immagine viene deformata per riempire il riquadro';

  @override
  String get deleteOriginal => 'Elimina originale';

  @override
  String get originalTrashed =>
      'Originale spostato nel cestino: puoi ripristinarlo da lì.';

  @override
  String get originalTrashFailed => 'Impossibile eliminare l\'originale.';
}
