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
  String get saveError =>
      'Error al guardar. Es posible que no haya suficiente espacio de almacenamiento.';

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
  String get crfLabel => 'Calidad de vídeo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Calidad de vídeo';

  @override
  String get crfInfoContent =>
      '0 → sin pérdidas (archivo muy grande)\n18 → prácticamente sin pérdidas visuales\n23 → Estándar (buen equilibrio)\n28 → Pérdida de calidad visible\n51 → Calidad más baja\n\nRecomendación: 18–28';

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
  String get appName => 'Convertidor vídeo FFmpeg';

  @override
  String get audioOnly => 'Solo audio';

  @override
  String get audioOnlyTooltip => 'Explicación de Solo audio';

  @override
  String get audioOnlyInfoContent =>
      'Extrae solo la pista de audio del vídeo, sin imagen.\n\nModo normal: MP3 a 192 kbps.\nModo experto: códec y velocidad de bits según la configuración de audio.\n\nÚtil, por ejemplo, para guardar música o podcasts de vídeos.';
}
