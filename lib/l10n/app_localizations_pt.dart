// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get qualityLabel => 'Qualidade';

  @override
  String get quality1080pHigh => '1080p Alta';

  @override
  String get quality1080pMedium => '1080p Média';

  @override
  String get quality1080pLow => '1080p Baixa';

  @override
  String get quality1080pVeryLow => '1080p Muito Baixa';

  @override
  String get quality720pHigh => '720p Alta';

  @override
  String get quality720pMedium => '720p Média';

  @override
  String get quality720pLow => '720p Baixa';

  @override
  String get quality720pVeryLow => '720p Muito Baixa';

  @override
  String get quality480pHigh => '480p Alta';

  @override
  String get quality480pMedium => '480p Média';

  @override
  String get quality480pLow => '480p Baixa';

  @override
  String get quality480pVeryLow => '480p Muito Baixa';

  @override
  String get quality360pHigh => ' 360p Alta';

  @override
  String get quality360pMedium => '360p Média';

  @override
  String get quality360pLow => '360p Baixa';

  @override
  String get quality360pVeryLow => '360p Muito Baixa';

  @override
  String get mute => 'Silenciar';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Selecionar vídeo';

  @override
  String get videoLoading => 'A carregar vídeo…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Especialista';

  @override
  String get invalidVideoFile => 'Selecione um ficheiro de vídeo válido.';

  @override
  String get fileLoadError =>
      'Não foi possível carregar o ficheiro. Por favor, selecione um ficheiro de vídeo.';

  @override
  String get previewNotAvailable =>
      'Pré-visualização indisponível. O vídeo pode, no entanto, ser convertido.';

  @override
  String get previewNotAvailableLabel =>
      'Pré-visualização indisponível\n(Resolução demasiado alta para este dispositivo)';

  @override
  String get noVideoLoaded => 'Por favor, carregue primeiro um vídeo.';

  @override
  String get cancelConversionTitle => 'Cancelar conversão?';

  @override
  String get cancelConversionContent =>
      'O processamento realizado até agora será perdido.';

  @override
  String get continueConversion => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get discardVideoTitle => 'Descartar vídeo?';

  @override
  String get discardVideoContent =>
      'O vídeo convertido será eliminado e não guardado.';

  @override
  String get keep => 'Manter';

  @override
  String get discard => 'Descartar';

  @override
  String get save => 'Guardar';

  @override
  String get saveVideoDialogTitle => 'Guardar vídeo';

  @override
  String get savedSuccess => 'Guardado!';

  @override
  String get open => 'Abrir';

  @override
  String get saveError =>
      'Erro ao guardar. Talvez não haja espaço de armazenamento suficiente.';

  @override
  String get conversionDone => 'Concluído!';

  @override
  String conversionProgress(String percent) {
    return 'Conversão: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Falha na conversão: $error';
  }

  @override
  String get settingsTitle => 'Definições';

  @override
  String get licensesTitle => 'Licenças';

  @override
  String get licensesSubtitle => 'Licenças de código aberto desta aplicação';

  @override
  String get gplLicenseTitle => 'Texto da licença GPL-3.0';

  @override
  String get sourceCodeTitle => 'Código-fonte (GitHub)';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get imprintTitle => 'Notas legais';

  @override
  String get linkOpenError => 'Não foi possível abrir o link.';

  @override
  String get muteTooltip => 'Explicação sobre silenciar';

  @override
  String get muteInfoContent =>
      'Remove completamente o som do vídeo convertido.\n\nÚtil, por exemplo, para remover ruídos de fundo ou reduzir o tamanho do ficheiro.';

  @override
  String estimatedSize(String size) {
    return 'Tamanho estimado: $size MB';
  }

  @override
  String get convertButton => 'Converter';

  @override
  String get crfLabel => 'Qualidade do vídeo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Qualidade do vídeo';

  @override
  String get crfInfoContent =>
      '0 → sem perdas (ficheiro muito grande)\n18 → visualmente quase sem perdas\n23 → Padrão (bom equilíbrio)\n28 → perdas de qualidade visíveis\n51 → qualidade mais baixa\n\nRecomendação: 18–28';

  @override
  String get resolutionLabel => 'Resolução';

  @override
  String get resolutionInfoTitle => 'Resoluções comuns';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nDica: Deixe um campo em branco = o outro será calculado proporcionalmente.';

  @override
  String get widthLabel => 'Largura';

  @override
  String get heightLabel => 'Altura';

  @override
  String get emptyEqualsOriginal => 'Vazio = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Fotogramas por segundo';

  @override
  String get fpsInfoContent =>
      'Orig → Manter FPS do vídeo original\n24 → Padrão de cinema\n25 → Padrão PAL/TV (Europa)\n30 → NTSC/TV, redes sociais\n60 → Fluido, jogos, desporto';

  @override
  String get audioBitrateLabel => 'Taxa de bits de áudio';

  @override
  String get silent => 'Silêncio';

  @override
  String get audioBitrateInfoContent =>
      'Silêncio → sem áudio\n64 kbps → voz, podcasts\n96 kbps → boa qualidade de voz\n128 kbps → música padrão\n192 kbps → alta qualidade de áudio\n320 kbps → qualidade máxima de MP3';

  @override
  String get audioCodecLabel => 'Codec de áudio';

  @override
  String get audioCodecInfoContent =>
      'AAC → padrão para MP4, melhor compatibilidade\nMP3 → amplamente utilizado, um pouco desatualizado\nOpus → moderno e eficiente, bom para MKV';

  @override
  String get outputFormatLabel => 'Formato de saída';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, melhor compatibilidade\nMKV → flexível, muitos codecs, menos compatível\nMOV → formato Apple/QuickTime\nAVI → desatualizado, ampla compatibilidade\nTS → MPEG Transport Stream, TV/streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'O que significam as resoluções?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → ficheiro muito pequeno,\n por exemplo, para o WhatsApp\n\n480p (854×480) → Definição Padrão (SD)\n\n720p (1280×720) → HD, adequado para dispositivos móveis\n\n1080p (1920×1080) → Full HD, padrão para\n YouTube e TV\n\nAlta/Média/Baixa descreve a qualidade com a mesma resolução — mais alta = ficheiro maior.';

  @override
  String get resolutionTooltip => 'Resoluções explicadas';

  @override
  String get trimArea => 'Área de corte';

  @override
  String trimStartLabel(String time) {
    return 'Início: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Fim: $time';
  }

  @override
  String get adLoading => 'A carregar anúncios…';

  @override
  String get convertedPrefix => 'convertido_';

  @override
  String get removeAdsTitle => 'Remover anúncios';

  @override
  String removeAdsSubtitle(String price) {
    return 'Compra única – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Sem anúncios ✓';

  @override
  String get removeAdsActiveSubtitle => 'Obrigado pelo teu apoio!';

  @override
  String get restorePurchasesTitle => 'Restaurar compra';

  @override
  String get purchaseButton => 'Comprar';

  @override
  String get purchaseError => 'Falha na compra. Por favor, tente novamente.';

  @override
  String get purchaseSuccess => 'Obrigado! A publicidade foi desativada.';

  @override
  String get appName => 'Conversor Vídeo FFmpeg';

  @override
  String get audioOnly => 'Apenas áudio';

  @override
  String get audioOnlyTooltip => 'Explicação do Som apenas';

  @override
  String get audioOnlyInfoContent =>
      'Extraia apenas a faixa de áudio do vídeo – sem imagem.\n\nModo Normal: MP3 a 192 kbps.\nModo Especialista: Codec e taxa de bits a partir das definições de áudio.\n\nÚtil, por exemplo, para guardar música ou podcasts a partir de vídeos.';

  @override
  String get aspectLocked => 'Proporção da imagem bloqueada';

  @override
  String get aspectUnlocked => 'Proporção da imagem livre';

  @override
  String get cpuWarningTitle => 'Ficheiro grande';

  @override
  String get cpuWarningContent =>
      'Este ficheiro tem mais de 200 MB. Em dispositivos mais antigos, a conversão pode causar uma elevada utilização do processador – isto é normal.\n\nPodes simplesmente deixar o telemóvel ao lado, a aplicação continua a funcionar em segundo plano.';

  @override
  String get cpuWarningCheckbox => 'Não mostrar mais';

  @override
  String get storageWarningTitle => 'Espaço de armazenamento insuficiente';

  @override
  String storageWarningContent(String available, String required) {
    return 'O seu dispositivo tem apenas $available MB de espaço livre. São necessários aproximadamente $required MB para a conversão. Por favor, liberte espaço primeiro.';
  }

  @override
  String get feedbackTitle => 'Feedback e Suporte';

  @override
  String get feedbackSubtitle =>
      'Enviar bugs, sugestões de melhorias ou feedback';

  @override
  String get feedbackCategoryLabel => 'Categoria';

  @override
  String get feedbackCategoryBug => 'Reportar bug';

  @override
  String get feedbackCategoryFeature => 'Sugestão de melhoria';

  @override
  String get feedbackCategoryFeedback => 'Feedback geral';

  @override
  String get feedbackMessageHint => 'Descreva o seu problema…';

  @override
  String get feedbackSendButton => 'Enviar';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get qualityLabel => 'Qualidade';

  @override
  String get quality1080pHigh => '1080p Alta';

  @override
  String get quality1080pMedium => '1080p Média';

  @override
  String get quality1080pLow => '1080p Baixa';

  @override
  String get quality1080pVeryLow => '1080p Muito Baixa';

  @override
  String get quality720pHigh => '720p Alta';

  @override
  String get quality720pMedium => '720p Média';

  @override
  String get quality720pLow => '720p Baixa';

  @override
  String get quality720pVeryLow => '720p Muito Baixa';

  @override
  String get quality480pHigh => '480p Alta';

  @override
  String get quality480pMedium => '480p Média';

  @override
  String get quality480pLow => '480p Baixa';

  @override
  String get quality480pVeryLow => '480p Muito Baixa';

  @override
  String get quality360pHigh => ' 360p Alta';

  @override
  String get quality360pMedium => '360p Média';

  @override
  String get quality360pLow => '360p Baixa';

  @override
  String get quality360pVeryLow => '360p Muito Baixa';

  @override
  String get mute => 'Silenciar';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Selecionar vídeo';

  @override
  String get videoLoading => 'Carregando vídeo…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Avançado';

  @override
  String get invalidVideoFile => 'Selecione um arquivo de vídeo válido.';

  @override
  String get fileLoadError =>
      'Não foi possível carregar o arquivo. Selecione um arquivo de vídeo.';

  @override
  String get previewNotAvailable =>
      'Pré-visualização indisponível. O vídeo ainda pode ser convertido.';

  @override
  String get previewNotAvailableLabel =>
      'Pré-visualização indisponível\n(Resolução muito alta para este dispositivo)';

  @override
  String get noVideoLoaded => 'Carregue um vídeo primeiro.';

  @override
  String get cancelConversionTitle => 'Cancelar conversão?';

  @override
  String get cancelConversionContent =>
      'O processamento realizado até agora será perdido.';

  @override
  String get continueConversion => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get discardVideoTitle => 'Descartar vídeo?';

  @override
  String get discardVideoContent =>
      'O vídeo convertido será excluído e não será salvo.';

  @override
  String get keep => 'Manter';

  @override
  String get discard => 'Descartar';

  @override
  String get save => 'Salvar';

  @override
  String get saveVideoDialogTitle => 'Salvar vídeo';

  @override
  String get savedSuccess => 'Salvo!';

  @override
  String get open => 'Abrir';

  @override
  String get saveError =>
      'Erro ao salvar. Talvez não haja espaço de armazenamento suficiente.';

  @override
  String get conversionDone => 'Concluído!';

  @override
  String conversionProgress(String percent) {
    return 'Conversão: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Falha na conversão: $error';
  }

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get licensesTitle => 'Licenças';

  @override
  String get licensesSubtitle => 'Licenças de código aberto deste aplicativo';

  @override
  String get gplLicenseTitle => 'Texto da licença GPL 3.0';

  @override
  String get sourceCodeTitle => 'Código-fonte (GitHub)';

  @override
  String get privacyPolicyTitle => 'Política de Privacidade';

  @override
  String get imprintTitle => 'Notas legais';

  @override
  String get linkOpenError => 'Não foi possível abrir o link.';

  @override
  String get muteTooltip => 'Explicação sobre silenciar';

  @override
  String get muteInfoContent =>
      'Remove completamente o áudio do vídeo convertido.\n\nÚtil, por exemplo, para remover ruídos de fundo ou reduzir o tamanho do arquivo.';

  @override
  String estimatedSize(String size) {
    return 'Tamanho estimado: $size MB';
  }

  @override
  String get convertButton => 'Converter';

  @override
  String get crfLabel => 'Qualidade do vídeo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Qualidade do vídeo';

  @override
  String get crfInfoContent =>
      '0 → sem perdas (arquivo muito grande)\n18 → visualmente quase sem perdas\n23 → Padrão (bom equilíbrio)\n28 → perdas visíveis de qualidade\n51 → qualidade mais baixa\n\nRecomendação: 18–28';

  @override
  String get resolutionLabel => 'Resolução';

  @override
  String get resolutionInfoTitle => 'Resoluções comuns';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nDica: Deixe um campo em branco = o outro será calculado proporcionalmente.';

  @override
  String get widthLabel => 'Largura';

  @override
  String get heightLabel => 'Altura';

  @override
  String get emptyEqualsOriginal => 'Vazio = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Quadros por segundo';

  @override
  String get fpsInfoContent =>
      'Orig → Manter FPS do vídeo original\n24 → Padrão de cinema\n25 → Padrão PAL/TV (Europa)\n30 → NTSC/TV, redes sociais\n60 → Fluidez, jogos, esportes';

  @override
  String get audioBitrateLabel => 'Taxa de bits de áudio';

  @override
  String get silent => 'Silêncio';

  @override
  String get audioBitrateInfoContent =>
      'Silêncio → sem áudio\n64 kbps → voz, podcasts\n96 kbps → boa qualidade de voz\n128 kbps → música padrão\n192 kbps → alta qualidade de áudio\n320 kbps → qualidade máxima de MP3';

  @override
  String get audioCodecLabel => 'Codec de áudio';

  @override
  String get audioCodecInfoContent =>
      'AAC → padrão para MP4, melhor compatibilidade\nMP3 → amplamente utilizado, um pouco desatualizado\nOpus → moderno e eficiente, bom para MKV';

  @override
  String get outputFormatLabel => 'Formato de saída';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, melhor compatibilidade\nMKV → flexível, muitos codecs, menos compatível\nMOV → formato Apple/QuickTime\nAVI → desatualizado, ampla compatibilidade\nTS → MPEG Transport Stream, TV/streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'O que significam as resoluções?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → arquivo muito pequeno,\n por exemplo, para o WhatsApp\n\n480p (854×480) → Definição Padrão (SD)\n\n720p (1280×720) → HD, bom para dispositivos móveis\n\n1080p (1920×1080) → Full HD, padrão para\n YouTube e TV\n\nAlta/Média/Baixa descreve a qualidade na mesma resolução — quanto maior = arquivo maior.';

  @override
  String get resolutionTooltip => 'Resoluções explicadas';

  @override
  String get trimArea => 'Área de corte';

  @override
  String trimStartLabel(String time) {
    return 'Início: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Fim: $time';
  }

  @override
  String get adLoading => 'Carregando anúncios…';

  @override
  String get convertedPrefix => 'convertido_';

  @override
  String get removeAdsTitle => 'Remover anúncios';

  @override
  String removeAdsSubtitle(String price) {
    return 'Compra única – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Sem anúncios ✓';

  @override
  String get removeAdsActiveSubtitle => 'Obrigado pelo seu apoio!';

  @override
  String get restorePurchasesTitle => 'Restaurar compra';

  @override
  String get purchaseButton => 'Comprar';

  @override
  String get purchaseError => 'Falha na compra. Tente novamente.';

  @override
  String get purchaseSuccess => 'Obrigado! Os anúncios foram desativados.';

  @override
  String get appName => 'Conversor Vídeo FFmpeg';

  @override
  String get audioOnly => 'Somente áudio';

  @override
  String get audioOnlyTooltip => 'Explicação sobre Somente Áudio';

  @override
  String get audioOnlyInfoContent =>
      'Extrai apenas a faixa de áudio do vídeo – sem imagem.\n\nModo Normal: MP3 a 192 kbps.\nModo Avançado: Codec e taxa de bits definidos nas configurações de áudio.\n\nÚtil, por exemplo, para salvar músicas ou podcasts de vídeos.';

  @override
  String get aspectLocked => 'Proporção da tela bloqueada';

  @override
  String get aspectUnlocked => 'Proporção da tela livre';

  @override
  String get cpuWarningTitle => 'Arquivo grande';

  @override
  String get cpuWarningContent =>
      'Este arquivo tem mais de 200 MB. Em aparelhos mais antigos, a conversão pode causar alta utilização do processador – isso é normal.\n\nVocê pode simplesmente deixar o celular ao lado, o aplicativo continuará rodando em segundo plano.';

  @override
  String get cpuWarningCheckbox => 'Não mostrar mais';

  @override
  String get storageWarningTitle => 'Espaço de armazenamento insuficiente';

  @override
  String storageWarningContent(String available, String required) {
    return 'Seu dispositivo tem apenas $available MB de espaço livre. A conversão requer aproximadamente $required MB. Por favor, libere espaço primeiro.';
  }

  @override
  String get feedbackTitle => 'Feedback e suporte';

  @override
  String get feedbackSubtitle =>
      'Enviar bugs, sugestões de melhorias ou feedback';

  @override
  String get feedbackCategoryLabel => 'Categoria';

  @override
  String get feedbackCategoryBug => 'Relatar bug';

  @override
  String get feedbackCategoryFeature => 'Sugestão de melhoria';

  @override
  String get feedbackCategoryFeedback => 'Feedback geral';

  @override
  String get feedbackMessageHint => 'Descreva sua solicitação…';

  @override
  String get feedbackSendButton => 'Enviar';
}
