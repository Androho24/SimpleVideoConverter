// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class ExpertSettings {
  final int crf;           // 0–51 (0=verlustfrei, 23=Standard)
  final int maxDimension;  // 0 = Original-Auflösung beibehalten
  final int fps;           // 0 = Original-FPS beibehalten
  final int audioBitrate;  // 0 = stumm, sonst kbps (64/96/128/192/320)
  final String audioCodec; // 'aac', 'mp3', 'opus'
  final String container;  // 'mp4', 'mkv'

  const ExpertSettings({
    this.crf = 23,
    this.maxDimension = 0,
    this.fps = 0,
    this.audioBitrate = 128,
    this.audioCodec = 'aac',
    this.container = 'mp4',
  });

  ExpertSettings copyWith({
    int? crf,
    int? maxDimension,
    int? fps,
    int? audioBitrate,
    String? audioCodec,
    String? container,
  }) {
    return ExpertSettings(
      crf: crf ?? this.crf,
      maxDimension: maxDimension ?? this.maxDimension,
      fps: fps ?? this.fps,
      audioBitrate: audioBitrate ?? this.audioBitrate,
      audioCodec: audioCodec ?? this.audioCodec,
      container: container ?? this.container,
    );
  }
}
