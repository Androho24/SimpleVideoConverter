// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class VideoScaleService {
  const VideoScaleService._();

  /// Returns the stored short side. A 90/270-degree rotation swaps width and
  /// height, so the short side stays valid even before display rotation.
  static int sourceShortSide(int width, int height) {
    if (width <= 0 || height <= 0) return 0;
    return width < height ? width : height;
  }

  static int probeRotationDegrees(Map<dynamic, dynamic>? properties) {
    dynamic rotation;
    final sideData = properties?['side_data_list'];
    if (sideData is List) {
      for (final entry in sideData) {
        if (entry is Map && entry['rotation'] != null) {
          rotation = entry['rotation'];
          break;
        }
      }
    }
    final tags = properties?['tags'];
    if (rotation == null && tags is Map) rotation = tags['rotate'];

    final parsed = rotation is num
        ? rotation.round()
        : double.tryParse(rotation?.toString() ?? '')?.round() ?? 0;
    return ((parsed % 360) + 360) % 360;
  }

  static double? parseAspectRatio(String? value) {
    if (value == null || value.isEmpty || value == 'N/A') return null;
    final parts = value.split(':');
    if (parts.length == 2) {
      final numerator = double.tryParse(parts[0]);
      final denominator = double.tryParse(parts[1]);
      if (numerator != null && denominator != null && denominator > 0) {
        return numerator / denominator;
      }
    }
    final ratio = double.tryParse(value);
    return ratio != null && ratio > 0 ? ratio : null;
  }

  /// Converts encoded dimensions into display-oriented square-pixel dimensions.
  static (int, int) displayDimensions({
    required int encodedWidth,
    required int encodedHeight,
    required int rotationDegrees,
    String? displayAspectRatio,
  }) {
    if (encodedWidth <= 0 || encodedHeight <= 0) return (0, 0);

    final quarterTurn = rotationDegrees == 90 || rotationDegrees == 270;
    final orientedWidth = quarterTurn ? encodedHeight : encodedWidth;
    final orientedHeight = quarterTurn ? encodedWidth : encodedHeight;
    final encodedDar = parseAspectRatio(displayAspectRatio);
    if (encodedDar == null) return (orientedWidth, orientedHeight);

    final displayDar = quarterTurn ? 1 / encodedDar : encodedDar;
    if (displayDar >= 1) {
      return (_nearestEven(orientedHeight * displayDar), orientedHeight);
    }
    return (orientedWidth, _nearestEven(orientedWidth / displayDar));
  }

  /// Predicts the square-pixel dimensions produced by [standardFilter].
  static (int, int) estimatedStandardDimensions({
    required int sourceWidth,
    required int sourceHeight,
    required int targetShortSide,
  }) {
    if (sourceWidth <= 0 || sourceHeight <= 0) return (0, 0);
    final sourceShort = sourceShortSide(sourceWidth, sourceHeight);
    final requestedShort = targetShortSide <= 0 ? sourceShort : targetShortSide;
    final outputShort = _floorEven(
      requestedShort < sourceShort ? requestedShort : sourceShort,
    );
    final sourceLong = sourceWidth > sourceHeight ? sourceWidth : sourceHeight;
    final outputLong = _nearestEven(outputShort * sourceLong / sourceShort);
    return sourceWidth >= sourceHeight
        ? (outputLong, outputShort)
        : (outputShort, outputLong);
  }

  static int _floorEven(num value) {
    final even = (value.floor() ~/ 2) * 2;
    return even < 2 ? 2 : even;
  }

  static int _nearestEven(num value) {
    final even = (value / 2).round() * 2;
    return even < 2 ? 2 : even;
  }

  /// Builds a filter that treats [targetShortSide] as 360p/480p/720p/etc.
  ///
  /// FFmpeg inserts autorotation before user video filters. `dar` and `iw`/`ih`
  /// therefore describe the display-oriented frame here, including a phone
  /// video's 90/270-degree rotation. Only the short side is fixed; `-2` lets
  /// FFmpeg derive an even long side without stretching. `min` prevents
  /// upscaling, and the explicit truncation also keeps a smaller odd source
  /// dimension compatible with yuv420p encoders.
  static String standardFilter(int targetShortSide, {String? hdrTransfer}) {
    final graph = targetShortSide <= 0 ? '' : standardGraph(targetShortSide);
    return filterArgument(graph, hdrTransfer: hdrTransfer);
  }

  /// Nur der Scale-Graph aus [standardFilter], ohne `-vf`-Präfix.
  static String standardGraph(int targetShortSide) {
    final evenPortraitWidth = 'trunc(min($targetShortSide,iw)/2)*2';
    final evenLandscapeHeight = 'trunc(min($targetShortSide,ih)/2)*2';
    return "scale=w='if(gte(dar,1),-2,$evenPortraitWidth)'"
        ":h='if(gte(dar,1),$evenLandscapeHeight,-2)'"
        ':reset_sar=1';
  }

  /// Seitenverhältnis-Vorgaben im Expertenmodus (Breite / Höhe).
  static const aspectRatios = {
    '16:9': 16 / 9,
    '4:3': 4 / 3,
    '21:9': 21 / 9,
    '1:1': 1.0,
    '9:16': 9 / 16,
    '9:21': 9 / 21,
  };

  /// Längste Rahmenseite, die Balken/Strecken erzeugen dürfen, sofern die
  /// Quelle nicht selbst länger ist. 4K mit Balken auf 21:9 ergäbe sonst
  /// 5040×2160 (10,9 MP): über Level 5.x von H.264/H.265 (ca. 8,9–9,4 MP),
  /// jenseits der Breite der meisten Hardware-HEVC-Encoder (3840/4096) und
  /// auf vielen Geräten nicht abspielbar.
  static const maxFrameLongSide = 3840;

  /// Zahlenwert einer Vorgabe aus [aspectRatios], null für „Original“ und
  /// „Benutzerdefiniert“.
  static double? aspectRatioValue(String id) => aspectRatios[id];

  /// Anpassung, wenn das Zielformat ein anderes Seitenverhältnis hat als die
  /// Quelle.
  static const fitPad = 'pad';
  static const fitCrop = 'crop';
  static const fitStretch = 'stretch';

  /// Weicht [width]×[height] mehr als 1 % vom Seitenverhältnis der Quelle ab?
  /// Die Toleranz fängt die Rundung auf gerade Maße ab (1080p-Hochkant aus
  /// 1920×1080 ergibt z. B. 608×1080 statt 607,5×1080).
  static bool changesAspect({
    required int width,
    required int height,
    required int sourceWidth,
    required int sourceHeight,
  }) {
    if (width <= 0 || height <= 0 || sourceWidth <= 0 || sourceHeight <= 0) {
      return false;
    }
    final source = sourceWidth / sourceHeight;
    return ((width / height) - source).abs() / source > 0.01;
  }

  /// Zielmaße im Expertenmodus aus Auflösungsstufe ([shortSide], 0 = Quelle)
  /// und Seitenverhältnis ([aspectRatio], null = wie die Quelle).
  ///
  /// Nie hochskalieren, deshalb je nach [fitMode] verschieden:
  ///   * Balken/Strecken: Die kurze Seite des Rahmens bleibt die der Quelle
  ///     (bzw. der Stufe), die lange folgt dem Zielverhältnis. 4:3 1440×1080
  ///     → 16:9 ergibt 1920×1080 mit Balken, 16:9 → 9:16 ergibt 1080×1920.
  ///     Die lange Seite endet bei [maxFrameLongSide]: 4K → 21:9 ergibt
  ///     3840×1646 statt 5040×2160.
  ///   * Zuschneiden: Der größte Ausschnitt im Zielverhältnis, der in die
  ///     Quelle passt, höchstens auf die Stufe verkleinert. 1920×1080 → 9:16
  ///     ergibt 608×1080; mit dem Balken-Rahmen 1080×1920 müsste der Inhalt auf
  ///     das 1,8-Fache vergrößert werden.
  static (int, int) expertFrameDimensions({
    required int sourceWidth,
    required int sourceHeight,
    required int shortSide,
    required double? aspectRatio,
    required String fitMode,
  }) {
    if (sourceWidth <= 0 || sourceHeight <= 0) return (0, 0);
    if (aspectRatio == null) {
      return shortSide <= 0
          ? (sourceWidth, sourceHeight)
          : estimatedStandardDimensions(
              sourceWidth: sourceWidth,
              sourceHeight: sourceHeight,
              targetShortSide: shortSide,
            );
    }

    final longFactor = aspectRatio >= 1 ? aspectRatio : 1 / aspectRatio;
    var maxLong = 1 << 30;
    int frameShort;
    if (fitMode == fitCrop) {
      final sourceRatio = sourceWidth / sourceHeight;
      final (cropWidth, cropHeight) = sourceRatio > aspectRatio
          ? (sourceHeight * aspectRatio, sourceHeight.toDouble())
          : (sourceWidth.toDouble(), sourceWidth / aspectRatio);
      final cropShort = cropWidth < cropHeight ? cropWidth : cropHeight;
      frameShort = shortSide > 0 && shortSide < cropShort
          ? _floorEven(shortSide)
          : _nearestEven(cropShort);
    } else {
      final sourceShort = sourceShortSide(sourceWidth, sourceHeight);
      frameShort = _floorEven(
        shortSide > 0 && shortSide < sourceShort ? shortSide : sourceShort,
      );
      // Zuschneiden bleibt ohnehin innerhalb der Quelle, nur der verlängerte
      // Rahmen kann über 4K hinauswachsen.
      final sourceLong = sourceWidth > sourceHeight
          ? sourceWidth
          : sourceHeight;
      maxLong = sourceLong > maxFrameLongSide ? sourceLong : maxFrameLongSide;
      if (frameShort * longFactor > maxLong) {
        frameShort = _nearestEven(maxLong / longFactor);
      }
    }
    // Die Rundung auf gerade Maße darf die Grenze nicht überschreiten.
    final roundedLong = _nearestEven(frameShort * longFactor);
    final frameLong = roundedLong > maxLong ? maxLong : roundedLong;
    return aspectRatio >= 1 ? (frameLong, frameShort) : (frameShort, frameLong);
  }

  /// Scale-Graph des Expertenmodus ohne `-vf`-Präfix. Leer bei 0×0.
  ///
  /// Ist nur eine Seite gesetzt, rechnet FFmpeg die andere per `-2` selbst.
  /// Sind beide gesetzt und weicht das Verhältnis von der Quelle ab, greift
  /// [fitMode]; Strecken ist nur noch eine bewusste Wahl (bis 2026-09 war es
  /// das stillschweigende Verhalten).
  ///
  /// `reset_sar=1` steht bewusst in jeder Variante mit festen Maßen: Die Maße
  /// stammen aus quadratischen Anzeige-Pixeln (siehe [displayDimensions]).
  /// Ohne die Option übernimmt `scale` das Pixelverhältnis einer anamorphen
  /// Quelle, und `force_original_aspect_ratio` rechnet mit den gespeicherten
  /// statt den angezeigten Maßen: Ein 1440×1080-Video mit SAR 4:3 (Anzeige
  /// 16:9) landete bei „4:3 mit Balken“ gestaucht ohne Balken im Bild.
  /// Geprüft mit FFmpeg 8 (Desktop), cropdetect + PSNR gegen eine Referenz.
  static String expertGraph({
    required int width,
    required int height,
    required String fitMode,
    required int sourceWidth,
    required int sourceHeight,
  }) {
    if (width <= 0 && height <= 0) return '';
    if (height <= 0) return 'scale=$width:-2';
    if (width <= 0) return 'scale=-2:$height';

    final fits = changesAspect(
      width: width,
      height: height,
      sourceWidth: sourceWidth,
      sourceHeight: sourceHeight,
    );
    if (!fits || fitMode == fitStretch) {
      return 'scale=$width:$height:reset_sar=1';
    }
    if (fitMode == fitCrop) {
      // crop schneidet ohne x/y mittig aus.
      return 'scale=$width:$height:force_original_aspect_ratio=increase'
          ':reset_sar=1,crop=$width:$height';
    }
    // force_divisible_by hält das eingepasste Bild auf geraden Maßen, damit
    // die Balken links/rechts bzw. oben/unten gleich breit werden.
    return 'scale=$width:$height:force_original_aspect_ratio=decrease'
        ':force_divisible_by=2:reset_sar=1,'
        'pad=$width:$height:(ow-iw)/2:(oh-ih)/2';
  }

  /// Die Transferfunktion einer HDR-Quelle, sonst null. `arib-std-b67` ist HLG
  /// (so nimmt die Pixel-Kamera auf), `smpte2084` ist PQ/HDR10.
  static String? hdrTransfer(dynamic colorTransfer) {
    final value = colorTransfer?.toString().toLowerCase();
    return (value == 'arib-std-b67' || value == 'smpte2084') ? value : null;
  }

  static bool isHdrTransfer(dynamic colorTransfer) =>
      hdrTransfer(colorTransfer) != null;

  /// HDR (BT.2020, HLG/PQ) → SDR (BT.709).
  ///
  /// Ohne diese Kette interpretiert der Encoder die HDR-Werte als wären sie
  /// BT.709 — das Bild wird flau und entsättigt. Tonemapping braucht lineares
  /// Licht, deshalb der Umweg über `zscale=t=linear` und Float-Pixel; `hable`
  /// hält Lichter und Mitten am ausgewogensten, `desat=0` verhindert das
  /// Ausbleichen heller Flächen. Kostet rund 20 % Encoding-Geschwindigkeit.
  ///
  /// Die Eingangsseite wird mit `tin`/`min`/`pin`/`rin` explizit gesetzt, statt
  /// zimg herleiten zu lassen: der Android-Build quittiert die Herleitung mit
  /// "generic error in an external library". HDR-Quellen sind praktisch immer
  /// BT.2020 mit begrenztem Wertebereich. Das Ergebnis ist bitgleich zur
  /// hergeleiteten Variante (lokal gegen FFmpeg 8 geprüft).
  static String hdrToSdrGraph(String transfer) =>
      'zscale=tin=$transfer:min=bt2020nc:pin=bt2020:rin=tv:t=linear:npl=100,'
      'format=gbrpf32le,zscale=p=bt709,'
      'tonemap=tonemap=hable:desat=0,'
      'zscale=t=bt709:m=bt709:p=bt709:r=tv,format=yuv420p';

  /// Setzt das komplette `-vf`-Argument aus [graph] und optionalem Tonemapping
  /// zusammen. Leer, wenn beides entfällt.
  static String filterArgument(String graph, {String? hdrTransfer}) {
    final parts = [
      if (graph.isNotEmpty) graph,
      if (hdrTransfer != null) hdrToSdrGraph(hdrTransfer),
    ];
    return parts.isEmpty ? '' : '-vf "${parts.join(',')}"';
  }
}
