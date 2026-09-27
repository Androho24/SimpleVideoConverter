# Codecs: AV1 und Hardware-Encoding

Stand: 2026-08-05. Notizen zur Entscheidungsfindung — was der aktuelle
FFmpeg-Build kann, was AV1 in der Praxis kostet und welche Optionen es für
Hardware-Encoding gibt.

Die Abschnitte sind bewusst getrennt in **verifiziert** (am Binary geprüft oder
gemessen) und **Einschätzung** (Erfahrungswerte, nicht selbst nachgemessen).

---

## 1. Was im aktuellen Build steckt (verifiziert)

`pubspec.yaml` nutzt `ffmpeg_kit_flutter_new: ^4.5.1`. Das Plugin zieht nativ
`com.antonkarpenko:ffmpeg-kit-full-gpl:2.2.1`. Geprüft wurde das AAR aus dem
Gradle-Cache, konkret `jni/arm64-v8a/libavcodec.so`.

FFmpeg-Basis: **n8.1.2** (laut Banner zur Laufzeit). libaom-Version:
**AOMedia Project AV1 Encoder 3.6.1**.

> Die Pfade in der einkompilierten configure-Zeile lauten
> `.../ffmpeg-kit-6.0.LTS/...` — das ist nur das Arbeitsverzeichnis des
> Fork-Autors und **nicht** die FFmpeg-Version. Nicht daraus ableiten, welche
> Optionen verfügbar sind.

Aus der einkompilierten configure-Zeile:

```
--enable-libaom --enable-libdav1d --enable-libvpx --enable-libx264
--enable-libx265 --enable-libxvid --enable-libvidstab --enable-mediacodec ...
```

**Wichtig:** Die Enabled-Libraries-Tabelle in der Plugin-README ist
**unvollständig** — sie listet für `full-gpl` nur `dav1d` und verschweigt
`libaom`. Wer sich auf die README verlässt, kommt zu dem Schluss, AV1-Encoding
sei nicht möglich. Das ist falsch. Im Zweifel immer das Binary prüfen.

### Video-Encoder

| Encoder | vorhanden | Art |
|---|---|---|
| `libx264`, `libx265`, `libxvid`, `libvpx-vp9` | ja | Software |
| `libaom-av1` | ja | Software |
| `h264_mediacodec`, `hevc_mediacodec` | ja (siehe unten) | **Hardware** |
| `av1_mediacodec`, `vp9_mediacodec`, `vp8_mediacodec`, `mpeg4_mediacodec` | registriert (Gerätetest 2026-09-25), nicht getestet | Hardware, falls das Gerät einen passenden Encoder hat |
| SVT-AV1, rav1e | nein | — |

**libx265 ist ein 10-Bit-only-Build ohne Assembler** (verifiziert 2026-09-25,
SEI-Kennung in einer auf dem Pixel 10 erzeugten Datei:
`x265 (build 192) - 3.4:[Linux][clang 20.0.0][32 bit][noasm] 10bit`). Folgen:

- Jede H.265-Ausgabe der App ist **Main 10 / yuv420p10le**, auch mit
  `-pix_fmt yuv420p`. FFmpeg meldet im Log trotzdem `yuv420p`; erst ffprobe
  auf die Datei zeigt es. Die HDR-Passthrough-Ausgabe funktioniert deshalb,
  aber auch SDR-Ausgaben sind 10 Bit. Ältere Geräte und manche Browser/TVs
  spielen HEVC Main 10 nicht ab.
- `noasm` heißt: keine NEON-Optimierung. Das erklärt, warum x265 auf dem Gerät
  so langsam ist (1080p30 Testbild: 0,48x Echtzeit auf dem Pixel 10), und
  verschiebt die Rechnung für Hardware-Encoding deutlich zu dessen Gunsten.
- „32 bit“ in der Kennung ist kein Hinweis auf eine 32-Bit-Bibliothek: x265
  schreibt „64 bit“ nur bei x86_64.

### Decoder

`libdav1d` (schnelles AV1-Software-Decoding) sowie diverse
`*_mediacodec`-Decoder inklusive `av1_mediacodec`.

### Der MediaCodec-Encoder-Wrapper ist drin

Im Binary nachgewiesen: `libavcodec/mediacodecenc.c`,
`AMediaCodec_createEncoderByType`, die Option `bitrate_mode` sowie die Meldung
`"Mediacodec encoder doesn't support AV_CODEC_FLAG_GLOBAL_HEADER."`

Heißt: **Hardware-Encoding für H.264/H.265 ist aus dem bestehenden Build
erreichbar**, ohne Kotlin, ohne Plugin-Wechsel — schlicht `-c:v h264_mediacodec`
statt `libx264`.

### Gerätetest Runde 1 (Pixel 10, Android 17, 2026-09-25)

`tool/hevc_hw_probe.dart`, Zielbitrate 8 Mbit/s VBR. Rohdaten lagen unter
`hevc_probe/` im Repo-Root (nicht eingecheckt).

