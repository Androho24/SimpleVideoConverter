// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

enum SubtitleFormat { srt, ass }

/// Darstellung von SRT-Untertiteln. ASS bringt seine eigene mit.
enum SubtitleTextSize { small, medium, large }

enum SubtitlePosition { bottom, top }

/// Eine Untertiteldatei, die ins Video eingebrannt wird.
class BurnInSubtitle {
  /// App-interne Kopie im Cache, siehe `SubtitleService.pick`. Nur dieser
  /// Pfad erreicht FFmpeg, nie der Name der Originaldatei.
  final String path;

  /// Name der Originaldatei, nur für die Anzeige.
  final String displayName;
  final SubtitleFormat format;

  const BurnInSubtitle({
    required this.path,
    required this.displayName,
    required this.format,
  });
}
