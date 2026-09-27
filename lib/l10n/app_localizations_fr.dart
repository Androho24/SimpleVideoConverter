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
  String get quality2160pHigh => '2160p Haute';

  @override
  String get quality2160pMedium => '2160p Moyenne';

  @override
  String get quality2160pLow => '2160p Faible';

  @override
  String get quality2160pVeryLow => '2160p Très faible';

  @override
  String get quality1440pHigh => '1440p Haute';

  @override
  String get quality1440pMedium => '1440p Moyenne';

  @override
  String get quality1440pLow => '1440p Faible';

  @override
  String get quality1440pVeryLow => '1440p Très faible';

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
  String get openGallery => 'Ouvrir la galerie';

  @override
  String get openVideo => 'Ouvrir la vidéo';

  @override
  String get autoSaveTitle =>
      'Enregistrer automatiquement les vidéos dans la galerie';

  @override
  String get autoSaveSubtitle =>
      'Les vidéos sont enregistrées automatiquement après la conversion.';

  @override
  String get videoCodecTitle => 'Codec vidéo';

  @override
  String get videoCodecSubtitle =>
      'Codec vidéo pour les conversions en mode normal';

  @override
  String get videoCodecInfoTitle => 'H.264 ou H.265/HEVC ?';

  @override
  String get videoCodecInfoContent =>
      'H.264 offre la meilleure compatibilité et une conversion généralement plus rapide.\n\nH.265/HEVC peut produire des fichiers plus petits avec une qualité d’image comparable, mais la conversion prend plus de temps. Les appareils ou applications plus anciens peuvent ne pas lire le résultat.\n\nLes deux encodeurs sont inclus dans l’application et ne dépendent pas des codecs installés sur l’appareil.';

  @override
  String get saveError =>
      'Erreur lors de l\'enregistrement. Espace de stockage insuffisant.';

  @override
  String get saveErrorOutOfMemory =>
      'Il n\'y a pas assez de mémoire pour enregistrer ce fichier. Essayez avec un clip plus court ou une qualité inférieure.';

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
  String get adConsentTitle => 'Paramètres de confidentialité';

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
  String get crfInfoContentWideScale =>
      '0 → sans perte (fichier très volumineux)\n25 → pratiquement sans perte visuelle\n30 → standard (bon équilibre)\n38 → perte de qualité visible\n63 → qualité la plus basse\n\nRecommandation : 25–38\n\nVP9 et AV1 utilisent une échelle de 0 à 63 : le même chiffre correspond à une qualité différente qu’avec H.264/H.265.';

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
  String get expertVideoCodecInfoContent =>
      'H.264 → meilleure compatibilité et encodage généralement plus rapide\nH.265 → fichiers plus petits à qualité comparable, encodage plus lent\nVP9 → codec ouvert efficace pour WebM et MKV, encodage logiciel plus lent\nAV1 → meilleure compression, encodage uniquement logiciel, expérimental\nXvid → ancien codec MPEG-4 pour AVI et lecteurs anciens\n\nLes formats de sortie disponibles dépendent des codecs vidéo et audio sélectionnés.';

  @override
  String get xvidLegacyLabel => 'Xvid (ancien)';

  @override
  String get av1SlowHint =>
      'L\'AV1 est encodé uniquement en logiciel et est nettement plus lent que H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Au-delà de 720p, il vaut mieux réduire la résolution au préalable.';

  @override
  String get av1ExperimentalTitle => 'AV1 (expérimental)';

  @override
  String get av1ExperimentalSubtitle =>
      'Ajoute l\'AV1 à la sélection de codecs dans les modes normal et expert. Codec moderne et très efficace, pas encore entièrement éprouvé.';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard pour MP4, meilleure compatibilité\nMP3 → codec ancien très répandu\nOpus → moderne et efficace, idéal pour WebM et MKV\nAC3 → Dolby Digital, uniquement pour les sources surround (≥ 3 canaux)\nVorbis → codec ouvert pour WebM et MKV\n\nLes formats de sortie incompatibles sont automatiquement désactivés.';

  @override
  String get outputFormatLabel => 'Format de sortie';

  @override
  String get outputFormatInfoContent =>
      'MP4 → universel, meilleure compatibilité\nMKV → conteneur flexible pour tous les codecs proposés\nMOV → flux de travail Apple/QuickTime\nAVI → ancien format avec Xvid\nMPEG-TS → flux de transport pour la TV et le streaming\nWebM → format web moderne avec VP9 et Opus ou Vorbis\n\nLes formats incompatibles apparaissent estompés. Leur sélection applique automatiquement le codec vidéo par défaut et, si nécessaire, un codec audio compatible.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec est pris en charge par : $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Le format de sortie a été remplacé par $format.';
  }

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
  String get appName => 'Convertisseur Vidéo';

  @override
  String get audioOnly => 'Audio uniquement';

  @override
  String get audioOnlyTooltip => 'Explication de l\'option Audio uniquement';

  @override
  String get audioOnlyInfoContent =>
      'Extrait uniquement la piste audio de la vidéo – pas d\'image.\n\nMode Normal : MP3 à 192 kbps.\nMode Expert : codec et débit binaire définis dans les paramètres audio.\n\nUtile pour enregistrer, par exemple, de la musique ou des podcasts à partir de vidéos.';

  @override
  String get aspectLocked => 'Format d\'image verrouillé';

  @override
  String get aspectUnlocked => 'Format d\'image libre';

  @override
  String get cpuWarningTitle => 'Fichier volumineux';

  @override
  String get cpuWarningContent =>
      'Cette vidéo dépasse 5 minutes. Sur les appareils plus anciens, la conversion peut entraîner une utilisation élevée du processeur – c\'est normal.\n\nTu peux simplement poser ton téléphone à côté, l\'application continue de fonctionner en arrière-plan.';

  @override
  String get cpuWarningCheckbox => 'Ne plus afficher';

  @override
  String get storageWarningTitle => 'Espace de stockage insuffisant';

  @override
  String storageWarningContent(String available, String required) {
    return 'Il ne reste plus que $available Mo d\'espace libre sur votre appareil. La conversion nécessite environ $required Mo. Veuillez libérer de l\'espace au préalable.';
  }

  @override
  String get feedbackTitle => 'Commentaires et assistance';

  @override
  String get feedbackSubtitle =>
      'Signaler des bugs, proposer des améliorations ou envoyer des commentaires';

  @override
  String get feedbackCategoryLabel => 'Catégorie';

  @override
  String get feedbackCategoryBug => 'Signaler un bug';

  @override
  String get feedbackCategoryFeature => 'Suggestion d\'amélioration';

  @override
  String get feedbackCategoryFeedback => 'Commentaires généraux';

  @override
  String get feedbackMessageHint => 'Décrivez votre demande…';

  @override
  String get feedbackSendButton => 'Envoyer';

  @override
  String get notificationPermissionTitle => 'Conversion en arrière-plan';

  @override
  String get notificationPermissionContent =>
      'Autorisez les notifications pour que la conversion puisse se poursuivre pendant que vous utilisez d\'autres applications. Sans cette autorisation, l\'application doit rester ouverte.';

  @override
  String get notificationPermissionNotNow => 'Pas maintenant';

  @override
  String get notificationPermissionAllow => 'Autoriser';

  @override
  String get notificationPermissionDenied =>
      'Activez les notifications dans les paramètres de conversion en arrière-plan.';

  @override
  String get notificationPermissionOpenSettings => 'Paramètres';

  @override
  String get backButton => 'Retour';

  @override
  String get appSettingsTitle => 'Paramètres de l\'application';

  @override
  String get appSettingsSubtitle =>
      'Enregistrement automatique et paramètres de confidentialité';

  @override
  String get openSourceTitle => 'Open Source';

  @override
  String get openSourceSubtitle => 'Licences et code source';

  @override
  String get openSourceLicensesTitle => 'Licences Open Source';

  @override
  String get legalSectionTitle => 'Mentions légales';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Mode d\'encodage';

  @override
  String get encodingModeCrf => 'Qualité (CRF)';

  @override
  String get encodingModeBitrate => 'Débit binaire';

  @override
  String get audioChannelsLabel => 'Canaux audio';

  @override
  String get audioChannelsInfoContent =>
      'Original → conserver la configuration des canaux source\nStéréo → 2.0 (mixage vers le bas si nécessaire)\nMono → 1 canal (fichier le plus petit)\n5.1 → son surround 6 canaux (uniquement pour les sources surround)\n\nLe mixage vers le bas (par ex. 5.1 → Stéréo) est pris en charge. Le mixage vers le haut n\'est pas proposé.';

  @override
  String get audioChannelOriginal => 'Original';

  @override
  String get targetBitrateLabel => 'Débit binaire cible';

  @override
  String get targetBitrateInfoTitle => 'Débit binaire cible';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → forte compression, pour la messagerie\n4–8 Mbps → qualité normale/bonne en 1080p\n12 Mbps → qualité élevée en 1080p / faible en 4K\n20 Mbps → qualité de streaming en 4K\n\nValeur personnalisée : utilisez l\'icône en forme de crayon (500–100000 kbps)\n\nContrairement au CRF, la qualité peut varier d\'une scène à l\'autre. Utilisez le CRF pour obtenir de meilleurs résultats avec une taille de fichier identique.';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9 et AV1 atteignent la même qualité avec environ la moitié de ces débits.';

  @override
  String get rateAppTitle => 'Évaluer l\'application';

  @override
  String get proHintTitle => 'Utiliser sans publicité';

  @override
  String get proHintBody =>
      'Un achat unique te permet de supprimer définitivement les publicités de l\'application.';

  @override
  String get proHintLater => 'Plus tard';

  @override
  String get restoreError =>
      'Impossible de restaurer les achats. Le Play Store est actuellement indisponible. Veuillez réessayer.';

  @override
  String get restoreNoPurchases => 'Aucun achat antérieur n\'a été trouvé.';

  @override
  String get hdrCodecSwitched =>
      'Vidéo HDR détectée — H.265 sera utilisé pour cette vidéo afin de préserver les couleurs.';

  @override
  String get themeTitle => 'Apparence';

  @override
  String get themeSubtitle => 'Réglage système ou thème clair/sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get targetBitrateEditTooltip => 'Saisir le débit';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Plage autorisée : $range';
  }

  @override
  String get hwEncoderTitle => 'Encodeur matériel (rapide)';

  @override
  String get hwEncoderSubtitle =>
      'Beaucoup plus rapide, mais nécessite environ le double du débit binaire pour la même qualité. Mode débit binaire uniquement.';

  @override
  String get hwEncoderHdrHint =>
      'Vidéo HDR — elle sera convertie avec l\'encodeur logiciel afin de préserver le HDR.';

  @override
  String get hwEncoderFallback =>
      'Échec de l\'encodeur matériel — conversion avec l\'encodeur logiciel.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'L\'encodeur matériel ne prend pas en charge $format — ce format sera converti avec l\'encodeur logiciel.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Encodeur matériel désactivé — il ne prend en charge que le mode débit binaire.';

  @override
  String get resolutionPresetLabel => 'Préréglage';

  @override
  String get resolutionOriginal => 'Originale';

  @override
  String get resolutionCustom => 'Personnalisée';

  @override
  String get aspectRatioLabel => 'Format d\'image';

  @override
  String get aspectOriginal => 'Original';

  @override
  String get aspectCustom => 'Personnalisé';

  @override
  String get fitModeLabel => 'Ajustement';

  @override
  String get fitPad => 'Bandes';

  @override
  String get fitCrop => 'Recadrer';

  @override
  String get fitStretch => 'Étirer';

  @override
  String get fitModeInfoContent =>
      'La cible a un format d\'image différent de celui de la vidéo.\n\nBandes → toute l\'image reste visible, des bandes noires comblent le reste\nRecadrer → le centre est découpé, les bords sont perdus\nÉtirer → l\'image est déformée pour remplir le cadre';
}