| Fall | Ergebnis |
|---|---|
| `hevc_mediacodec` → MP4, MKV | **scheitert sofort** (0,2 s): `IllegalStateException: … Released state` beim ersten Frame |
| `hevc_mediacodec` → TS | **OK**, HEVC Main, yuv420p, Bitrate trifft (8,4 Mbit/s) |
| nv12, cbr, Hochkant, 1916×1076, `h264_mediacodec` | alle nach MP4 — scheitern mit demselben Fehler, also **noch ungeprüft** |
| `-bitrate_mode cq` (yuv420p) | scheitert schon bei `configure` (`IllegalArgumentException`) |
| `-pix_fmt p010le` | nicht möglich: der Encoder nimmt nur `yuv420p`/`nv12` an, FFmpeg fällt auf yuv420p zurück |

Laufzeiten (identische Quelle, gleiche Zielbitrate):

| Quelle | hevc_mediacodec (TS) | libx265 | libx264 |
|---|---|---|---|
| testsrc2 1920×1080, 30 fps, 10 s | **2,2 s** | 20,7 s | 4,2 s |
| Galerie-Clip 576×1024, 5,2 s | **0,9 s** | 10,3 s | 1,8 s |

Also ~10x schneller als x265 und ~2x schneller als x264. Der Galerie-Clip war
kurz und klein; eine Messung an echtem 1080p-Material steht noch aus.

**Deutung des MP4/MKV-Fehlers:** Beide Container setzen am Encoder
`AV_CODEC_FLAG_GLOBAL_HEADER`, TS nicht. Das ist der einzige Unterschied
zwischen dem erfolgreichen und den gescheiterten Läufen. FFmpegs
Extradata-Erzeugung im MediaCodec-Wrapper lässt den Pixel-Encoder offenbar
im Zustand „Released“ zurück. Die genaue Stelle im Wrapper ist nicht
nachgelesen.

### Gerätetest Runde 2 (Pixel 10, 2026-09-25)

Quelle: echter Galerie-Clip, HEVC 1920×1080, 29,97 fps, SDR (BT.709),
~20 Mbit/s, die ersten 20 s. Zielbitrate 8 Mbit/s.

| Fall | Ergebnis | Laufzeit |
|---|---|---|
| `hevc_mediacodec` → MP4 (Kontrolle) | scheitert wie in Runde 1 | 0,4 s |
| **`hevc_mediacodec` → MP4 mit `-flags:v -global_header`** | **OK**, 8,5 Mbit/s, dekodiert fehlerfrei, Farbtags erhalten | **5,4 s** |
| TS → `-c copy` → MP4 | OK, verliert aber `color_transfer` und bekommt Startversatz 0,015 s und eine krumme Framerate (540000/18019) | 5,2 + 0,3 s |
| nv12 (TS) | OK, aber langsamer (Softwareumwandlung) | 7,2 s |
| cbr (TS) | OK | 5,2 s |
| cq + nv12 (TS) | scheitert bei `configure`: **das Pixel kann kein CQ** | — |
| Hochkant 1080×1920 (TS) | OK (Zeit inkl. Software-Skalierung) | 8,2 s |
| 1916×1076, nicht 16-aligned (TS) | OK (Zeit inkl. Software-Skalierung) | 8,8 s |
| `h264_mediacodec` (TS → MP4) | OK, High Profile | 5,4 s |
| libx265 (Main 10) | OK | **132,1 s** |
| libx264 | OK | 31,2 s |

**Hardware-HEVC ist hier ~25x schneller als x265 und ~6x schneller als x264.**
Aus 20 s Material werden 5,4 s Arbeit, das sind ~3,7x Echtzeit.

Weg zu MP4: **`-flags:v -global_header`**. movenc baut `hvcC` dann aus dem ersten
Paket. Anders als beim Umpacken bleiben dabei Zeitstempel und Farbtags sauber.
Mit diesem Flag schreibt FFmpeg den Tag `hev1`. Für Apple-Kompatibilität muss
wie bei x265 `-tag:v hvc1` dazu, der App-Pfad in
`ffmpeg_codec_options.dart` setzt das für MP4 ohnehin. Die Kombination mit
`-tag:v hvc1` ist noch nicht auf dem Gerät geprüft.

Weitere Beobachtungen:
- Keyframe etwa jede Sekunde (FFmpeg-Hinweis `Use 1 as the default MediaFormat
  i-frame-interval`). Ein größeres `-g` spart vermutlich Bitrate, ungeprüft.
- `has_b_frames=0`: Der Pixel-Encoder erzeugt keine B-Frames.

Qualität am Testbild (testsrc2 lokal als Referenz erzeugt, 8 Mbit/s):

| | SSIM (All) | PSNR (avg) |
|---|---|---|
| hevc_mediacodec | 0,9971 | 44,8 dB |
| libx265 | 0,9963 | 44,5 dB |
| libx264 | 0,9973 | 45,6 dB |

