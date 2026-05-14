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
  String get quality2160pHigh => '2160p Alta';

  @override
  String get quality2160pMedium => '2160p Média';

  @override
  String get quality2160pLow => '2160p Baixa';

  @override
  String get quality2160pVeryLow => '2160p Muito Baixa';

  @override
  String get quality1440pHigh => '1440p Alta';

  @override
  String get quality1440pMedium => '1440p Média';

  @override
  String get quality1440pLow => '1440p Baixa';

  @override
  String get quality1440pVeryLow => '1440p Muito Baixa';

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
  String get openGallery => 'Abrir galeria';

  @override
  String get openVideo => 'Abrir vídeo';

  @override
  String get autoSaveTitle => 'Guardar automaticamente os vídeos na galeria';

  @override
  String get autoSaveSubtitle =>
      'Os vídeos são guardados automaticamente após a conversão.';

  @override
  String get saveError =>
      'Erro ao guardar. Talvez não haja espaço de armazenamento suficiente.';

  @override
  String get saveErrorOutOfMemory =>
      'Não há memória suficiente para guardar este ficheiro. Tente um vídeo mais curto ou com qualidade inferior.';

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
  String get adConsentTitle => 'Configurações de privacidade';

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
  String get encodingModeLabel => 'Modo de codificação';

  @override
  String get encodingModeCrf => 'Qualidade (CRF)';

  @override
  String get encodingModeBitrate => 'Taxa de bits';

  @override
  String get crfLabel => 'Qualidade do vídeo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Qualidade do vídeo';

  @override
  String get crfInfoContent =>
      '0 → sem perdas (ficheiro muito grande)\n18 → visualmente quase sem perdas\n23 → Padrão (bom equilíbrio)\n28 → perdas de qualidade visíveis\n51 → qualidade mais baixa\n\nRecomendação: 18–28';

  @override
  String get targetBitrateLabel => 'Taxa de bits de destino';

  @override
  String get targetBitrateInfoTitle => 'Taxa de bits de destino';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps  → compressão elevada, mensagens\n4–8 Mbps → 1080p qualidade normal/boa\n12 Mbps → 1080p alta / 4K baixa qualidade\n20 Mbps → qualidade de streaming 4K\n\nEntrada personalizada: 500–40000 kbps ou, por exemplo, «8 Mbps»\n\nAo contrário do CRF, a qualidade pode variar entre cenas. Use o CRF para obter melhores resultados com o mesmo tamanho de ficheiro.';

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
  String get audioChannelsLabel => 'Canais de áudio';

  @override
  String get audioChannelsInfoContent =>
      'Original → mantém a disposição dos canais da fonte\nEstéreo → 2.0 (downmix, se necessário)\nMono → 1 canal (ficheiro mais pequeno)\n5.1 → som surround de 6 canais (apenas para fontes surround)\n\nO downmix (por exemplo, 5.1 → Estéreo) é suportado. O upmix não está disponível.';

  @override
  String get audioChannelOriginal => 'Original';

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
  String get appName => 'Conversor de Vídeo';

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
      'Este vídeo tem mais de 5 minutos. Em dispositivos mais antigos, a conversão pode causar uma elevada utilização do processador – isto é normal.\n\nPodes simplesmente deixar o telemóvel ao lado, a aplicação continua a funcionar em segundo plano.';

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

  @override
  String get notificationPermissionTitle => 'Conversão em segundo plano';

  @override
  String get notificationPermissionContent =>
      'Permita notificações para que a conversão possa continuar enquanto utiliza outras aplicações. Sem esta autorização, a aplicação tem de permanecer aberta.';

  @override
  String get notificationPermissionNotNow => 'Não agora';

  @override
  String get notificationPermissionAllow => 'Permitir';

  @override
  String get notificationPermissionDenied =>
      'Ative as notificações nas definições de conversão em segundo plano.';

  @override
  String get notificationPermissionOpenSettings => 'Definições';

  @override
  String get backButton => 'Voltar';

  @override
  String get appSettingsTitle => 'Definições da aplicação';

  @override
  String get appSettingsSubtitle =>
      'Definições de gravação automática e privacidade';

  @override
  String get openSourceTitle => 'Código aberto';

  @override
  String get openSourceSubtitle => 'Licenças e código-fonte';

  @override
  String get openSourceLicensesTitle => 'Licenças de código aberto';

  @override
  String get legalSectionTitle => 'Legal';

  @override
  String get proSectionTitle => 'Pro';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get qualityLabel => 'Qualidade';

  @override
  String get quality2160pHigh => '2160p Alta';

  @override
  String get quality2160pMedium => '2160p Média';

  @override
  String get quality2160pLow => '2160p Baixa';

  @override
  String get quality2160pVeryLow => '2160p Muito Baixa';

  @override
  String get quality1440pHigh => '1440p Alta';

  @override
  String get quality1440pMedium => '1440p Média';

  @override
  String get quality1440pLow => '1440p Baixa';

  @override
  String get quality1440pVeryLow => '1440p Muito Baixa';

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
  String get openGallery => 'Abrir galeria';

  @override
  String get openVideo => 'Abrir vídeo';

  @override
  String get autoSaveTitle => 'Salvar vídeos automaticamente na galeria';

  @override
  String get autoSaveSubtitle =>
      'Os vídeos são salvos automaticamente após a conversão.';

  @override
  String get saveError =>
      'Erro ao salvar. Talvez não haja espaço de armazenamento suficiente.';

  @override
  String get saveErrorOutOfMemory =>
      'Não há memória suficiente para salvar este arquivo. Tente usar um clipe mais curto ou reduzir a qualidade.';

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
  String get adConsentTitle => 'Configurações de privacidade';

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
  String get encodingModeLabel => 'Modo de codificação';

  @override
  String get encodingModeCrf => 'Qualidade (CRF)';

  @override
  String get encodingModeBitrate => 'Taxa de bits';

  @override
  String get crfLabel => 'Qualidade do vídeo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Qualidade do vídeo';

  @override
  String get crfInfoContent =>
      '0 → sem perdas (arquivo muito grande)\n18 → visualmente quase sem perdas\n23 → Padrão (bom equilíbrio)\n28 → perdas visíveis de qualidade\n51 → qualidade mais baixa\n\nRecomendação: 18–28';

  @override
  String get targetBitrateLabel => 'Taxa de bits alvo';

  @override
  String get targetBitrateInfoTitle => 'Taxa de bits alvo';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps  → compressão pesada, mensagens\n4–8 Mbps → 1080p qualidade normal/boa\n12 Mbps → 1080p alta / 4K baixa qualidade\n20 Mbps → qualidade de streaming 4K\n\nEntrada personalizada: 500–40.000 kbps ou, por exemplo, “8 Mbps”\n\nAo contrário do CRF, a qualidade pode variar entre as cenas. Use o CRF para obter melhores resultados com o mesmo tamanho de arquivo.';

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
  String get audioChannelsLabel => 'Canais de áudio';

  @override
  String get audioChannelsInfoContent =>
      'Original → mantém a configuração dos canais da fonte\nEstéreo → 2.0 (downmix se necessário)\nMono → 1 canal (arquivo menor)\n5.1 → surround de 6 canais (apenas para fontes surround)\n\nO downmix (por exemplo, 5.1 → Estéreo) é compatível. O upmix não é oferecido.';

  @override
  String get audioChannelOriginal => 'Original';

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
  String get appName => 'Conversor de Vídeo';

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
      'Este vídeo tem mais de 5 minutos. Em aparelhos mais antigos, a conversão pode causar alta utilização do processador – isso é normal.\n\nVocê pode simplesmente deixar o celular ao lado, o aplicativo continuará rodando em segundo plano.';

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

  @override
  String get notificationPermissionTitle => 'Conversão em segundo plano';

  @override
  String get notificationPermissionContent =>
      'Permita notificações para que a conversão continue enquanto você usa outros aplicativos. Sem essa permissão, o aplicativo precisa permanecer aberto.';

  @override
  String get notificationPermissionNotNow => 'Não agora';

  @override
  String get notificationPermissionAllow => 'Permitir';

  @override
  String get notificationPermissionDenied =>
      'Ative as notificações nas configurações de conversão em segundo plano.';

  @override
  String get notificationPermissionOpenSettings => 'Configurações';

  @override
  String get backButton => 'Voltar';

  @override
  String get appSettingsTitle => 'Configurações do aplicativo';

  @override
  String get appSettingsSubtitle =>
      'Configurações de salvamento automático e privacidade';

  @override
  String get openSourceTitle => 'Código aberto';

  @override
  String get openSourceSubtitle => 'Licenças e código-fonte';

  @override
  String get openSourceLicensesTitle => 'Licenças de código aberto';

  @override
  String get legalSectionTitle => 'Legal';

  @override
  String get proSectionTitle => 'Pro';
}
