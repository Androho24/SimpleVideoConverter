// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get qualityLabel => 'Ποιότητα';

  @override
  String get quality2160pHigh => '2160p Υψηλή';

  @override
  String get quality2160pMedium => '2160p Μέτρια';

  @override
  String get quality2160pLow => '2160p Χαμηλή';

  @override
  String get quality2160pVeryLow => '2160p Πολύ χαμηλή';

  @override
  String get quality1440pHigh => '1440p Υψηλή';

  @override
  String get quality1440pMedium => '1440p Μέτρια';

  @override
  String get quality1440pLow => '1440p Χαμηλή';

  @override
  String get quality1440pVeryLow => '1440p Πολύ χαμηλή';

  @override
  String get quality1080pHigh => '1080p Υψηλή';

  @override
  String get quality1080pMedium => '1080p Μέτρια';

  @override
  String get quality1080pLow => '1080p Χαμηλή';

  @override
  String get quality1080pVeryLow => '1080p Πολύ χαμηλή';

  @override
  String get quality720pHigh => '720p Υψηλή';

  @override
  String get quality720pMedium => '720p Μέτρια';

  @override
  String get quality720pLow => '720p Χαμηλή';

  @override
  String get quality720pVeryLow => '720p Πολύ χαμηλή';

  @override
  String get quality480pHigh => '480p Υψηλή';

  @override
  String get quality480pMedium => '480p Μέτρια';

  @override
  String get quality480pLow => '480p Χαμηλή';

  @override
  String get quality480pVeryLow => '480p Πολύ χαμηλή';

  @override
  String get quality360pHigh => '360p Υψηλή';

  @override
  String get quality360pMedium => '360p Μέτρια';

  @override
  String get quality360pLow => '360p Χαμηλή';

  @override
  String get quality360pVeryLow => '360p Πολύ χαμηλή';

  @override
  String get mute => 'Σίγαση';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Επιλογή βίντεο';

  @override
  String get videoLoading => 'Φόρτωση βίντεο…';

  @override
  String get modeNormal => 'Κανονική';

  @override
  String get modeExpert => 'Προχωρημένοι';

  @override
  String get invalidVideoFile => 'Επιλέξτε ένα έγκυρο αρχείο βίντεο.';

  @override
  String get fileLoadError =>
      'Δεν ήταν δυνατή η φόρτωση του αρχείου. Επιλέξτε ένα αρχείο βίντεο.';

  @override
  String get previewNotAvailable =>
      'Η προεπισκόπηση δεν είναι διαθέσιμη. Το βίντεο μπορεί να μετατραπεί κανονικά.';

  @override
  String get previewNotAvailableLabel =>
      'Η προεπισκόπηση δεν είναι διαθέσιμη\n(Πολύ υψηλή ανάλυση για αυτή τη συσκευή)';

  @override
  String get noVideoLoaded => 'Φορτώστε πρώτα ένα βίντεο.';

  @override
  String get cancelConversionTitle => 'Ακύρωση μετατροπής;';

  @override
  String get cancelConversionContent => 'Η πρόοδος της μετατροπής θα χαθεί.';

  @override
  String get continueConversion => 'Συνέχεια';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get discardVideoTitle => 'Απόρριψη βίντεο;';

  @override
  String get discardVideoContent =>
      'Το βίντεο που μετατράπηκε θα διαγραφεί χωρίς να αποθηκευτεί.';

  @override
  String get keep => 'Διατήρηση';

  @override
  String get discard => 'Απόρριψη';

  @override
  String get save => 'Αποθήκευση';

  @override
  String get saveVideoDialogTitle => 'Αποθήκευση βίντεο';

  @override
  String get savedSuccess => 'Αποθηκεύτηκε!';

  @override
  String get open => 'Άνοιγμα';

  @override
  String get openGallery => 'Άνοιγμα συλλογής';

  @override
  String get openVideo => 'Άνοιγμα βίντεο';

  @override
  String get autoSaveTitle => 'Αυτόματη αποθήκευση βίντεο στη συλλογή';

  @override
  String get autoSaveSubtitle =>
      'Τα βίντεο αποθηκεύονται αυτόματα μετά τη μετατροπή.';

  @override
  String get videoCodecTitle => 'Κωδικοποιητής βίντεο';

  @override
  String get videoCodecSubtitle =>
      'Κωδικοποιητής βίντεο για μετατροπές στην κανονική λειτουργία';

  @override
  String get videoCodecInfoTitle => 'H.264, H.265/HEVC ή AV1;';

  @override
  String get videoCodecInfoContent =>
      'Το H.264 προσφέρει την καλύτερη συμβατότητα και συνήθως ταχύτερη μετατροπή.\n\nΤο H.265/HEVC μπορεί να δημιουργήσει μικρότερα αρχεία με παρόμοια οπτική ποιότητα, αλλά η μετατροπή διαρκεί περισσότερο. Παλαιότερες συσκευές ή εφαρμογές ενδέχεται να μην μπορούν να αναπαράγουν το αποτέλεσμα.\n\nΤο AV1 είναι ένας σύγχρονος κωδικοποιητής σχεδιασμένος για μικρά αρχεία. Παλαιότερες συσκευές και εφαρμογές συχνά δεν μπορούν να αναπαράγουν το αποτέλεσμα.\n\nΌλοι οι κωδικοποιητές περιλαμβάνονται στην εφαρμογή και δεν εξαρτώνται από τους κωδικοποιητές που είναι εγκατεστημένοι στη συσκευή.';

  @override
  String get saveError =>
      'Σφάλμα αποθήκευσης. Ίσως δεν υπάρχει αρκετός αποθηκευτικός χώρος.';

  @override
  String get saveErrorOutOfMemory =>
      'Δεν υπάρχει αρκετή μνήμη για την αποθήκευση αυτού του αρχείου. Δοκιμάστε μικρότερο απόσπασμα ή χαμηλότερη ποιότητα.';

  @override
  String get conversionDone => 'Ολοκληρώθηκε!';

  @override
  String conversionProgress(String percent) {
    return 'Μετατροπή: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Η μετατροπή απέτυχε: $error';
  }

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get licensesTitle => 'Άδειες χρήσης';

  @override
  String get licensesSubtitle => 'Άδειες ανοιχτού κώδικα της εφαρμογής';

  @override
  String get gplLicenseTitle => 'Κείμενο άδειας GPL-3.0';

  @override
  String get sourceCodeTitle => 'Πηγαίος κώδικας (GitHub)';

  @override
  String get privacyPolicyTitle => 'Πολιτική απορρήτου';

  @override
  String get adConsentTitle => 'Ρυθμίσεις απορρήτου';

  @override
  String get imprintTitle => 'Στοιχεία εκδότη';

  @override
  String get linkOpenError => 'Δεν ήταν δυνατό το άνοιγμα του συνδέσμου.';

  @override
  String get muteTooltip => 'Πληροφορίες για τη σίγαση';

  @override
  String get muteInfoContent =>
      'Αφαιρεί εντελώς τον ήχο από το βίντεο που μετατρέπεται.\n\nΧρήσιμο, για παράδειγμα, για την αφαίρεση θορύβου περιβάλλοντος ή τη μείωση του μεγέθους αρχείου.';

  @override
  String estimatedSize(String size) {
    return 'Εκτιμώμενο μέγεθος: $size MB';
  }

  @override
  String get convertButton => 'Μετατροπή';

  @override
  String get crfLabel => 'Ποιότητα βίντεο (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Ποιότητα βίντεο';

  @override
  String get crfInfoContent =>
      '0 → χωρίς απώλειες (πολύ μεγάλο αρχείο)\n18 → σχεδόν χωρίς ορατές απώλειες\n23 → τυπική ποιότητα (καλή ισορροπία)\n28 → ορατή απώλεια ποιότητας\n51 → χαμηλότερη ποιότητα\n\nΠροτεινόμενες τιμές: 18–28';

  @override
  String get crfInfoContentWideScale =>
      '0 → χωρίς απώλειες (πολύ μεγάλο αρχείο)\n25 → σχεδόν χωρίς ορατές απώλειες\n30 → τυπική ποιότητα (καλή ισορροπία)\n38 → ορατή απώλεια ποιότητας\n63 → χαμηλότερη ποιότητα\n\nΠροτεινόμενες τιμές: 25–38\n\nΤα VP9 και AV1 χρησιμοποιούν κλίμακα 0–63: η ίδια τιμή αντιστοιχεί σε διαφορετική ποιότητα από ό,τι στα H.264/H.265.';

  @override
  String get resolutionLabel => 'Ανάλυση';

  @override
  String get resolutionInfoTitle => 'Συνήθεις αναλύσεις';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nΣυμβουλή: Αφήστε ένα πεδίο κενό = το άλλο θα υπολογιστεί αναλογικά.';

  @override
  String get widthLabel => 'Πλάτος';

  @override
  String get heightLabel => 'Ύψος';

  @override
  String get emptyEqualsOriginal => 'Κενό = Αρχικό';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Καρέ ανά δευτερόλεπτο';

  @override
  String get fpsInfoContent =>
      'Αρχ.  → Διατήρηση των FPS του αρχικού βίντεο\n24    → Πρότυπο κινηματογράφου\n25    → Πρότυπο PAL/TV (Ευρώπη)\n30    → NTSC/TV, κοινωνικά δίκτυα\n60    → Ομαλή κίνηση, παιχνίδια, αθλητικά';

  @override
  String get audioBitrateLabel => 'Ρυθμός μετάδοσης bit ήχου';

  @override
  String get silent => 'Χωρίς ήχο';

  @override
  String get audioBitrateInfoContent =>
      'Χωρίς ήχο → χωρίς ηχητικό κομμάτι\n64 kbps  → ομιλία, podcast\n96 kbps  → καλή ποιότητα ομιλίας\n128 kbps → τυπική ποιότητα μουσικής\n192 kbps → υψηλή ποιότητα ήχου\n320 kbps → μέγιστη ποιότητα MP3';

  @override
  String get audioCodecLabel => 'Κωδικοποιητής ήχου';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → καλύτερη συμβατότητα και συνήθως ταχύτερη κωδικοποίηση\nH.265 → μικρότερα αρχεία με παρόμοια ποιότητα, πιο αργή κωδικοποίηση\nVP9 → αποδοτικός ανοιχτός κωδικοποιητής για WebM και MKV, πιο αργή κωδικοποίηση μέσω λογισμικού\nAV1 → σύγχρονος κωδικοποιητής για μικρά αρχεία, κωδικοποίηση μόνο μέσω λογισμικού\nXvid → παλαιότερος κωδικοποιητής MPEG-4 για AVI και παλαιότερα προγράμματα αναπαραγωγής\n\nΟι παρακάτω μορφές εξόδου ενεργοποιούνται ανάλογα με τους επιλεγμένους κωδικοποιητές βίντεο και ήχου.';

  @override
  String get xvidLegacyLabel => 'Xvid (Παλαιότερος)';

  @override
  String get av1SlowHint =>
      'Το AV1 χρησιμοποιεί μόνο κωδικοποίηση μέσω λογισμικού και είναι πολύ πιο αργό από τα H.264/H.265.';

  @override
  String get av1HighResHint =>
      'Για αναλύσεις πάνω από 720p, εξετάστε πρώτα το ενδεχόμενο μείωσης της ανάλυσης.';

  @override
  String get audioCodecInfoContent =>
      'AAC → πρότυπο για MP4, καλύτερη συμβατότητα\nMP3 → ευρέως διαδεδομένος παλαιότερος κωδικοποιητής\nOpus → σύγχρονος και αποδοτικός, ιδανικός για WebM και MKV\nAC3 → Dolby Digital, εμφανίζεται μόνο για πηγές με πολυκάναλο ήχο (≥ 3 κανάλια)\nVorbis → ανοιχτός κωδικοποιητής για WebM και MKV\n\nΟι μη συμβατές μορφές εξόδου απενεργοποιούνται αυτόματα.';

  @override
  String get outputFormatLabel => 'Μορφή εξόδου';

  @override
  String get outputFormatInfoContent =>
      'MP4 → γενικής χρήσης, καλύτερη συμβατότητα\nMKV → ευέλικτος περιέκτης για όλους τους διαθέσιμους κωδικοποιητές\nMOV → για εργασίες με Apple/QuickTime\nAVI → παλαιότερη μορφή που χρησιμοποιεί Xvid\nMPEG-TS → ροή μεταφοράς για τηλεόραση και διαδικτυακή μετάδοση\nWebM → σύγχρονη μορφή για το διαδίκτυο με VP9 και Opus ή Vorbis\n\nΟι μη συμβατές μορφές εμφανίζονται αχνές. Αν επιλέξετε μία, εφαρμόζεται αυτόματα ο προεπιλεγμένος κωδικοποιητής βίντεο και, αν χρειάζεται, ένας συμβατός κωδικοποιητής ήχου.';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return 'Ο συνδυασμός $videoCodec + $audioCodec υποστηρίζεται από: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return 'Η μορφή εξόδου άλλαξε σε $format.';
  }

  @override
  String get orig => 'Αρχ.';

  @override
  String get resolutionExplainTitle => 'Τι σημαίνουν οι αναλύσεις;';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → πολύ μικρό αρχείο,\nπ.χ. για WhatsApp\n\n480p  (854×480)   → Τυπική ευκρίνεια (SD)\n\n720p  (1280×720)  → HD, κατάλληλο για κινητές συσκευές\n\n1080p (1920×1080) → Full HD, πρότυπο για\n                          YouTube & TV\n\nΟι ενδείξεις Υψηλή/Μέτρια/Χαμηλή περιγράφουν την ποιότητα στην ίδια ανάλυση — υψηλότερη = μεγαλύτερο αρχείο.';

  @override
  String get resolutionTooltip => 'Πληροφορίες για τις αναλύσεις';

  @override
  String get trimArea => 'Εύρος περικοπής';

  @override
  String trimStartLabel(String time) {
    return 'Έναρξη: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Λήξη: $time';
  }

  @override
  String get adLoading => 'Φόρτωση διαφήμισης…';

  @override
  String get convertedPrefix => 'μετατροπή_';

  @override
  String get removeAdsTitle => 'Κατάργηση διαφημίσεων';

  @override
  String removeAdsSubtitle(String price) {
    return 'Εφάπαξ αγορά – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Χωρίς διαφημίσεις ✓';

  @override
  String get removeAdsActiveSubtitle => 'Ευχαριστούμε για την υποστήριξή σας!';

  @override
  String get restorePurchasesTitle => 'Επαναφορά αγοράς';

  @override
  String get purchaseButton => 'Αγορά';

  @override
  String get purchaseError => 'Η αγορά απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get purchaseSuccess =>
      'Ευχαριστούμε! Οι διαφημίσεις απενεργοποιήθηκαν.';

  @override
  String get appName => 'Μετατροπέας βίντεο';

  @override
  String get audioOnly => 'Μόνο ήχος';

  @override
  String get audioOnlyTooltip => 'Πληροφορίες για την εξαγωγή ήχου';

  @override
  String get audioOnlyInfoContent =>
      'Εξάγει μόνο το ηχητικό κομμάτι από το βίντεο — χωρίς εικόνα.\n\nΚανονική λειτουργία: MP3 στα 192 kbps.\nΛειτουργία για προχωρημένους: Κωδικοποιητής και ρυθμός μετάδοσης bit από τις ρυθμίσεις ήχου.\n\nΧρήσιμο, για παράδειγμα, για αποθήκευση μουσικής ή podcast από βίντεο.';

  @override
  String get aspectLocked => 'Κλειδωμένη αναλογία διαστάσεων';

  @override
  String get aspectUnlocked => 'Ξεκλείδωτη αναλογία διαστάσεων';

  @override
  String get cpuWarningTitle => 'Μεγάλο αρχείο';

  @override
  String get cpuWarningContent =>
      'Αυτό το βίντεο διαρκεί περισσότερο από 5 λεπτά. Σε παλαιότερες συσκευές, η μετατροπή μπορεί να επιβαρύνει πολύ τον επεξεργαστή — αυτό είναι φυσιολογικό.\n\nΜπορείτε απλώς να αφήσετε το κινητό σας στην άκρη· η εφαρμογή θα συνεχίσει να λειτουργεί στο παρασκήνιο.';

  @override
  String get cpuWarningCheckbox => 'Να μην εμφανιστεί ξανά';

  @override
  String get storageWarningTitle => 'Ανεπαρκής αποθηκευτικός χώρος';

  @override
  String storageWarningContent(String available, String required) {
    return 'Η συσκευή σας έχει μόνο $available MB ελεύθερα. Η μετατροπή χρειάζεται περίπου $required MB. Ελευθερώστε πρώτα λίγο χώρο.';
  }

  @override
  String get feedbackTitle => 'Σχόλια & υποστήριξη';

  @override
  String get feedbackSubtitle =>
      'Στείλτε αναφορές σφαλμάτων, προτάσεις ή σχόλια';

  @override
  String get feedbackCategoryLabel => 'Κατηγορία';

  @override
  String get feedbackCategoryBug => 'Αναφορά σφάλματος';

  @override
  String get feedbackCategoryFeature => 'Πρόταση δυνατότητας';

  @override
  String get feedbackCategoryFeedback => 'Γενικά σχόλια';

  @override
  String get feedbackMessageHint => 'Περιγράψτε το πρόβλημά σας…';

  @override
  String get feedbackSendButton => 'Αποστολή';

  @override
  String get notificationPermissionTitle => 'Μετατροπή στο παρασκήνιο';

  @override
  String get notificationPermissionContent =>
      'Επιτρέψτε τις ειδοποιήσεις ώστε η μετατροπή να συνεχίζεται όσο χρησιμοποιείτε άλλες εφαρμογές. Διαφορετικά, η εφαρμογή πρέπει να παραμένει ανοιχτή.';

  @override
  String get notificationPermissionNotNow => 'Όχι τώρα';

  @override
  String get notificationPermissionAllow => 'Να επιτρέπεται';

  @override
  String get notificationPermissionDenied =>
      'Ενεργοποιήστε τις ειδοποιήσεις στις Ρυθμίσεις για μετατροπή στο παρασκήνιο.';

  @override
  String get notificationPermissionOpenSettings => 'Ρυθμίσεις';

  @override
  String get backButton => 'Πίσω';

  @override
  String get appSettingsTitle => 'Ρυθμίσεις εφαρμογής';

  @override
  String get appSettingsSubtitle =>
      'Ρυθμίσεις αυτόματης αποθήκευσης & απορρήτου';

  @override
  String get openSourceTitle => 'Ανοιχτός κώδικας';

  @override
  String get openSourceSubtitle => 'Άδειες χρήσης & πηγαίος κώδικας';

  @override
  String get openSourceLicensesTitle => 'Άδειες ανοιχτού κώδικα';

  @override
  String get legalSectionTitle => 'Νομικές πληροφορίες';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'Τρόπος κωδικοποίησης';

  @override
  String get encodingModeCrf => 'Ποιότητα (CRF)';

  @override
  String get encodingModeBitrate => 'Ρυθμός bit';

  @override
  String get audioChannelsLabel => 'Κανάλια ήχου';

  @override
  String get audioChannelsInfoContent =>
      'Αρχικά → διατήρηση της διάταξης καναλιών της πηγής\nΣτερεοφωνικά → 2.0 (μείωση καναλιών αν χρειάζεται)\nΜονοφωνικά → 1 κανάλι (μικρότερο αρχείο)\n5.1 → πολυκάναλος ήχος 6 καναλιών (μόνο για πηγές με πολυκάναλο ήχο)\n\nΥποστηρίζεται η μείωση καναλιών (π.χ. 5.1 → Στερεοφωνικά). Δεν παρέχεται αύξηση καναλιών.';

  @override
  String get audioChannelOriginal => 'Αρχικά';

  @override
  String get targetBitrateLabel => 'Επιθυμητός ρυθμός μετάδοσης bit';

  @override
  String get targetBitrateInfoTitle => 'Επιθυμητός ρυθμός μετάδοσης bit';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → έντονη συμπίεση, εφαρμογές μηνυμάτων\n4–8 Mbps → τυπική/καλή ποιότητα στα 1080p\n12 Mbps → υψηλή ποιότητα στα 1080p / χαμηλή ποιότητα σε 4K\n20 Mbps → ποιότητα διαδικτυακής μετάδοσης 4K\n\nΠροσαρμοσμένη τιμή: χρησιμοποιήστε το εικονίδιο μολυβιού (500–100000 kbps)\n\nΣε αντίθεση με το CRF, η ποιότητα μπορεί να διαφέρει ανά σκηνή. Χρησιμοποιήστε CRF για καλύτερα αποτελέσματα στο ίδιο μέγεθος αρχείου.';

  @override
  String get targetBitrateWideScaleHint =>
      'Τα VP9 και AV1 επιτυγχάνουν την ίδια ποιότητα με περίπου τον μισό ρυθμό μετάδοσης bit.';

  @override
  String get rateAppTitle => 'Αξιολόγηση εφαρμογής';

  @override
  String get proHintTitle => 'Χρήση χωρίς διαφημίσεις';

  @override
  String get proHintBody =>
      'Με μια εφάπαξ αγορά, μπορείτε να καταργήσετε μόνιμα τις διαφημίσεις από την εφαρμογή.';

  @override
  String get proHintLater => 'Αργότερα';

  @override
  String get restoreError =>
      'Δεν ήταν δυνατή η επαναφορά των αγορών. Το Play Store δεν είναι διαθέσιμο αυτή τη στιγμή — δοκιμάστε ξανά.';

  @override
  String get restoreNoPurchases => 'Δεν βρέθηκαν προηγούμενες αγορές.';

  @override
  String get hdrCodecSwitched =>
      'Εντοπίστηκε βίντεο HDR — χρησιμοποιείται H.265 για αυτό το βίντεο, ώστε να διατηρηθούν τα χρώματα.';

  @override
  String get themeTitle => 'Εμφάνιση';

  @override
  String get themeSubtitle =>
      'Ακολουθήστε το σύστημα ή επιλέξτε ανοιχτόχρωμο ή σκουρόχρωμο θέμα';

  @override
  String get themeSystem => 'Σύστημα';

  @override
  String get themeLight => 'Ανοιχτό';

  @override
  String get themeDark => 'Σκούρο';

  @override
  String get targetBitrateEditTooltip => 'Εισαγωγή ρυθμού μετάδοσης bit';

  @override
  String targetBitrateRangeHint(String range) {
    return 'Επιτρεπόμενο εύρος: $range';
  }

  @override
  String get hwEncoderTitle => 'Κωδικοποιητής υλικού (γρήγορος)';

  @override
  String get hwEncoderSubtitle =>
      'Πολύ ταχύτερος, αλλά χρειάζεται περίπου διπλάσιο ρυθμό μετάδοσης bit για την ίδια ποιότητα. Μόνο με ρύθμιση ρυθμού μετάδοσης bit.';

  @override
  String get hwEncoderHdrHint =>
      'Βίντεο HDR — θα μετατραπεί με τον κωδικοποιητή λογισμικού, ώστε να διατηρηθεί το HDR.';

  @override
  String get hwEncoderFallback =>
      'Ο κωδικοποιητής υλικού απέτυχε — η μετατροπή συνεχίζεται με τον κωδικοποιητή λογισμικού.';

  @override
  String hwEncoderContainerHint(String format) {
    return 'Η μορφή $format δεν υποστηρίζεται από τον κωδικοποιητή υλικού — η μετατροπή σε αυτή τη μορφή θα γίνει με τον κωδικοποιητή λογισμικού.';
  }

  @override
  String get hwEncoderDisabledForCrf =>
      'Ο κωδικοποιητής υλικού απενεργοποιήθηκε — υποστηρίζει μόνο τη ρύθμιση ρυθμού μετάδοσης bit.';

  @override
  String get resolutionPresetLabel => 'Προεπιλογή';

  @override
  String get resolutionOriginal => 'Αρχική';

  @override
  String get resolutionCustom => 'Προσαρμοσμένη';

  @override
  String get aspectRatioLabel => 'Αναλογία διαστάσεων';

  @override
  String get aspectOriginal => 'Αρχική';

  @override
  String get aspectCustom => 'Προσαρμοσμένη';

  @override
  String get fitModeLabel => 'Προσαρμογή';

  @override
  String get fitPad => 'Μπάρες';

  @override
  String get fitCrop => 'Περικοπή';

  @override
  String get fitStretch => 'Τέντωμα';

  @override
  String get fitModeInfoContent =>
      'Η επιθυμητή αναλογία διαστάσεων διαφέρει από αυτή του βίντεο.\n\nΜπάρες → ολόκληρη η εικόνα παραμένει ορατή, ο υπόλοιπος χώρος γεμίζει με μαύρες μπάρες\nΠερικοπή → διατηρείται το κεντρικό τμήμα, τα άκρα χάνονται\nΤέντωμα → η εικόνα παραμορφώνεται ώστε να γεμίσει το πλαίσιο';

  @override
  String get deleteOriginal => 'Διαγραφή αρχικού';

  @override
  String get originalTrashed =>
      'Το αρχικό βίντεο μετακινήθηκε στον κάδο — μπορείτε να το επαναφέρετε από εκεί.';

  @override
  String get originalTrashFailed =>
      'Δεν ήταν δυνατή η διαγραφή του αρχικού βίντεο.';

  @override
  String get burnInSubtitlesLabel => 'Προσθήκη υποτίτλων';

  @override
  String get burnInSubtitlesInfoContent =>
      'Μόνιμοι: Οι υπότιτλοι ενσωματώνονται στην εικόνα του βίντεο. Είναι ορατοί σε κάθε πρόγραμμα αναπαραγωγής και δεν μπορούν να απενεργοποιηθούν αργότερα. Σε βίντεο που παραμένουν σε HDR, μπορεί να φαίνονται πολύ φωτεινοί.\n\nΠροαιρετικοί: Οι υπότιτλοι προστίθενται ως ξεχωριστό κομμάτι που μπορεί να ενεργοποιηθεί ή να απενεργοποιηθεί στο πρόγραμμα αναπαραγωγής. Δεν εμφανίζονται σε όλα τα προγράμματα αναπαραγωγής και συχνά χάνονται κατά την κοινοποίηση του βίντεο. Δεν διατίθενται για AVI και MPEG-TS.\n\nΥποστηρίζονται αρχεία SRT και ASS. Η μορφοποίηση και οι θέσεις των υποτίτλων ASS διατηρούνται πλήρως με την επιλογή «Μόνιμοι» και σε αρχεία MKV. Οι άλλες μορφές διατηρούν μόνο μέρος της μορφοποίησης και όχι τις θέσεις.';

  @override
  String get subtitleModeBurnIn => 'Μόνιμοι';

  @override
  String get subtitleModeTrack => 'Προαιρετικοί';

  @override
  String get subtitleTrackEmpty =>
      'Δεν υπάρχουν υπότιτλοι στο επιλεγμένο τμήμα του βίντεο.';

  @override
  String get sharedVideoBusy =>
      'Ολοκληρώστε πρώτα την τρέχουσα μετατροπή και μετά κοινοποιήστε ξανά το βίντεο.';

  @override
  String get burnInSubtitlesSelect => 'Επιλογή αρχείου SRT ή ASS';

  @override
  String get burnInSubtitlesRemove => 'Αφαίρεση αρχείου υποτίτλων';

  @override
  String get burnInSubtitlesUnsupported => 'Επιλέξτε ένα αρχείο .srt ή .ass.';

  @override
  String get burnInSubtitlesInvalid =>
      'Δεν ήταν δυνατή η ανάγνωση του αρχείου υποτίτλων ή δεν περιέχει έγκυρους υπότιτλους.';

  @override
  String get burnInSubtitlesMissing =>
      'Το αρχείο υποτίτλων δεν είναι πλέον διαθέσιμο. Επιλέξτε το ξανά.';

  @override
  String get subtitleTextSizeLabel => 'Μέγεθος κειμένου';

  @override
  String get subtitleTextSizeSmall => 'Μικρό';

  @override
  String get subtitleTextSizeMedium => 'Μεσαίο';

  @override
  String get subtitleTextSizeLarge => 'Μεγάλο';

  @override
  String get subtitlePositionLabel => 'Θέση';

  @override
  String get subtitlePositionBottom => 'Κάτω';

  @override
  String get subtitlePositionTop => 'Πάνω';

  @override
  String get subtitleBackgroundTitle => 'Γκρι φόντο';
}
