// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get qualityLabel => 'Calidad';

  @override
  String get quality2160pHigh => '2160p Alta';

  @override
  String get quality2160pMedium => '2160p Media';

  @override
  String get quality2160pLow => '2160p Baja';

  @override
  String get quality2160pVeryLow => '2160p Muy baja';

  @override
  String get quality1440pHigh => '1440p Alta';

  @override
  String get quality1440pMedium => '1440p Media';

  @override
  String get quality1440pLow => '1440p Baja';

  @override
  String get quality1440pVeryLow => '1440p Muy baja';

  @override
  String get quality1080pHigh => '1080p Alta';

  @override
  String get quality1080pMedium => '1080p Media';

  @override
  String get quality1080pLow => '1080p Baja';

  @override
  String get quality1080pVeryLow => '1080p Muy baja';

  @override
  String get quality720pHigh => '720p Alta';

  @override
  String get quality720pMedium => '720p Media';

  @override
  String get quality720pLow => '720p Baja';

  @override
  String get quality720pVeryLow => '720p Muy baja';

  @override
  String get quality480pHigh => '480p Alta';

  @override
  String get quality480pMedium => '480p Media';

  @override
  String get quality480pLow => '480p Baja';

  @override
  String get quality480pVeryLow => '480p Muy baja';

  @override
  String get quality360pHigh => ' 360p Alta';

  @override
  String get quality360pMedium => '360p Media';

  @override
  String get quality360pLow => '360p Baja';

  @override
  String get quality360pVeryLow => '360p Muy baja';

  @override
  String get mute => 'Silenciar';

  @override
  String get ok => 'Aceptar';

  @override
  String get selectVideo => 'Seleccionar vídeo';

  @override
  String get videoLoading => 'Cargando vídeo…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Experto';

  @override
  String get invalidVideoFile => 'Selecciona un archivo de vídeo válido.';

  @override
  String get fileLoadError =>
      'No se ha podido cargar el archivo. Seleccione un archivo de vídeo.';

  @override
  String get previewNotAvailable =>
      'Vista previa no disponible. Aun así, el vídeo se puede convertir.';

  @override
  String get previewNotAvailableLabel =>
      'Vista previa no disponible\n(Resolución demasiado alta para este dispositivo)';

  @override
  String get noVideoLoaded => 'Cargue primero un vídeo.';

  @override
  String get cancelConversionTitle => '¿Cancelar la conversión?';

  @override
  String get cancelConversionContent =>
      'Se perderá el procesamiento realizado hasta ahora.';

  @override
  String get continueConversion => 'Continuar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get discardVideoTitle => '¿Descartar el vídeo?';

  @override
  String get discardVideoContent =>
      'El vídeo convertido se eliminará y no se guardará.';

  @override
  String get keep => 'Conservar';

  @override
  String get discard => 'Descartar';

  @override
  String get save => 'Guardar';

  @override
  String get saveVideoDialogTitle => 'Guardar vídeo';

  @override
  String get savedSuccess => '¡Guardado!';

  @override
  String get open => 'Abrir';

  @override
  String get openGallery => 'Abrir galería';

  @override
  String get openVideo => 'Abrir vídeo';

  @override
  String get autoSaveTitle =>
      'Guardar automáticamente los vídeos en la galería';

  @override
  String get autoSaveSubtitle =>
      'Los vídeos se guardan automáticamente tras la conversión.';

  @override
  String get saveError =>
      'Error al guardar. Es posible que no haya suficiente espacio de almacenamiento.';

  @override
  String get saveErrorOutOfMemory =>
      'No hay memoria suficiente para guardar este archivo. Prueba con un clip más corto o con una calidad inferior.';

  @override
  String get conversionDone => '¡Listo!';

  @override
  String conversionProgress(String percent) {
    return 'Conversión: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Error en la conversión: $error';
  }

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get licensesTitle => 'Licencias';

  @override
  String get licensesSubtitle =>
      'Licencias de código abierto de esta aplicación';

  @override
  String get gplLicenseTitle => 'Texto de la licencia GPL-3.0';

  @override
  String get sourceCodeTitle => 'Código fuente (GitHub)';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get adConsentTitle => 'Configuración de privacidad';

  @override
  String get imprintTitle => 'Aviso legal';

  @override
  String get linkOpenError => 'No se ha podido abrir el enlace.';

  @override
  String get muteTooltip => 'Explicación de la función de silenciar';

  @override
  String get muteInfoContent =>
      'Elimina completamente el sonido del vídeo convertido.\n\nÚtil, por ejemplo, para eliminar ruidos de fondo o reducir el tamaño del archivo.';

  @override
  String estimatedSize(String size) {
    return 'Tamaño estimado: $size MB';
  }

  @override
  String get convertButton => 'Convertir';

  @override
  String get encodingModeLabel => 'Modo de codificación';

  @override
  String get encodingModeCrf => 'Calidad (CRF)';

  @override
  String get encodingModeBitrate => 'Velocidad de bits';

  @override
  String get crfLabel => 'Calidad de vídeo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Calidad de vídeo';

  @override
  String get crfInfoContent =>
      '0 → sin pérdidas (archivo muy grande)\n18 → prácticamente sin pérdidas visuales\n23 → Estándar (buen equilibrio)\n28 → Pérdida de calidad visible\n51 → Calidad más baja\n\nRecomendación: 18–28';

  @override
  String get targetBitrateLabel => 'Velocidad de bits de destino';

  @override
  String get targetBitrateInfoTitle => 'Velocidad de bits de destino';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps  → compresión intensa, mensajería\n4–8 Mbps → 1080p calidad normal/buena\n12 Mbps → 1080p alta / 4K baja calidad\n20 Mbps → calidad de streaming 4K\n\nEntrada personalizada: 500–40 000 kbps o, por ejemplo, «8 Mbps»\n\nA diferencia del CRF, la calidad puede variar entre escenas. Utiliza el CRF para obtener mejores resultados con el mismo tamaño de archivo.';

  @override
  String get resolutionLabel => 'Resolución';

  @override
  String get resolutionInfoTitle => 'Resoluciones habituales';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nConsejo: Deja un campo en blanco = el otro se calculará proporcionalmente.';

  @override
  String get widthLabel => 'Ancho';

  @override
  String get heightLabel => 'Altura';

  @override
  String get emptyEqualsOriginal => 'Vacío = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Fotogramas por segundo';

  @override
  String get fpsInfoContent =>
      'Orig → Mantener los FPS del vídeo original\n24 → Estándar de cine\n25 → Estándar PAL/TV (Europa)\n30 → NTSC/TV, redes sociales\n60 → Fluido, videojuegos, deportes';

  @override
  String get audioBitrateLabel => 'Velocidad de bits de audio';

  @override
  String get silent => 'Silencio';

  @override
  String get audioBitrateInfoContent =>
      'Silencio → sin audio\n64 kbps → voz, podcasts\n96 kbps → buena calidad de voz\n128 kbps → música estándar\n192 kbps → alta calidad de audio\n320 kbps → máxima calidad MP3';

  @override
  String get audioCodecLabel => 'Códec de audio';

  @override
  String get audioCodecInfoContent =>
      'AAC → Estándar para MP4, mejor compatibilidad\nMP3 → Muy extendido, algo obsoleto\nOpus → Moderno y eficiente, ideal para MKV';

  @override
  String get audioChannelsLabel => 'Canales de audio';

  @override
  String get audioChannelsInfoContent =>
      'Original → mantener la disposición de canales de la fuente\nEstéreo → 2.0 (mezcla descendente si es necesario)\nMono → 1 canal (archivo más pequeño)\n5.1 → sonido envolvente de 6 canales (solo para fuentes envolventes)\n\nLa mezcla descendente (p. ej., 5.1 → estéreo) es compatible. No se ofrece mezcla ascendente.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get outputFormatLabel => 'Formato de salida';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universal, mejor compatibilidad\nMKV → flexible, muchos códecs, menos compatible\nMOV → formato Apple/QuickTime\nAVI → obsoleto, amplia compatibilidad\nTS → flujo de transporte MPEG, TV/streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => '¿Qué significan las resoluciones?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → archivo muy pequeño,\n p. ej., para WhatsApp\n\n480p (854×480) → definición estándar (SD)\n\n720p (1280×720) → HD, adecuado para dispositivos móviles\n\n1080p (1920×1080) → Full HD, estándar para\n YouTube y TV\n\nAlta/Media/Baja describe la calidad con la misma resolución — mayor = archivo más grande.';

  @override
  String get resolutionTooltip => 'Explicación de las resoluciones';

  @override
  String get trimArea => 'Área de recorte';

  @override
  String trimStartLabel(String time) {
    return 'Inicio: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Fin: $time';
  }

  @override
  String get adLoading => 'Cargando anuncios…';

  @override
  String get convertedPrefix => 'convertido_';

  @override
  String get removeAdsTitle => 'Eliminar anuncios';

  @override
  String removeAdsSubtitle(String price) {
    return 'Compra única – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Sin anuncios ✓';

  @override
  String get removeAdsActiveSubtitle => '¡Gracias por tu apoyo!';

  @override
  String get restorePurchasesTitle => 'Restaurar compra';

  @override
  String get purchaseButton => 'Comprar';

  @override
  String get purchaseError => 'Error en la compra. Inténtalo de nuevo.';

  @override
  String get purchaseSuccess => '¡Gracias! Se ha desactivado la publicidad.';

  @override
  String get appName => 'Convertidor de Video';

  @override
  String get audioOnly => 'Solo audio';

  @override
  String get audioOnlyTooltip => 'Explicación de Solo audio';

  @override
  String get audioOnlyInfoContent =>
      'Extrae solo la pista de audio del vídeo, sin imagen.\n\nModo normal: MP3 a 192 kbps.\nModo experto: códec y velocidad de bits según la configuración de audio.\n\nÚtil, por ejemplo, para guardar música o podcasts de vídeos.';

  @override
  String get aspectLocked => 'Relación de aspecto bloqueada';

  @override
  String get aspectUnlocked => 'Relación de aspecto libre';

  @override
  String get cpuWarningTitle => 'Archivo grande';

  @override
  String get cpuWarningContent =>
      'Este vídeo tiene una duración superior a 5 minutos. En dispositivos antiguos, la conversión puede provocar una elevada carga del procesador; esto es normal.\n\nPuedes dejar el móvil a un lado, la aplicación seguirá funcionando en segundo plano.';

  @override
  String get cpuWarningCheckbox => 'No volver a mostrar';

  @override
  String get storageWarningTitle =>
      'No hay suficiente espacio de almacenamiento';

  @override
  String storageWarningContent(String available, String required) {
    return 'Tu dispositivo solo tiene $available MB libres. Para la conversión se necesitan aprox. $required MB. Por favor, libera espacio primero.';
  }

  @override
  String get feedbackTitle => 'Comentarios y asistencia';

  @override
  String get feedbackSubtitle =>
      'Enviar errores, sugerencias de mejora o comentarios';

  @override
  String get feedbackCategoryLabel => 'Categoría';

  @override
  String get feedbackCategoryBug => 'Informar de un error';

  @override
  String get feedbackCategoryFeature => 'Sugerencia de mejora';

  @override
  String get feedbackCategoryFeedback => 'Comentarios generales';

  @override
  String get feedbackMessageHint => 'Describe tu consulta…';

  @override
  String get feedbackSendButton => 'Enviar';

  @override
  String get notificationPermissionTitle => 'Conversión en segundo plano';

  @override
  String get notificationPermissionContent =>
      'Permite las notificaciones para que la conversión pueda continuar mientras utilizas otras aplicaciones. Sin este permiso, la aplicación deberá permanecer abierta.';

  @override
  String get notificationPermissionNotNow => 'Ahora no';

  @override
  String get notificationPermissionAllow => 'Permitir';

  @override
  String get notificationPermissionDenied =>
      'Activa las notificaciones en los ajustes de conversión en segundo plano.';

  @override
  String get notificationPermissionOpenSettings => 'Ajustes';

  @override
  String get backButton => 'Atrás';

  @override
  String get appSettingsTitle => 'Configuración de la aplicación';

  @override
  String get appSettingsSubtitle =>
      'Configuración de guardado automático y privacidad';

  @override
  String get openSourceTitle => 'Código abierto';

  @override
  String get openSourceSubtitle => 'Licencias y código fuente';

  @override
  String get openSourceLicensesTitle => 'Licencias de código abierto';

  @override
  String get legalSectionTitle => 'Aviso legal';

  @override
  String get proSectionTitle => 'Pro';
}
