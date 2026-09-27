// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'media_format_compatibility.dart';

class FfmpegCodecOptions {
  const FfmpegCodecOptions._();

  /// [hardware] wählt für H.265 den MediaCodec-Encoder des Geräts. Ob er für
  /// einen Auftrag greifen darf, entscheidet [usesHardwareEncoder].
  static String videoEncoder(String codec, {bool hardware = false}) =>
      switch (codec) {
        MediaFormatCompatibility.videoCodecH265 when hardware =>
          'hevc_mediacodec',
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

  /// Kann [codec] eine HDR-Quelle als HDR ausgeben?
  ///
  /// HDR braucht 10 Bit. H.264 kann das zwar als High 10, aber Androids
  /// HDR-Pipeline und die meisten Player werten AVC-HDR nicht aus — das
  /// Ergebnis sähe auf fremden Geräten falsch aus. Bleibt HEVC (Main 10) und
  /// AV1; beide übernehmen die Farbtags direkt aus den `-color_*`-Optionen,
  /// encoder-spezifische Parameter braucht es nicht.
  static bool supportsHdr(String codec) =>
      codec == MediaFormatCompatibility.videoCodecH265 ||
      codec == MediaFormatCompatibility.videoCodecAv1;

  /// Container, in die `hevc_mediacodec` auf den Testgeräten zuverlässig
  /// schreibt. MKV fehlt bewusst: Dort scheitert der Hardware-Lauf auch mit
  /// `-flags:v -global_header` auf Pixel 10 und Xperia 5 V (Gerätetest
  /// 2026-09-27, MP4/MOV/TS liefen auf beiden durch). Der Rückfall auf libx265
  /// fing das zwar ab, aber nur nach einem verlorenen ersten Lauf.
  static const hardwareContainers = {'mp4', 'mov', 'ts'};

  static bool supportsHardwareContainer(String container) =>
      hardwareContainers.contains(container);

  /// Läuft dieser Auftrag über den Hardware-Encoder?
  ///
  /// Nur H.265 hat einen Hardware-Pfad. Eine HDR-Quelle bleibt bei libx265:
  /// Der MediaCodec-Wrapper nimmt nur 8 Bit (`yuv420p`/`nv12`) an, HDR ginge
  /// verloren. Ebenso ein Container außerhalb von [hardwareContainers]. Der
  /// Schalter bleibt in beiden Fällen an, nur dieser Auftrag weicht aus.
  static bool usesHardwareEncoder({
    required String codec,
    required String container,
    required bool hardwareEncoder,
    required bool hdrSource,
  }) =>
      hardwareEncoder &&
      !hdrSource &&
      codec == MediaFormatCompatibility.videoCodecH265 &&
      supportsHardwareContainer(container);

  /// Encoder-Optionen für `hevc_mediacodec`, ergänzend zu `-b:v` aus
  /// [videoQualityArguments] (nur Bitraten-Modus) und `-pix_fmt yuv420p`.
  ///
  /// Gemessen auf Pixel 10 und Xperia 5 V (2026-09-25/27, siehe
  /// `docs/codecs_av1_und_hardware_encoding.md` Abschnitt 1):
  ///   * `-flags:v -global_header` ist Pflicht: Ohne das Flag bricht das
  ///     Pixel nach MP4/MKV mit `IllegalStateException … Released state` ab,
  ///     das Xperia liefert nur einen einzigen Keyframe.
  ///   * `-g` explizit, sonst entscheidet der Hersteller (Pixel 1 s, Xperia
  ///     gar keiner). Ziel sind ~5 s. Bei „Original“ ([fps] 0) ist die
  ///     Quellrate unbekannt; mit 30 angenommen wird es bei 60-fps-Material
  ///     alle 2,5 s ein Keyframe, das ist unkritisch.
  ///   * `-bitrate_mode vbr`: CQ unterstützt keines der getesteten Geräte.
  ///   * yuv420p statt nv12, nv12 war langsamer.
  static String hardwareEncoderArguments({required int fps}) =>
      '-bitrate_mode vbr -flags:v -global_header '
      '-g ${(fps > 0 ? fps : 30) * 5}';

  /// Pixelformat und Farbtags, die eine HDR-Quelle unverändert erhalten.
  /// [transfer] ist `arib-std-b67` (HLG) oder `smpte2084` (PQ).
  static String hdrArguments(String transfer) =>
      '-pix_fmt yuv420p10le '
      '-color_primaries bt2020 -color_trc $transfer -colorspace bt2020nc';

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

  /// [hdr] unterdrückt die fest verdrahteten BT.709-Tags, damit sie die
  /// BT.2020-Tags aus [hdrArguments] nicht überschreiben.
  static String videoEncoderArguments(
    String codec, {
    bool hdr = false,
  }) => switch (codec) {
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
      '-usage realtime -cpu-used 8 -row-mt 1 -lag-in-frames 0 -g 240'
          '${hdr ? '' : ' -colorspace bt709 -color_primaries bt709 -color_trc bt709'}',
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
