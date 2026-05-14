// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class ExpertSettings {
  final int crf;             // 0–51 (0=verlustfrei, 23=Standard)
  final String bitrateMode;  // 'crf' oder 'bitrate'
  final int targetBitrateKbps; // Ziel-Bitrate in kbps (nur bei bitrateMode='bitrate')
  final int width;           // 0 = Original beibehalten
  final int height;          // 0 = Original beibehalten
  final int fps;             // 0 = Original-FPS beibehalten
  final int audioBitrate;    // 0 = stumm, sonst kbps
  final String audioCodec;   // 'aac', 'mp3', 'opus', 'ac3'
  final int audioChannels;   // 0 = Original, 1 = Mono, 2 = Stereo, 6 = 5.1
  final String container;    // 'mp4', 'mkv', 'mov', 'avi', 'ts'
  final bool audioOnly;      // true = nur Audiospur extrahieren, kein Video

  const ExpertSettings({
    this.crf = 23,
    this.bitrateMode = 'crf',
    this.targetBitrateKbps = 5000,
    this.width = 0,
    this.height = 0,
    this.fps = 0,
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
      audioBitrate: audioBitrate ?? this.audioBitrate,
      audioCodec: audioCodec ?? this.audioCodec,
      audioChannels: audioChannels ?? this.audioChannels,
      container: container ?? this.container,
      audioOnly: audioOnly ?? this.audioOnly,
    );
  }
}