Bei dieser hohen Bitrate liegen alle praktisch gleichauf. testsrc2 ist
synthetisch und leicht zu kodieren, als Qualitätsaussage für echtes Material
taugt das nicht. Dafür steht noch ein VMAF-Vergleich gegen den Original-Clip bei
niedrigerer Bitrate (z.B. 2–4 Mbit/s) aus. Die Windows-FFmpeg-Build hat `libvmaf`.

### Runde 3: Pixel 10 und Sony Xperia 5 V (2026-09-27)

Auf beiden Geräten derselbe 1080p-SDR-Clip. Die x264/x265-Referenzdateien sind
byte-identisch, es war also dieselbe Quelle. Neu dabei ist der Testfall
`hevc_hw_mp4_app`:
`-c:v hevc_mediacodec -b:v 8M -bitrate_mode vbr -pix_fmt yuv420p -flags:v -global_header -tag:v hvc1 -g 150`.

| Fall | Pixel 10 (Android 17) | Xperia 5 V (Android 15) |
|---|---|---|
| HW-HEVC → MP4 mit Global Header | ❌ `Released state` | ✅ 6,1 s, **aber nur 1 Keyframe in 20 s** |
| `-flags:v -global_header` | ✅ 5,2 s, Keyframe jede Sekunde | ✅ 6,0 s, Keyframe jede Sekunde |
| **`hevc_hw_mp4_app`** | ✅ **5,1 s**, `hvc1`, Keyframes alle 4,84 s, dekodiert fehlerfrei | ✅ **5,8 s**, `hvc1`, Keyframes alle 4,84 s, dekodiert fehlerfrei |
| cbr (TS) | ✅ 8,6 Mbit/s | ✅ 7,4 Mbit/s |
| cq + nv12 | ❌ configure | ❌ configure |
| nv12 / Hochkant / nicht 16-aligned / h264 | ✅ | ✅ |
| libx265 | 111,3 s | 170,0 s |
| libx264 | 26,5 s | 30,2 s |

Folgerungen:
- **Der Global-Header-Pfad von FFmpegs MediaCodec-Wrapper ist auf keinem der
  beiden Geräte brauchbar.** Das Pixel bricht ab, das Sony liefert eine Datei
  mit einem einzigen Keyframe, also praktisch nicht spulbar. `-flags:v -global_header`
  ist deshalb Pflicht, nicht nur ein Pixel-Workaround.
- **`-g` muss explizit gesetzt werden.** FFmpeg rechnet es in MediaCodecs
  `i-frame-interval` (Sekunden) um. 150 Frames bei 29,97 fps ergaben Keyframes
  alle 4,84 s. Offenbar wird dabei auf ganze Sekunden abgerundet, nicht nachgelesen.
  In der App `-g` aus der Ziel-Framerate berechnen.
- CQ gibt es auf keinem der beiden Geräte. Hardware-Encoding in der App heißt
  deshalb Bitraten-Modus (VBR). Die Bitrate trifft bei VBR auf ±6 %.
- Keine B-Frames, auf beiden Geräten.
- Tempo: HW-HEVC etwa 20–30x schneller als x265 und 5x schneller als x264.
  Die HW-Zeiten enthalten das Software-Dekodieren der HEVC-Quelle. Das dürfte
  inzwischen der Engpass sein.

### VMAF bei 8 Mbit/s (2026-09-27)

Gemessen am PC mit libvmaf gegen die Quelle (`testvideo.mp4` im Repo-Root,
nicht eingecheckt, erste 20 s). Die Referenz lief dabei durch `fps=30000/1001`,
damit sie mit der CFR-Ausgabe übereinstimmt:

```
ffmpeg -i ausgabe.mp4 -t 20 -i testvideo.mp4 -lavfi "[0:v]setpts=PTS-STARTPTS,format=yuv420p[d];[1:v]fps=30000/1001,setpts=PTS-STARTPTS,format=yuv420p[r];[d][r]libvmaf=n_threads=8" -f null -
```

| Encoder | VMAF |
|---|---|
| libx265 (Main 10) | 93,4 |
| HW-HEVC Pixel 10 | 92,4 |
| libx264 | 92,1 |
| HW-HEVC Xperia 5 V | 91,6 |
| HW-H.264 Pixel / Xperia | 90,4 / 89,9 |

Bei dieser Bitrate ist der Unterschied praktisch unsichtbar. Für knappe
Bitraten gibt es im Test die Qualitätsreihe (Button „Qualitätsreihe“:
HW-HEVC, HW-H.264, x265, x264 je mit 2 und 4 Mbit/s, Ordner `qualitaet/`).

### VMAF-Qualitätsreihe bei 2 und 4 Mbit/s (Xperia 5 V, 2026-09-27)

Gleiche Quelle, gleiche Messung wie oben. Spalten: Mittelwert, schlechtestes
Frame, 5-%-Perzentil. Tatsächlich erreichte Bitrate und Laufzeit auf dem Gerät.

