# Plan: Hardware-HEVC im Expertenmodus

Stand 2026-09-27. **Umgesetzt am 2026-09-27** (siehe
`session-reports/session_report_2026_09_27_hardware_hevc.md`), Gerätetest und
Release-Build stehen noch aus. Grundlage sind die Messungen in
`docs/codecs_av1_und_hardware_encoding.md` (Abschnitt 1, Runden 1–3 und VMAF).

## Ziel

Im Expertenmodus bekommt H.265 einen Schalter **„Hardware-Encoder (schnell)“**.
Ist er an, kodiert die App mit `hevc_mediacodec` statt `libx265`:
10–20x schneller, bei gleicher Bitrate ~3–4 VMAF-Punkte schlechter, bei
gleicher Qualität also etwa doppelte Dateigröße. Der Standard bleibt libx265.
Der Normalmodus bleibt in v1 unverändert.

## Festgelegte Eckpunkte (aus den Messungen)

- Argumente: `-c:v hevc_mediacodec -bitrate_mode vbr -b:v <kbps>k -pix_fmt yuv420p -flags:v -global_header -g <n>`
  plus `-tag:v hvc1` für MP4/MOV (kommt aus `codecTagArguments`).
  - `-flags:v -global_header` ist Pflicht. Ohne das Flag bricht das Pixel 10 ab,
    und das Xperia liefert nur einen Keyframe.
  - `-g` wird explizit gesetzt: Ziel-fps (bzw. 30, wenn „Original“) × 5, also
    etwa alle 5 s ein Keyframe. `VideoMetadata` kennt die Quell-fps nicht. Sie
    nur dafür einzulesen, lohnt sich nicht: Bei 60-fps-Quellen wird es alle
    2,5 s ein Keyframe, das ist unkritisch.
- Nur Bitraten-Modus: Schalter an → `bitrateMode` wird auf `'bitrate'` gesetzt
  und das CRF-Segment deaktiviert. CQ unterstützt keines der getesteten Geräte.
- Kein 10 Bit: Der Wrapper nimmt nur `yuv420p`/`nv12` an.
- Pixelformat `yuv420p`, nicht nv12 (nv12 war langsamer).

## Umsetzung

### 1. Geräteerkennung (Kotlin + Dart)
- Neuer Methodenaufruf `hasHardwareHevcEncoder` im bestehenden Gallery- oder
  Service-Channel von `MainActivity.kt`, keinen neuen Channel anlegen.
  `MediaCodecList(REGULAR_CODECS)` nach einem Encoder für `video/hevc`
  durchsuchen. Ab API 29 per `isHardwareAccelerated`, darunter per
  Namensheuristik (nicht `OMX.google.*` / `c2.android.*`).
- Dart: kleiner Service `hardware_encoder_service.dart` mit gecachtem Ergebnis.
  Fehler oder fehlender Channel ergeben `false`.
- Der Schalter erscheint nur, wenn das Ergebnis `true` ist.

### 2. Modell
- `ExpertSettings.hardwareEncoder` (bool, Default false) + `copyWith`.
- Wird wie die übrigen Experteneinstellungen nicht persistiert.
- Wechsel weg von H.265 setzt den Schalter zurück.

### 3. FFmpeg-Argumente (`ffmpeg_codec_options.dart`, pure + Unit-Tests)
- `videoEncoder(codec, {hardware})` → `hevc_mediacodec`.
- `hardwareEncoderArguments({required int fps})` →
  `-bitrate_mode vbr -flags:v -global_header -g <fps*5>`.
- `supportsHdr` bleibt codecbezogen. Neue pure Funktion, die entscheidet, ob
  Hardware für einen Auftrag greift: nur bei H.265, eingeschaltetem Schalter
  und **keiner HDR-Quelle**. Bei HDR läuft der Auftrag mit libx265 weiter und
  behält HDR (Entscheidung A).
- `videoEncoderArguments` bekommt für den HW-Pfad keine x265-spezifischen Teile
  (heute sind es für H.265 ohnehin keine).
