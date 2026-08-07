// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'media_format_compatibility.dart';

class FfmpegCodecOptions {
  const FfmpegCodecOptions._();

  static String videoEncoder(String codec) => switch (codec) {
    MediaFormatCompatibility.videoCodecH265 => 'libx265',
    MediaFormatCompatibility.videoCodecVp9 => 'libvpx-vp9',
    MediaFormatCompatibility.videoCodecAv1 => 'libaom-av1',
    MediaFormatCompatibility.videoCodecXvid => 'libxvid',
    _ => 'libx264',
  };

  static String audioEncoder(String codec) => switch (codec) {
    MediaFormatCompatibility.audioCodecMp3 => 'libmp3lame',
    MediaFormatCompatibility.audioCodecOpus => 'libopus',
    MediaFormatCompatibility.audioCodecVorbis => 'libvorbis',
    MediaFormatCompatibility.audioCodecAc3 => 'ac3',
    _ => 'aac',
  };

  static String audioOnlyExtension(String codec) => switch (codec) {
    MediaFormatCompatibility.audioCodecAac => 'm4a',
    MediaFormatCompatibility.audioCodecMp3 => 'mp3',
    MediaFormatCompatibility.audioCodecOpus => 'opus',
    MediaFormatCompatibility.audioCodecVorbis => 'ogg',
    MediaFormatCompatibility.audioCodecAc3 => 'ac3',
    _ => 'm4a',
  };

  static String videoQualityArguments({
    required String codec,
    required String bitrateMode,
    required int crf,
    required int targetBitrateKbps,
  }) {
    if (bitrateMode == 'bitrate') return '-b:v ${targetBitrateKbps}k';
    // VP9 und AV1 nutzen eine 0–63-Skala und brauchen -b:v 0 für echtes CRF.
    if (codec == MediaFormatCompatibility.videoCodecVp9 ||
        codec == MediaFormatCompatibility.videoCodecAv1) {
      return '-crf ${crf.clamp(0, 63)} -b:v 0';
    }
    if (codec == MediaFormatCompatibility.videoCodecXvid) {
      final qscale = (1 + ((crf - 1).clamp(0, 50) * 30 / 50)).round();
      return '-q:v $qscale';
    }
    return '-crf ${crf.clamp(0, 51)}';
  }

  static String videoEncoderArguments(String codec) => switch (codec) {
    MediaFormatCompatibility.videoCodecVp9 =>
      '-deadline good -cpu-used 4 '
          '-colorspace bt709 -color_primaries bt709 -color_trc bt709',
    // libaom ist auf Mobilgeräten sehr langsam. cpu-used 6 ist im Good-Quality-
    // Modus das Maximum ("0..6 in good mode" laut libaom); höhere Werte werden
    // zwar akzeptiert, laufen aber auf Stufe 6 hinaus. Zusätzliches Tempo kommt
    // hier aus dem verkürzten Lookahead (Default 19) — das spart die teure
    // Alt-Ref-Maschinerie. Die Kachelaufteilung bleibt bewusst automatisch,
    // sonst scheitert libaom bei kleinen Auflösungen.
    //
    // Bewusst kein -tune-content screen: die Option aktiviert Palettenmodus und
    // Intra Block Copy, die nur bei Bildschirmaufnahmen etwas bringen. Da das
    // Eingangsmaterial unbekannt ist, bleibt sie aus.
    //
    // -usage realtime schaltet einen völlig anderen Satz an Speed-Features
    // frei: gemessen 10 s statt 85 s für 3 s 720p-Material (2026-08-05). Preis:
    // deutlich schlechtere Qualität pro Bit. Bewusst beibehalten, solange AV1
    // nur hinter der Experimentell-Option in den App-Einstellungen bzw. im
    // Expertenmodus erreichbar ist — ohne Realtime ist AV1 auf Mobilgeräten
    // unbenutzbar langsam. Zwei Fallstricke:
    //   * cpu-used bleibt bei 8 — libaom erlaubt in Realtime zwar bis 10, aber
    //     FFmpegs Wrapper deckelt die Option bei 8 und lehnt höhere Werte mit
    //     "Error setting option cpu-used to value 9." ab. Anders als im Good
    //     Mode (dort endet die Skala effektiv bei 6) ist 8 hier wirksam.
    //   * Realtime verlangt Low-Delay, daher -lag-in-frames 0. libaom lehnt
    //     Zwischenwerte ab: "Set lag in frames to 0 (low delay) or >=
    //     (max-gf-interval + 2)".
    MediaFormatCompatibility.videoCodecAv1 =>
      '-usage realtime -cpu-used 8 -row-mt 1 -lag-in-frames 0 -g 240 '
          '-colorspace bt709 -color_primaries bt709 -color_trc bt709',
    _ => '',
  };

  static String codecTagArguments(String codec, String container) {
    final isMp4Family = container == 'mp4' || container == 'mov';
    if (!isMp4Family) return '';
    return switch (codec) {
      MediaFormatCompatibility.videoCodecH265 => '-tag:v hvc1',
      MediaFormatCompatibility.videoCodecAv1 => '-tag:v av01',
      _ => '',
    };
  }
}