| Encoder | Ziel | Ist-Bitrate | VMAF | min | p5 | Laufzeit |
|---|---|---|---|---|---|---|
| libx265 | 2M | 1,95 M | **87,8** | 60,2 | 83,7 | 89,9 s |
| libx264 | 2M | 1,94 M | 84,8 | 55,4 | 78,7 | 22,4 s |
| HW-HEVC | 2M | 2,08 M | 83,4 | 71,9 | 80,1 | **6,0 s** |
| HW-H.264 | 2M | **2,50 M** | 80,5 | 60,5 | 75,7 | 5,8 s |
| libx265 | 4M | 3,95 M | **90,7** | 74,4 | 88,1 | 144,6 s |
| libx264 | 4M | 3,93 M | 89,1 | 72,2 | 85,9 | 30,5 s |
| HW-HEVC | 4M | 4,04 M | 87,5 | 80,7 | 85,4 | **8,5 s** |
| HW-H.264 | 4M | 4,17 M | 85,6 | 73,8 | 83,6 | 8,4 s |

Bewertung:
- **HW-HEVC braucht für die Qualität von x265 etwa die doppelte Bitrate**
  (HW 4M = 87,5 ≈ x265 2M = 87,8). Gegenüber x264 liegt es bei gleicher
  Bitrate 1,5–1,6 Punkte darunter, braucht also grob 1,3x Bitrate.
- Der Abstand schrumpft mit steigender Bitrate: 4,4 Punkte zu x265 bei 2M,
  3,2 bei 4M, 1,0 bei 8M.
- HW-HEVC hat die **gleichmäßigste** Qualität. Das schlechteste Frame liegt
  deutlich höher als bei den Software-Encodern, deren Minima offenbar in
  schwierigen Stellen einbrechen (nicht einzeln angesehen).
- HW-H.264 überschießt bei 2M die Zielbitrate um 25 % und ist trotzdem am
  schlechtesten. Für die App uninteressant, HW-HEVC ist in jeder Hinsicht besser.
- Faustregel ~6 VMAF-Punkte = ein sichtbarer Qualitätsschritt. Bei 2M ist der
  Unterschied zu x265 also knapp sichtbar, ab 4M kaum noch.

Folgerung für das Feature: Hardware-HEVC als „schnell, aber größer“ anbieten.
Die Bitrate für den HW-Pfad muss höher liegen als für x265, bei gleicher
Qualität etwa +50–100 %. Gemessen nur auf dem Xperia. Das Pixel lag bei 8M
0,8 Punkte über dem Xperia, tendenziell also etwas besser.

HDR per Hardware wurde bewusst nicht getestet. Der Wrapper nimmt nur 8 Bit an,
HDR-Quellen müssen im Feature deshalb bei x265 bleiben oder vorher tonemappt werden.

---

## 2. AV1: Messung und Bewertung

**Gemessen (Pixel 10), 46 s Screen Recording in 1080p.** Angaben sind die von
FFmpeg gemeldete Restdauer, keine Stoppuhr:

| # | CRF | Lookahead | tune-content | Dauer |
|---|---|---|---|---|
| 1 | 23 | 19 | — | ~28 min |
| 2 | **32** | 5 | — | ~12 min |
| 3 | 23 | 5 | screen | ~22 min |

**Vorsicht bei der Interpretation — die Läufe variieren mehr als eine Größe:**

- Lauf 1 → 3 ändert Lookahead *und* tune-content gleichzeitig, bei gleichem
  CRF. Der gemeinsame Effekt beider Änderungen: **rund 20 % schneller**. Wie
  viel davon auf den Lookahead entfällt und wie viel auf tune-content, ist
  **nicht gemessen**.
- Lauf 3 → 2 ändert nur den CRF (23 → 32): 22 → 12 min, also **fast Faktor 2**.

### Wichtigste Erkenntnis

**Der dominante Tempohebel bei AV1 ist die Qualitätsstufe, nicht die
Encoder-Flags.** Der Sprung von CRF 23 auf 32 bringt mehr als alles, was an
`cpu-used`, `lag-in-frames` und `tune-content` zu holen war.

Das macht die CRF-Umrechnung in `lib/services/video_quality_scale.dart` zum
wirksamsten Eingriff dieser Runde: Sie verschiebt AV1 automatisch von 23 auf 31
und liefert damit ungefähr die 22 → 12 Minuten, ohne dass der Nutzer etwas tun
muss.

Trotzdem: 12 Minuten für 46 Sekunden bleibt nichts, was man Nutzern als
Standard vorsetzt.

Die Restzeitanzeige schwankt während des Laufs — erwartbar, weil AV1 stark
content-abhängig ist und die Schätzung aus der momentanen Geschwindigkeit
abgeleitet wird.

### Kameramaterial ist der schlechtere Fall

Zweite Messreihe, diesmal mit der Handykamera aufgenommen statt Bildschirm
aufgezeichnet. Beides mit Stoppuhr gemessen, nicht aus der Anzeige abgelesen —
3 s bei 720×1280, CRF 31:

