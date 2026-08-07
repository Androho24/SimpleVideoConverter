// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'media_format_compatibility.dart';

/// CRF-Skalen der Encoder unterscheiden sich: x264/x265/Xvid arbeiten mit
/// 0–51, libvpx-vp9 und libaom-av1 mit 0–63. Gleiche Zahl heißt dort *nicht*
/// gleiche Qualität — CRF 23 ist bei AV1 bereits sehr hohe Qualität und damit
/// unnötig langsam. Beim Codec-Wechsel wird der Wert deshalb umgerechnet.
class VideoQualityScale {
  const VideoQualityScale._();

  static const _standardMaxCrf = 51;
  static const _wideMaxCrf = 63;

  /// Erfahrungswert für vergleichbare Qualität: libvpx/libaom brauchen rund
  /// 8 Stufen mehr als x264. Deckt sich mit den Referenzpunkten in
  /// [OutputSizeEstimator] (H.264 → 23, VP9 → 31, AV1 → 30).
  static const _wideScaleOffset = 8;

  /// True für Encoder mit 0–63-Skala.
  static bool usesWideScale(String codec) =>
      codec == MediaFormatCompatibility.videoCodecVp9 ||
      codec == MediaFormatCompatibility.videoCodecAv1;

  /// Größter auswählbarer CRF-Wert des Codecs.
  static int maxCrf(String codec) =>
      usesWideScale(codec) ? _wideMaxCrf : _standardMaxCrf;

  /// Rechnet einen CRF-Wert beim Codec-Wechsel auf die Zielskala um, damit die
  /// wahrgenommene Qualität ungefähr gleich bleibt.
  static int convertCrf(
    int crf, {
    required String fromCodec,
    required String toCodec,
  }) {
    final from = usesWideScale(fromCodec);
    final to = usesWideScale(toCodec);
    final converted = from == to
        ? crf
        : (to ? crf + _wideScaleOffset : crf - _wideScaleOffset);
    return converted.clamp(1, maxCrf(toCodec));
  }
}
