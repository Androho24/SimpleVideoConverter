// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class ExpertSettings {
  // 0–51 bei x264/x265/Xvid (23=Standard), 0–63 bei VP9/AV1.
  // Umrechnung beim Codec-Wechsel: VideoQualityScale.convertCrf.
  final int crf;
  final String bitrateMode; // 'crf' oder 'bitrate'
  final int
  targetBitrateKbps; // Ziel-Bitrate in kbps (nur bei bitrateMode='bitrate')
  final int width; // 0 = Original beibehalten
  final int height; // 0 = Original beibehalten
  final int fps; // 0 = Original-FPS beibehalten
  final String videoCodec; // 'h264', 'h265', 'vp9', 'xvid'
  final int audioBitrate; // 0 = stumm, sonst kbps
  final String audioCodec; // 'aac', 'mp3', 'opus', 'ac3', 'vorbis'
  final int audioChannels; // 0 = Original, 1 = Mono, 2 = Stereo, 6 = 5.1
  final String container; // 'mp4', 'mkv', 'mov', 'avi', 'ts', 'webm'
  final bool audioOnly; // true = nur Audiospur extrahieren, kein Video

  const ExpertSettings({
    this.crf = 23,
    this.bitrateMode = 'crf',
    this.targetBitrateKbps = 5000,
    this.width = 0,
    this.height = 0,
    this.fps = 0,
    this.videoCodec = 'h264',
    this.audioBitrate = 128,
    this.audioCodec = 'aac',
    this.audioChannels = 0,
    this.container = 'mp4',
    this.audioOnly = false,
  });

  ExpertSettings copyWith({
    int? crf,
    String? bitrateMode,
    int? targetBitrateKbps,
    int? width,
    int? height,
    int? fps,
    String? videoCodec,
    int? audioBitrate,
    String? audioCodec,
    int? audioChannels,
    String? container,
    bool? audioOnly,
  }) {
    return ExpertSettings(
      crf: crf ?? this.crf,
      bitrateMode: bitrateMode ?? this.bitrateMode,
      targetBitrateKbps: targetBitrateKbps ?? this.targetBitrateKbps,
      width: width ?? this.width,
      height: height ?? this.height,
      fps: fps ?? this.fps,
      videoCodec: videoCodec ?? this.videoCodec,
      audioBitrate: audioBitrate ?? this.audioBitrate,
      audioCodec: audioCodec ?? this.audioCodec,
      audioChannels: audioChannels ?? this.audioChannels,
      container: container ?? this.container,
      audioOnly: audioOnly ?? this.audioOnly,
    );
  }
}