| Flags | Dauer | ggü. Echtzeit |
|---|---|---|
| mit `-tune-content screen` | 90 s | ~30× langsamer |
| ohne (aktueller Stand) | **85 s** | **~28× langsamer** |

Damit ist der tune-content-Effekt sauber beziffert: gut **5 %** — auf
Kameramaterial in die falsche Richtung, wie erwartet. Klein genug, dass er an
der Gesamtbewertung nichts ändert, aber ein Grund mehr, die Option nicht
pauschal zu setzen.

### Realtime-Modus: Faktor 8–14

Gleicher 3-s-Clip, 720×1280, Stoppuhr:

| Ratenkontrolle | Good Mode (`cpu-used 6`, lag 5) | Realtime (`cpu-used 8`, lag 0) | Faktor |
|---|---|---|---|
| CRF 31 | 85 s | **10 s** | 8,5× |
| 5 Mbps | 172 s | **12 s** | 14× |

**CRF funktioniert in Realtime** — die frühere Unklarheit ist damit erledigt.
Die gescheiterten Läufe lagen ausschließlich an Parameterfehlern
(`cpu-used 9`, `lag-in-frames 5`), nicht an der Ratenkontrolle.

10 s für 3 s Material sind rund 3,3× langsamer als Echtzeit. Damit wäre AV1
erstmals in einem Bereich, den man Nutzern zumuten kann: eine Minute Video ≈
3,5 Minuten Konvertierung.

### Die entscheidende Frage ist jetzt die Qualität

Realtime erkauft das Tempo mit Qualität pro Bit, und `-lag-in-frames 0`
entfernt zusätzlich die Alt-Ref-Frames, also genau die Kompressionstechnik, für
die man AV1 überhaupt wählt.

**Das Risiko:** Wenn Realtime-AV1 bei gleicher Dateigröße schlechter aussieht
als `libx265`, dann ist es sinnlos — man bezahlt Rechenzeit für einen Codec,
dessen einziger Vorteil gerade abgeschaltet wurde. AV1 lohnt nur, solange es
kleinere Dateien bei gleicher Qualität liefert.

**Dateigrößen (3-s-Clip, 720×1280):**

| Variante | Größe | Encodingzeit |
|---|---|---|
| AV1 Good Mode, CRF 31 | 562 kB | 85 s |
| H.265 | 506 kB | ? |
| AV1 Realtime, CRF 31 | 485 kB | 10 s |

