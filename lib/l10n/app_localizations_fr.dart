// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get qualityLabel => 'Qualité';

  @override
  String get quality1080pHigh => '1080p Haute';

  @override
  String get quality1080pMedium => '1080p Moyenne';

  @override
  String get quality1080pLow => '1080p Faible';

  @override
  String get quality1080pVeryLow => '1080p Très faible';

  @override
  String get quality720pHigh => '720p Élevé';

  @override
  String get quality720pMedium => '720p Moyen';

  @override
  String get quality720pLow => '720p Faible';

  @override
  String get quality720pVeryLow => '720p Très faible';

  @override
  String get quality480pHigh => '480p Élevé';

  @override
  String get quality480pMedium => '480p Moyen';

  @override
  String get quality480pLow => '480p Faible';

  @override
  String get quality480pVeryLow => '480p Très faible';

  @override
  String get quality360pHigh => ' 360p Élevée';

  @override
  String get quality360pMedium => '360p Moyenne';

  @override
  String get quality360pLow => '360p Faible';

  @override
  String get quality360pVeryLow => '360p Très faible';

  @override
  String get mute => 'Couper le son';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Sélectionner une vidéo';

  @override
  String get videoLoading => 'Chargement de la vidéo…';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeExpert => 'Expert';

  @override
  String get invalidVideoFile =>
      'Veuillez sélectionner un fichier vidéo valide.';

  @override
  String get fileLoadError =>
      'Impossible de charger le fichier. Veuillez sélectionner un fichier vidéo.';

  @override
  String get previewNotAvailable =>
      'Aperçu indisponible. La vidéo peut tout de même être convertie.';

  @override
  String get previewNotAvailableLabel =>
      'Aperçu indisponible\n(Résolution trop élevée pour cet appareil)';

  @override
  String get noVideoLoaded => 'Veuillez d\'abord charger une vidéo.';

  @override
  String get cancelConversionTitle => 'Annuler la conversion ?';

  @override
  String get cancelConversionContent =>
      'Le traitement effectué jusqu\'à présent sera perdu.';

  @override
  String get continueConversion => 'Continuer';

  @override
  String get cancel => 'Annuler';

  @override
  String get discardVideoTitle => 'Supprimer la vidéo ?';

  @override
  String get discardVideoContent =>
      'La vidéo convertie sera supprimée et ne sera pas enregistrée.';

  @override
  String get keep => 'Conserver';

  @override
  String get discard => 'Ignorer';

  @override
  String get save => 'Enregistrer';

  @override
  String get saveVideoDialogTitle => 'Enregistrer la vidéo';

  @override
  String get savedSuccess => 'Enregistré !';

  @override
  String get open => 'Ouvrir';

  @override
  String get saveError =>
      'Erreur lors de l\'enregistrement. Espace de stockage insuffisant.';

  @override
  String get conversionDone => 'Terminé !';

  @override
  String conversionProgress(String percent) {
    return 'Conversion : $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Échec de la conversion : $error';
  }

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get licensesTitle => 'Licences';

  @override
  String get licensesSubtitle => 'Licences open source de cette application';

  @override
  String get gplLicenseTitle => 'Texte de la licence GPL 3.0';

  @override
  String get sourceCodeTitle => 'Code source (GitHub)';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String get imprintTitle => 'Mentions légales';

  @override
  String get linkOpenError => 'Impossible d\'ouvrir le lien.';

  @override
  String get muteTooltip => 'Explication de la fonction Muet';

  @override
  String get muteInfoContent =>
      'Supprime complètement le son de la vidéo convertie.\n\nUtile, par exemple, pour supprimer les bruits de fond ou réduire la taille du fichier.';

  @override
  String estimatedSize(String size) {
    return 'Taille estimée : $size Mo';
  }

  @override
  String get convertButton => 'Convertir';

  @override
  String get crfLabel => 'Qualité vidéo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Qualité vidéo';

  @override
  String get crfInfoContent =>
      '0 → sans perte (fichier très volumineux)\n18 → pratiquement sans perte visuelle\n23 → standard (bon équilibre)\n28 → perte de qualité visible\n51 → qualité la plus basse\n\nRecommandation : 18–28';

  @override
  String get resolutionLabel => 'Résolution';

  @override
  String get resolutionInfoTitle => 'Résolutions courantes';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nAstuce : laisser un champ vide = l\'autre est calculé proportionnellement.';

  @override
  String get widthLabel => 'Largeur';

  @override
  String get heightLabel => 'Hauteur';

  @override
  String get emptyEqualsOriginal => 'Vide = Original';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Images par seconde';

  @override
  String get fpsInfoContent =>
      'Orig → Conserver le FPS de la vidéo source\n24 → Norme cinéma\n25 → Norme PAL/TV (Europe)\n30 → NTSC/TV, réseaux sociaux\n60 → Fluide, jeux vidéo, sport';

  @override
  String get audioBitrateLabel => 'Débit audio';

  @override
  String get silent => 'Silence';

  @override
  String get audioBitrateInfoContent =>
      'Silence → pas d\'audio\n64 kbps → voix, podcasts\n96 kbps → bonne qualité vocale\n128 kbps → musique standard\n192 kbps → haute qualité audio\n320 kbps → qualité MP3 maximale';

  @override
  String get audioCodecLabel => 'Codec audio';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard pour MP4, meilleure compatibilité\nMP3 → très répandu, légèrement obsolète\nOpus → moderne et efficace, adapté au format MKV';

  @override
  String get outputFormatLabel => 'Format de sortie';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universel, meilleure compatibilité\nMKV → flexible, nombreux codecs, moins compatible\nMOV → format Apple/QuickTime\nAVI → obsolète, large compatibilité\nTS → flux de transport MPEG, TV/streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Que signifient les résolutions ?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → fichier très petit,\n par exemple pour WhatsApp\n\n480p (854×480) → définition standard (SD)\n\n720p (1280×720) → HD, adapté aux appareils mobiles\n\n1080p (1920×1080) → Full HD, standard pour\n YouTube et la télévision\n\nHaut/Moyen/Bas décrit la qualité pour une même résolution — plus haut = fichier plus volumineux.';

  @override
  String get resolutionTooltip => 'Explication des résolutions';

  @override
  String get trimArea => 'Zone de découpe';

  @override
  String trimStartLabel(String time) {
    return 'Début : $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Fin : $time';
  }

  @override
  String get adLoading => 'Chargement des publicités…';

  @override
  String get convertedPrefix => 'converti_';

  @override
  String get removeAdsTitle => 'Supprimer les publicités';

  @override
  String removeAdsSubtitle(String price) {
    return 'Achat unique – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Sans publicité ✓';

  @override
  String get removeAdsActiveSubtitle => 'Merci pour ton soutien !';

  @override
  String get restorePurchasesTitle => 'Restaurer l\'achat';

  @override
  String get purchaseButton => 'Acheter';

  @override
  String get purchaseError => 'Échec de l\'achat. Veuillez réessayer.';

  @override
  String get purchaseSuccess => 'Merci ! Les publicités ont été désactivées.';

  @override
  String get appName => 'Convertisseur Vidéo FFmpeg';

  @override
  String get audioOnly => 'Audio uniquement';

  @override
  String get audioOnlyTooltip => 'Explication de l\'option Audio uniquement';

  @override
  String get audioOnlyInfoContent =>
      'Extrait uniquement la piste audio de la vidéo – pas d\'image.\n\nMode Normal : MP3 à 192 kbps.\nMode Expert : codec et débit binaire définis dans les paramètres audio.\n\nUtile pour enregistrer, par exemple, de la musique ou des podcasts à partir de vidéos.';
}
