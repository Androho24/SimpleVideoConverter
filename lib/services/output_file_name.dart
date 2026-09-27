// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

/// Dateinamen der Ausgabe.
///
/// Ein Video landet unter dem Namen des Originals in der Galerie, nur mit
/// der Endung des Zielformats (`Urlaub.mov` → `Urlaub.mp4`). Gal übernimmt
/// dafür den Namen der Cache-Datei; bis 2026-09 war das `converted_<Zeit>`,
/// und Nutzer mussten jedes Video von Hand umbenennen. Einen Namen, den es im
/// Album schon gibt, benennt MediaStore selbst um (`Urlaub (1).mp4`).
class OutputFileName {
  const OutputFileName._();

  /// Obergrenze in Zeichen. MediaStore und die meisten Dateisysteme erlauben
  /// 255 Byte; mit Umlauten, Endung und einem „ (1)“ bleibt so genug Luft.
  static const maxLength = 100;

  /// Name des Originals ohne Endung, bereinigt für Dateisystem und Befehl.
  ///
  /// Der Ausgabepfad steht in doppelten Anführungszeichen im FFmpeg-Befehl,
  /// den FFmpegKits eigener Parser zerlegt: Ein `"` im Namen würde das
  /// Argument beenden, ein `\` davor die Anführung aufheben. Beide fliegen
  /// raus, dazu die Zeichen, die Android-Dateisysteme (FAT/exFAT auf
  /// SD-Karten) ablehnen. Leerzeichen, Apostrophe und Umlaute bleiben.
  static String baseName(String sourcePath) {
    final fileName = sourcePath.split('/').last;
    final dot = fileName.lastIndexOf('.');
    // Ein Name, der nur aus der Endung besteht (`.mp4`), hat keinen Stamm.
    final stem = dot >= 0 ? fileName.substring(0, dot) : fileName;
    var cleaned = stem
        .replaceAll(RegExp(r'[\x00-\x1f"\\/:*?<>|]'), '_')
        .trim()
        // Führende Punkte machen die Datei unsichtbar.
        .replaceFirst(RegExp(r'^\.+'), '')
        .trim();
    final runes = cleaned.runes.toList();
    if (runes.length > maxLength) {
      cleaned = String.fromCharCodes(runes.take(maxLength)).trim();
    }
    return cleaned.isEmpty ? 'video' : cleaned;
  }
}
