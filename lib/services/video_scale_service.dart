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
  static String standardFilter(int targetShortSide) {
    if (targetShortSide <= 0) return '';

    final evenPortraitWidth = 'trunc(min($targetShortSide,iw)/2)*2';
    final evenLandscapeHeight = 'trunc(min($targetShortSide,ih)/2)*2';
    final graph =
        "scale=w='if(gte(dar,1),-2,$evenPortraitWidth)'"
        ":h='if(gte(dar,1),$evenLandscapeHeight,-2)'"
        ':reset_sar=1';
    return '-vf "$graph"';
  }
}