> **Achtung, Denkfehler vermeiden:** Größenvergleiche bei festem CRF messen
> **keine** Kompressionseffizienz. CRF ist ein Qualitätsziel, keine
> Größenvorgabe — ein gründlicherer Encoder liefert bei gleichem CRF ein
> besseres Bild, nicht eine kleinere Datei. Dass Good Mode die *größte* Datei
> erzeugt, ist also erwartbar, und die 485 kB von Realtime bedeuten
> höchstwahrscheinlich die *schlechteste* Qualität der drei, nicht die beste
> Kompression.
>
> Eine frühere Fassung dieses Abschnitts formulierte es falsch („wenn AV1 nicht
> deutlich kleiner ist als H.265, ist es hinfällig"). Um Effizienz zu
> vergleichen, muss eine der beiden Größen festgehalten werden.

**Der praktikable Ausweg:** Alle drei Dateien liegen innerhalb von 15 %
zueinander. Damit ist ein direkter **Sichtvergleich** aussagekräftig — bei
ungefähr gleicher Größe gewinnt, was am besten aussieht. Worauf zu achten ist:
bewegte Passagen, Kanten, Gesichter, dunkle Bereiche.

Noch offen: mit welchem CRF der H.265-Lauf lief (skalengerechtes Gegenstück zu
AV1 CRF 31 wäre H.265 CRF 23) und wie lange er dauerte.

### Empfehlung zur Realtime-Frage (offen, Stand 2026-08-06)

**Realtime wieder entfernen.** Begründung: AV1 landet ohnehin hinter einem
Experimentell-Schalter. Wer den bewusst umlegt, nimmt Wartezeit in Kauf und
*will* dafür den Kompressionsvorteil. Realtime-AV1 bedient niemanden — für
Ungeduldige immer noch 3,3× langsamer als Echtzeit, für Qualitätsbewusste ohne
Mehrwert gegenüber H.265.

Good Mode mit CRF 31 ist mit 85 s brutal, hat aber einen Daseinsgrund —
vorausgesetzt, die noch fehlende Dateigrößenmessung bestätigt ihn.

Entscheidung vertagt. Bis dahin bleibt der Messversuch im Code, markiert in
`lib/services/ffmpeg_codec_options.dart`.

### Bitratenmodus ist nicht mit CRF vergleichbar

Derselbe 3-s-Clip im Bitratenmodus mit **5 Mbps → 172 s**, also doppelt so lang
wie CRF 31. Das ist **kein Argument gegen den Bitratenmodus**, sondern ein
anderer Qualitätszielpunkt: 5 Mbps sind bei 720×1280 für AV1 sehr üppig und
liegen deutlich über dem, was CRF 31 produziert. Der Encoder arbeitet
entsprechend mehr.

Passt zu dem Hinweis, den die App im Bitraten-Dialog für VP9/AV1 anzeigt
(`targetBitrateWideScaleHint`): Die Richtwerte der Liste sind auf H.264 geeicht,
AV1 erreicht dieselbe Qualität mit etwa der Hälfte. Ein vergleichbarer Zielwert
wären hier rund 2–2,5 Mbps.

**Konsequenz für Vergleichsmessungen:** Läufe nur innerhalb derselben
Ratenkontrolle vergleichen. CRF gegen Bitrate zu stellen misst die
Qualitätsstufe, nicht den Encoder.

**Das kippt die frühere Annahme, 720p sei der brauchbare Bereich.** Die stammte
aus einer Hochrechnung des 1080p-Screenrecordings, und Screen Content ist für
einen Encoder trivial gegenüber Kamerabildern: Rauschen, echte Bewegung, keine
flächigen Wiederholungen. Kameramaterial ist der Normalfall dieser App.

Hochgerechnet: eine Minute Handyvideo ≈ 30 Minuten Konvertierung, bei laufendem
Bildschirm und warmem Gerät.

### Für eine saubere Messung fehlt

Alle bisherigen 1080p-Werte sind abgelesene Restzeiten, die während eines Laufs
zwischen 15 und 22 Minuten schwankten. Unterschiede von 20 % zwischen zwei
Läufen sind damit **nicht vom Rauschen zu trennen**. Belastbar ist nur die
gestoppte Gesamtdauer eines abgeschlossenen Laufs, so wie beim Kameratest oben.

### Aktuelle Encoder-Argumente

Siehe `lib/services/ffmpeg_codec_options.dart`:

```
-cpu-used 6 -row-mt 1 -lag-in-frames 5 -g 240
-colorspace bt709 -color_primaries bt709 -color_trc bt709
-crf N -b:v 0
```

> **`-tune-content screen` wurde getestet und wieder entfernt.** Die Option
> schaltet Screen-Content-Werkzeuge frei (Palettenmodus, Intra Block Copy). Bei
> Bildschirmaufnahmen hilft das, bei Kameramaterial findet der Encoder damit
> nichts Verwertbares, muss die Analyse aber trotzdem durchlaufen. Da das
> Eingangsmaterial nicht bekannt ist, bleibt sie aus. Nur sinnvoll, falls sie
> irgendwann an eine explizite Nutzerauswahl gekoppelt wird.

### cpu-used: Good Mode endet bei 6

Libaoms eigener Hilfetext im Binary lautet:

```
Speed setting (0..6 in good mode, 5..10 in realtime mode, 0..9 in all intra mode)
```

**Im Good-Quality-Modus ist 6 das Maximum.** Die zweite Zeile im Binary,
`cpu_used out of range [0..(cfg->g_usage == AOM_USAGE_REALTIME) ? 10 : 9]`, ist
nur die Wertebereichsprüfung — sie winkt 7–9 durch, aber die Speed-Feature-
Tabelle für Good Mode ist bis 6 definiert. Höhere Werte laufen auf Stufe 6
hinaus.

Die ursprüngliche Messung mit `-cpu-used 8` lief also faktisch auf Stufe 6.
An dieser Schraube ist in Good Mode nichts mehr zu holen.

### Weitere Hebel

- **`-lag-in-frames`** (0–25, Default 19) — der Lookahead samt Alt-Ref-
  Maschinerie ist teuer. Aktuell auf 5 gesetzt. Wirkt im Good Mode, ohne den
  Modus zu wechseln.
- **`-usage realtime`** — ein komplett anderer Satz an Speed-Features, also ein
  Größenordnungssprung statt Feintuning. Preis: deutlich schlechtere Qualität
  pro Bit. Zwei Fallstricke, beide durch Fehlversuche belegt:
  - **`cpu-used` maximal 8.** libaom erlaubt in Realtime bis 10, aber FFmpegs
    Wrapper deckelt die Option bei 8 (`Error setting option cpu-used to value
    9.`). Anders als im Good Mode, wo die Skala effektiv bei 6 endet, ist 8 in
    Realtime wirksam.
  - **`-lag-in-frames 0`.** Realtime verlangt Low-Delay. libaom lehnt
    Zwischenwerte ab: `Set lag in frames to 0 (low delay) or >=
    (max-gf-interval + 2)`. Mit `-lag-in-frames 5` schlugen CRF *und*
    Bitratenmodus identisch fehl.
  - **Ungeklärt:** ob libaom in Realtime echtes CRF (`end-usage=q`) akzeptiert.
    Der erste Fehlversuch lag am cpu-used-Wert, nicht an der Ratenkontrolle.
- **`-aom-params tune-content=screen`** — Option ist im Build vorhanden
  (`Tune content type`). Für Screen Recordings der naheliegendste Versuch.
- `-usage allintra` existiert ebenfalls, ist für Video aber unbrauchbar
  (jedes Bild ein Keyframe).
- **Kachelaufteilung bewusst automatisch gelassen.** Ein explizites
  `-tiles 2x2` lässt libaom bei kleinen Auflösungen mit einem Parameterfehler
  abbrechen. Ohne die Option wählt FFmpeg eine gültige, threadfähige
  Aufteilung selbst.

### Warum der Anfang schnell wirkt

`g_lag_in_frames out of range [..25]` — libaom puffert per Default 19 Frames
Lookahead, bevor das erste Paket herauskommt. Die ersten Frames werden also
quasi sofort geschluckt, der Fortschritt springt kurz nach vorn und läuft dann
erst im echten Encoder-Tempo weiter.

Zweiter Faktor (*Einschätzung*): AV1 ist deutlich content-abhängiger im Tempo
als x264. Screen Recordings starten typischerweise statisch — das kostet fast
nichts, sobald Bewegung einsetzt bricht das Tempo ein.

Unterscheiden lässt sich das an der Speed-Anzeige der App: einmaliger Abfall
nach ~1 s und danach konstant → Lookahead. Schwankend über den ganzen Lauf →
Content.

### Ungetestete Option für Screen Recordings

`-aom-params tune-content=screen`. libaom hat einen eigenen Modus für
Bildschirminhalte, der sowohl Tempo als auch Qualität verbessern soll. Nicht
ausprobiert.

---

## 3. Hardware-AV1-Encoding

**Gibt es in diesem Build nicht** und wird es auch nicht geben: FFmpeg 6.0
kennt als MediaCodec-Encoder nur H.264 und HEVC. Das ist eine Eigenschaft des
Builds, nicht des Geräts — die Situation verbessert sich also weder mit
besserer Hardware noch mit der Zeit, solange dieses Paket verwendet wird.

Ob das Gerät überhaupt einen AV1-Hardware-Encoder hat, ist eine separate Frage.
AV1-*Decode* ist auf Mobil-SoCs seit Jahren üblich, AV1-*Encode* weiterhin
selten. Für den Pixel 10 ist mir das **nicht bekannt** — bitte nicht annehmen,
sondern messen: `MediaCodecList` nach Encodern für den MIME-Typ `video/av01`
abfragen.

---

## 4. Liefert MediaCodec schlechtere Qualität? (Einschätzung)

Bei **gleicher Bitrate**: ja. Größenordnung laut gängigen Vergleichen 20–50 %
mehr Bitrate für vergleichbare Qualität gegenüber x264 auf `medium`. Das ist
real.

Drei Relativierungen:

1. **Der übliche Vergleich ist unfair gestellt.** „Hardware vs. x264" meint
   fast immer x264 auf `medium`/`slow`. Bringt man x264 auf konkurrenzfähiges
   Tempo (`veryfast`, `ultrafast`), bricht dessen Qualität ebenfalls ein. Die
   ehrliche Achse ist Qualität pro *Zeit*, nicht pro Bit.
2. **Der schlechte Ruf stammt größtenteils aus der Vergangenheit** — frühe
   mobile Encoder und frühes NVENC/QSV. Moderne mobile HEVC-Encoder sind
   ordentlich; H.264 in Hardware bleibt mittelmäßig.
3. **Stark abhängig vom Betriebspunkt.** Unter ~2 Mbps bei 1080p und bei viel
   Bewegung fällt Hardware klar ab, weil die Ratenkontrolle weniger adaptiv ist
   und die Qualität zwischen Szenen sichtbar schwankt. Bei 8–12 Mbps für 1080p
   sieht das praktisch niemand. Screen Recordings mit großen statischen Flächen
   sind ebenfalls ein günstiger Fall.

### Der eigentliche Bruch ist nicht die Bildqualität

**MediaCodec-Encoder kennen kein CRF**, nur Bitraten-Ratenkontrolle. Für eine
App, deren gesamte Qualitätslogik auf CRF aufbaut, ist das die teure Stelle:
der CRF-Zweig müsste für diesen Pfad auf eine Bitratenschätzung umgestellt
werden. Die Bausteine dafür existieren bereits in
`lib/services/output_size_estimator.dart`.

Weitere Einschränkungen:

- Wählerisch bei ungeraden Auflösungen und Pixelformaten. Einzelne Geräte
  scheitern an Konstellationen, bei denen `libx264` klaglos durchläuft — ein
  Fallback auf den Software-Encoder wäre Pflicht.
- Weniger Qualitätsstellschrauben insgesamt.

---

## 5. Alternative: Kotlin / Media3 Transformer

Der Hebel für Hardware-Encoding wäre nativ nicht FFmpeg, sondern
**Media3 Transformer** (`androidx.media3:media3-transformer`) — Googles
gepflegte Bibliothek für genau diesen Anwendungsfall (Transcodieren, Trimmen,
Auflösung ändern), die über MediaCodec und damit über die Hardware-Encoder geht.
Kein eingestelltes Projekt im Abhängigkeitsbaum.

Der Haken: Media3 deckt den Funktionsumfang dieser App nicht ab. Der Muxer
schreibt im Wesentlichen MP4. MKV, AVI mit Xvid, MPEG-TS und VP9-in-WebM
bräuchten weiterhin FFmpeg. Realistisch wäre ein Hybrid — Media3 für den
häufigen MP4-Pfad, FFmpeg für den Rest. Das ist ein ordentlicher
Architektur-Eingriff.

Da der MediaCodec-Encoder-Wrapper im bestehenden FFmpeg-Build ohnehin vorhanden
ist (Abschnitt 1), lässt sich der Nutzen von Hardware-Encoding **erst einmal
ohne diesen Umbau messen**. Erst wenn sich zeigt, dass FFmpegs
MediaCodec-Wrapper zu unzuverlässig ist, lohnt die Media3-Diskussion.

---

## 6. Offene Prüfpunkte

- [x] Gerätetest Runde 1 auf dem Pixel 10 (Ergebnisse in Abschnitt 1).
- [x] Welche `*_mediacodec`-Encoder registriert der Build? → av1, h264, hevc,
      mpeg4, vp8, vp9.
- [x] Gerätetest Runde 2 auf dem Pixel 10: MP4 per `-flags:v -global_header`
      funktioniert. Ergebnisse in Abschnitt 1.
- [x] VMAF bei 8 Mbit/s: alle innerhalb von ~3,5 Punkten.
- [x] Qualitätsreihe 2/4 Mbit/s (Xperia): HW-HEVC braucht ~2x Bitrate für x265-Qualität.
- [x] `-flags:v -global_header -tag:v hvc1 -g 150` auf Pixel 10 und Xperia 5 V
      geprüft, beide OK (Runde 3).
- [x] Gegentest Xperia 5 V: Dort bricht der MP4-Pfad nicht ab, liefert aber
      nur einen Keyframe. Das Flag ist also überall nötig.
- [ ] Entscheiden, ob H.265 der App bewusst Main 10 bleiben soll (Kompatibilität
      vs. Qualität), siehe Abschnitt 1.
- [ ] Hat das Gerät einen AV1-Hardware-Encoder? → `MediaCodecList` nach
      `video/av01` als Encoder fragen.
- [ ] Bringt `-aom-params tune-content=screen` bei Screen Recordings etwas?
      Laufzeit und Ausgabegröße gegen den aktuellen Stand vergleichen.
- [ ] Vergleichsläufe auf identischem Material (46-s-Clip, 1080p):
      `-cpu-used 8` (alt, = Stufe 6) gegen `-cpu-used 6 -lag-in-frames 5` (neu)
      gegen `-usage realtime -cpu-used 9` mit Ziel-Bitrate.
- [ ] Akzeptiert libaom in Realtime `-crf N -b:v 0`, oder bricht es ab?
- [ ] Vergleichslauf `h264_mediacodec` gegen `libx264` auf identischem
      Material: Laufzeit, Dateigröße, subjektive Qualität, Akkuverbrauch.
- [ ] AV1 in 720p einmal vollständig durchlaufen lassen (bisher existiert nur
      die 1080p-Hochrechnung, keine abgeschlossene Konvertierung).

---

## 7. Entwurf einer Rollenverteilung

Keine Entscheidung, nur eine Sortierung der Optionen:

| Encoder | Tempo | Qualität pro Bit | mögliche Rolle |
|---|---|---|---|
| `h264_mediacodec` / `hevc_mediacodec` | sehr schnell, akkuschonend | schlechter | optionaler Schnellmodus |
| `libx264` / `libx265` | Referenz | gut | Standard, bleibt Standard |
| `libvpx-vp9` | langsam | gut | WebM-Pfad |
| `libaom-av1` | unbrauchbar langsam auf 1080p | am besten | experimentell, hinter Schalter |

Die Überlegung dahinter: Der Standard bleibt unangetastet. AV1 verschwindet
hinter einen Schalter, weil es zu langsam ist; Hardware wäre ein Schalter, weil
es Qualität gegen Zeit und Akku tauscht. Beides bewusste Nutzerentscheidungen,
keine stillen Änderungen.

---

## Verwandte Dateien

- `lib/services/ffmpeg_codec_options.dart` — sämtliche FFmpeg-Argumente
- `lib/services/media_format_compatibility.dart` — Codec/Container-Matrix
- `lib/services/video_quality_scale.dart` — CRF-Skalen (0–51 vs. 0–63)
- `lib/services/output_size_estimator.dart` — Bitraten-Referenzpunkte je Codec
- `session-reports/session_report_2026_08_05_av1_encoding.md` — Umsetzungsstand
