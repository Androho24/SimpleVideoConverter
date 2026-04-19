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
  String get saveError =>
      'Errore durante il salvataggio. Forse non c\'è abbastanza spazio di archiviazione.';

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
  String get audioCodecInfoContent =>
      'AAC → standard per MP4, massima compatibilità\nMP3 → molto diffuso, leggermente obsoleto\nOpus → moderno ed efficiente, ottimo per MKV';

  @override
  String get outputFormatLabel => 'Formato di output';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universale, massima compatibilità\nMKV → flessibile, molti codec, meno compatibile\nMOV → formato Apple/QuickTime\nAVI → obsoleto, ampia compatibilità\nTS → MPEG Transport Stream, TV/streaming';

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
  String get appName => 'Video Converter FFmpeg';

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
}
