// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';

/// Quelle eines geladenen Videos: ein Dateipfad (Kopie im Cache, iOS) oder
/// eine `content://`-URI, die direkt gelesen wird (OriginalVideoPicker.kt).
///
/// FFmpeg kann `content://` nicht selbst öffnen, sondern nur über FFmpegKits
/// `saf:`-Verweis. Der gilt genau für einen Lauf: FFmpegKit löscht ihn, sobald
/// FFmpeg die Datei schließt (`safClose`, per javap geprüft). Probe,
/// Konvertierung und der Ersatzlauf ohne Hardware-Encoder brauchen deshalb
/// jeweils einen eigenen. Das Öffnen selbst passiert erst beim Lauf, ein
/// unbenutzter Verweis kostet also nichts.
class VideoSource {
  const VideoSource._();

  static bool isContentUri(String source) => source.startsWith('content://');

  /// Eingabe für genau einen FFmpeg- oder FFprobe-Lauf. Wirft, wenn sich die
  /// URI nicht mehr öffnen lässt (Original gelöscht, Berechtigung weg).
  static Future<String> ffmpegPath(String source) async {
    if (!isContentUri(source)) return source;
    final saf = await FFmpegKitConfig.getSafParameterForRead(source);
    if (saf == null) throw StateError('Kein saf-Verweis für $source');
    return saf;
  }

  /// Wie [ffmpegPath], als Argument für einen Befehlsstring. Die Anführung
  /// hält Leerzeichen im Pfad zusammen; FFmpegKits Parser entfernt sie.
  static Future<String> ffmpegArgument(String source) async =>
      '"${await ffmpegPath(source)}"';
}