- Tests: Argumentstring, `-g`-Berechnung, `hvc1` bei MP4/MOV, kein `-crf`,
  Round-Trip durch `FFmpegKitConfig.parseArguments` wie in
  `video_scale_service_test.dart`.

### 4. UI (`expert_controls.dart`)
- `SwitchListTile` unter der Codec-Auswahl, nur bei H.265 und vorhandener
  Hardware. Untertitel: schnell, dafür etwa doppelte Bitrate für gleiche
  Qualität.
- Schalter an: `bitrateMode = 'bitrate'`, CRF-Segment deaktiviert.
- Bei HDR-Quelle und Schalter an: Hinweistext unter dem Schalter („HDR-Video –
  wird mit dem Software-Encoder konvertiert, damit HDR erhalten bleibt“). Der
  Wechsel passiert also sichtbar vor dem Start und nicht still.
- Widget-Tests: Sichtbarkeit (nur H.265 + Hardware), Zwang zu Bitrate,
  Rücksetzen beim Codecwechsel.

### 5. Konvertierung (`converter_screen.dart` + `conversion_screen.dart`)
- Im Expertenzweig von `_convertVideo` die Argumente aus Schritt 3 verwenden.
- Rückfall (Entscheidung B): `ConversionScreen` bekommt ein optionales
  `fallbackCommand`. Scheitert der HW-Lauf (weder Erfolg noch Abbruch), wird
  einmal mit libx265 und derselben Zielbitrate neu gestartet, dazu erscheint eine
  SnackBar. Der Fehler geht wie heute bereinigt an Crashlytics, mit Kennzeichnung
  „hardware encoder“, damit wir Gerätefehler im Feld sehen.
- Nichts wird nach `PreferencesService` zurückgeschrieben.

### 6. Übersetzungen
Neue Strings in `app_en.arb` (mit `@`-Beschreibung) und in allen 16 weiteren
Sprachen (cs, de, es, fr, hi, id, it, ja, nl, pl, pt, pt-BR, ru, th, tr, uk),
danach `flutter gen-l10n`:
- `hwEncoderTitle` – „Hardware encoder (fast)“
- `hwEncoderSubtitle` – schnell; für gleiche Qualität etwa doppelte Bitrate;
  nur Bitraten-Modus
- `hwEncoderHdrHint` – HDR-Video, wird mit dem Software-Encoder konvertiert,
  damit HDR erhalten bleibt
- `hwEncoderFallback` – Hardware-Encoder fehlgeschlagen, es wird mit dem
  Software-Encoder konvertiert

### 7. Doku, Tests, Verifikation
- `flutter analyze`, `flutter test`, `dart format`.
- Gerätetest: Pixel 10 + Xperia 5 V, MP4/MKV/MOV/TS, Hochkant, Trimmen,
  HDR-Quelle, Abbruch während der Konvertierung, erzwungener Rückfall.
- **Release-Build prüfen:** R8 hat FFmpegKit schon einmal entfernt, und der
  MediaCodec-Pfad läuft über JNI. Ein funktionierender Debug-Build beweist
  hier nichts.
- `tool/hevc_hw_probe.dart` bleibt als Diagnosewerkzeug erhalten.

## Entscheidungen (Matthias, 2026-09-27)

- **C – Container (nach Gerätetest):** Hardware nur für MP4, MOV und MPEG-TS.
  MKV scheiterte auf Pixel 10 und Xperia 5 V auch mit Global-Header und läuft
  deshalb direkt mit libx265, mit Hinweis unter dem Schalter.
- **D – Kein Hardware-H.264:** schlechter als x264 bei überschossener Bitrate,
  nur ~4x schneller. Der Hardware-Pfad bleibt bei HEVC.

- **A – HDR-Quelle mit Hardware-Schalter:** Der Auftrag weicht auf libx265 aus,
  HDR bleibt erhalten. Nur für diesen Auftrag, der Schalter bleibt an. Der
  Hinweis steht unter dem Schalter.
- **B – Rückfall bei Fehler:** Automatisch einmal mit libx265 und derselben
  Zielbitrate wiederholen, dazu SnackBar und Crashlytics-Meldung.
