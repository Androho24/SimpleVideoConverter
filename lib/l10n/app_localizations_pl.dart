// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get qualityLabel => 'Jakość';

  @override
  String get quality1080pHigh => '1080p Wysoka';

  @override
  String get quality1080pMedium => '1080p Średnia';

  @override
  String get quality1080pLow => '1080p Niska';

  @override
  String get quality1080pVeryLow => '1080p Bardzo niska';

  @override
  String get quality720pHigh => '720p Wysoka';

  @override
  String get quality720pMedium => '720p Średnia';

  @override
  String get quality720pLow => '720p Niska';

  @override
  String get quality720pVeryLow => '720p Bardzo niska';

  @override
  String get quality480pHigh => '480p Wysoka';

  @override
  String get quality480pMedium => '480p Średnia';

  @override
  String get quality480pLow => '480p Niska';

  @override
  String get quality480pVeryLow => '480p Bardzo niska';

  @override
  String get quality360pHigh => ' 360p Wysoka';

  @override
  String get quality360pMedium => '360p Średnia';

  @override
  String get quality360pLow => '360p Niska';

  @override
  String get quality360pVeryLow => '360p Bardzo niska';

  @override
  String get mute => 'Wycisz';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => 'Wybierz wideo';

  @override
  String get videoLoading => 'Wideo się ładuje…';

  @override
  String get modeNormal => 'Normalny';

  @override
  String get modeExpert => 'Ekspert';

  @override
  String get invalidVideoFile => 'Wybierz prawidłowy plik wideo.';

  @override
  String get fileLoadError =>
      'Nie udało się załadować pliku. Wybierz plik wideo.';

  @override
  String get previewNotAvailable =>
      'Podgląd niedostępny. Film można jednak przekonwertować.';

  @override
  String get previewNotAvailableLabel =>
      'Podgląd niedostępny\n(rozdzielczość zbyt wysoka dla tego urządzenia)';

  @override
  String get noVideoLoaded => 'Najpierw załaduj film.';

  @override
  String get cancelConversionTitle => 'Anulować konwersję?';

  @override
  String get cancelConversionContent =>
      'Dotychczasowe przetwarzanie zostanie utracone.';

  @override
  String get continueConversion => 'Kontynuuj';

  @override
  String get cancel => 'Anuluj';

  @override
  String get discardVideoTitle => 'Odrzucić wideo?';

  @override
  String get discardVideoContent =>
      'Skonwertowane wideo zostanie usunięte i nie zostanie zapisane.';

  @override
  String get keep => 'Zachowaj';

  @override
  String get discard => 'Odrzuć';

  @override
  String get save => 'Zapisz';

  @override
  String get saveVideoDialogTitle => 'Zapisz film';

  @override
  String get savedSuccess => 'Zapisano!';

  @override
  String get open => 'Otwórz';

  @override
  String get saveError =>
      'Błąd podczas zapisywania. Być może brakuje miejsca na dysku.';

  @override
  String get conversionDone => 'Gotowe!';

  @override
  String conversionProgress(String percent) {
    return 'Konwersja: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return 'Konwersja nie powiodła się: $error';
  }

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get licensesTitle => 'Licencje';

  @override
  String get licensesSubtitle => 'Licencje open source tej aplikacji';

  @override
  String get gplLicenseTitle => 'Tekst licencji GPL-3.0';

  @override
  String get sourceCodeTitle => 'Kod źródłowy (GitHub)';

  @override
  String get privacyPolicyTitle => 'Polityka prywatności';

  @override
  String get imprintTitle => 'Stopka redakcyjna';

  @override
  String get linkOpenError => 'Nie udało się otworzyć linku.';

  @override
  String get muteTooltip => 'Wyjaśnienie funkcji wyciszenia';

  @override
  String get muteInfoContent =>
      'Całkowicie usuwa dźwięk z przekonwertowanego wideo.\n\nPrzydatne np. do usuwania szumów tła lub zmniejszenia rozmiaru pliku.';

  @override
  String estimatedSize(String size) {
    return 'Szacowany rozmiar: $size MB';
  }

  @override
  String get convertButton => 'Konwertuj';

  @override
  String get crfLabel => 'Jakość wideo (CRF)';

  @override
  String get crfInfoTitle => 'CRF — Jakość wideo';

  @override
  String get crfInfoContent =>
      '0 → bezstratne (bardzo duży plik)\n18 → wizualnie niemal bezstratne\n23 → standardowe (dobra równowaga)\n28 → widoczna utrata jakości\n51 → najniższa jakość\n\nZalecenie: 18–28';

  @override
  String get resolutionLabel => 'Rozdzielczość';

  @override
  String get resolutionInfoTitle => 'Popularne rozdzielczości';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — Full HD\n1280 × 720 — HD\n 854 × 480 — 480p\n 640 × 360 — 360p\n 426 × 240 — 240p\n\nWskazówka: Pozostaw jedno pole puste = drugie zostanie obliczone proporcjonalnie.';

  @override
  String get widthLabel => 'Szerokość';

  @override
  String get heightLabel => 'Wysokość';

  @override
  String get emptyEqualsOriginal => 'Puste = oryginał';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => 'Klatki na sekundę';

  @override
  String get fpsInfoContent =>
      'Orig → Zachowaj FPS źródłowego wideo\n24 → Standard kinowy\n25 → Standard PAL/TV (Europa)\n30 → NTSC/TV, media społecznościowe\n60 → Płynność, gry, sport';

  @override
  String get audioBitrateLabel => 'Szybkość transmisji audio';

  @override
  String get silent => 'Cisza';

  @override
  String get audioBitrateInfoContent =>
      'Cisza → brak dźwięku\n64 kbps → mowa, podcasty\n96 kbps → dobra jakość mowy\n128 kbps → standardowa muzyka\n192 kbps → wysoka jakość dźwięku\n320 kbps → maksymalna jakość MP3';

  @override
  String get audioCodecLabel => 'Kodek audio';

  @override
  String get audioCodecInfoContent =>
      'AAC → standard dla MP4, najlepsza kompatybilność\nMP3 → powszechnie stosowany, nieco przestarzały\nOpus → nowoczesny i wydajny, dobry dla MKV';

  @override
  String get outputFormatLabel => 'Format wyjściowy';

  @override
  String get outputFormatInfoContent =>
      'MP4 → uniwersalny, najlepsza kompatybilność\nMKV → elastyczny, wiele kodeków, mniejsza kompatybilność\nMOV → format Apple/QuickTime\nAVI → przestarzały, szeroka kompatybilność\nTS → strumień transportowy MPEG, TV/streaming';

  @override
  String get orig => 'Orig';

  @override
  String get resolutionExplainTitle => 'Co oznaczają rozdzielczości?';

  @override
  String get resolutionExplainContent =>
      '360p (640×360) → bardzo mały plik,\n np. dla WhatsApp\n\n480p (854×480) → Standard Definition (SD)\n\n720p (1280×720) → HD, dobre dla urządzeń mobilnych\n\n1080p (1920×1080) → Full HD, standard dla\n YouTube i telewizji\n\nWysoka/Średnia/Niska opisuje jakość przy tej samej rozdzielczości — wyższa = większy plik.';

  @override
  String get resolutionTooltip => 'Wyjaśnienie rozdzielczości';

  @override
  String get trimArea => 'Obszar przycinania';

  @override
  String trimStartLabel(String time) {
    return 'Początek: $time';
  }

  @override
  String trimEndLabel(String time) {
    return 'Koniec: $time';
  }

  @override
  String get adLoading => 'Ładowanie reklam…';

  @override
  String get convertedPrefix => 'skonwertowane_';

  @override
  String get removeAdsTitle => 'Usuń reklamy';

  @override
  String removeAdsSubtitle(String price) {
    return 'Jednorazowy zakup – $price';
  }

  @override
  String get removeAdsActiveTitle => 'Bez reklam ✓';

  @override
  String get removeAdsActiveSubtitle => 'Dziękujemy za wsparcie!';

  @override
  String get restorePurchasesTitle => 'Przywróć zakup';

  @override
  String get purchaseButton => 'Kup';

  @override
  String get purchaseError => 'Nie udało się dokonać zakupu. Spróbuj ponownie.';

  @override
  String get purchaseSuccess => 'Dziękujemy! Reklamy zostały wyłączone.';

  @override
  String get appName => 'Konwerter wideo FFmpeg';

  @override
  String get audioOnly => 'Tylko audio';

  @override
  String get audioOnlyTooltip => 'Wyjaśnienie opcji Tylko audio';

  @override
  String get audioOnlyInfoContent =>
      'Wyodrębnia tylko ścieżkę audio z filmu – bez obrazu.\n\nTryb normalny: MP3 z przepływnością 192 kbps.\nTryb ekspercki: kodek i przepływność z ustawień audio.\n\nPrzydatne np. do zapisywania muzyki lub podcastów z filmów.';

  @override
  String get aspectLocked => 'Zablokowany współczynnik proporcji';

  @override
  String get aspectUnlocked => 'Swobodny współczynnik proporcji';

  @override
  String get cpuWarningTitle => 'Duży plik';

  @override
  String get cpuWarningContent =>
      'Ten plik ma rozmiar większy niż 200 MB. Na starszych urządzeniach konwersja może powodować wysokie obciążenie procesora – jest to normalne.\n\nMożesz po prostu odłożyć telefon na bok, aplikacja będzie nadal działać w tle.';

  @override
  String get cpuWarningCheckbox => 'Nie pokazuj więcej';

  @override
  String get storageWarningTitle => 'Za mało miejsca';

  @override
  String storageWarningContent(String available, String required) {
    return 'Na Twoim urządzeniu pozostało tylko $available MB wolnego miejsca. Do konwersji potrzeba około $required MB. Najpierw zwolnij miejsce.';
  }

  @override
  String get feedbackTitle => 'Opinie i wsparcie';

  @override
  String get feedbackSubtitle => 'Zgłoś błędy, sugestie ulepszeń lub opinie';

  @override
  String get feedbackCategoryLabel => 'Kategoria';

  @override
  String get feedbackCategoryBug => 'Zgłoś błąd';

  @override
  String get feedbackCategoryFeature => 'Propozycja ulepszenia';

  @override
  String get feedbackCategoryFeedback => 'Ogólna opinia';

  @override
  String get feedbackMessageHint => 'Opisz swoją sprawę…';

  @override
  String get feedbackSendButton => 'Wyślij';
}
