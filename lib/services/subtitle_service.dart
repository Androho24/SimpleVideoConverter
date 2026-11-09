// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../models/burn_in_subtitle.dart';

enum SubtitleFileError { unsupportedFormat, invalid }

class SubtitleFileException implements Exception {
  final SubtitleFileError error;
  const SubtitleFileException(this.error);
}

/// Auswahl und Vorbereitung von Untertiteldateien zum Einbrennen.
class SubtitleService {
  const SubtitleService._();

  static const _channel = MethodChannel(
    'com.androho.simplevideoconverter/subtitles',
  );

  /// Großzügig wegen ASS-Dateien mit eingebetteten Schriften. Darüber ist es
  /// fast sicher keine Untertiteldatei, und sie wird komplett in den Speicher
  /// gelesen.
  static const maxFileBytes = 20 * 1024 * 1024;

  /// Liegt bewusst nicht in `conversions/`: den Ordner leert der
  /// Konvertierungs-Screen vor jedem Lauf. Als Unterordner des Cache-Roots
  /// räumt ihn `_cleanAppCache` beim nächsten App-Start ab.
  static const _cacheFolder = 'burn_in_subtitles';

  /// Android hat keine fontconfig-Konfiguration, und der vorkompilierte Build
  /// sucht unter `/usr/share/fonts`. Ohne Registrierung fände libass keine
  /// einzige Schrift. Arial wird umgeleitet, weil FFmpeg für SRT immer Arial
  /// anfordert und es auf Android fehlt; die Ersatzsuche wäre sonst zufällig.
  static const _fontDirectories = ['/system/fonts'];
  static const _fontMapping = {'Arial': 'Roboto'};

  static SubtitleFormat? formatForName(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.srt')) return SubtitleFormat.srt;
    if (lower.endsWith('.ass')) return SubtitleFormat.ass;
    return null;
  }

  /// Altcodierung, die zu Dateien in [languageCode] am ehesten passt. Null
  /// heißt Windows-1252 (westliche Sprachen, und Hindi, das keine gängige
  /// Altcodierung für Untertitel hat).
  static String? legacyCharsetFor(String languageCode) =>
      switch (languageCode) {
        'cs' || 'pl' => 'windows-1250',
        'ru' || 'uk' => 'windows-1251',
        'tr' => 'windows-1254',
        'th' => 'TIS-620',
        'ja' => 'Shift_JIS',
        _ => null,
      };

  /// Dekodiert eine Untertiteldatei, damit sie als UTF-8 gespeichert werden
  /// kann.
  ///
  /// FFmpeg verlangt UTF-8 und bricht die ganze Konvertierung sonst mit
  /// „Invalid UTF-8 in decoded subtitles text“ ab, viele SRT-Dateien sind aber
  /// noch in einer Altcodierung. Welche, verrät die Datei nicht. Nur ohne BOM
  /// und ohne gültiges UTF-8 entscheidet deshalb [languageCode] der App.
  ///
  /// Die Altcodierungen dekodiert Android: Für Shift-JIS bräuchte Dart sonst
  /// eine Tabelle mit rund 7000 Zeichen. Scheitert das, bleibt Windows-1252,
  /// damit die Datei wenigstens nutzbar ist.
  static Future<String> decodeText(
    Uint8List bytes, {
    required String languageCode,
  }) async {
    final unicode = _decodeUnicode(bytes);
    if (unicode != null) return unicode;

    final charset = legacyCharsetFor(languageCode);
    if (charset != null) {
      try {
        final text = await _channel.invokeMethod<String>('decodeLegacyText', {
          'bytes': bytes,
          'charset': charset,
        });
        if (text != null) return text;
      } catch (_) {}
    }
    return String.fromCharCodes(bytes.map(_windows1252CodePoint));
  }

  /// BOM oder gültiges UTF-8, sonst null.
  static String? _decodeUnicode(Uint8List bytes) {
    if (_startsWith(bytes, const [0xEF, 0xBB, 0xBF])) {
      return utf8.decode(bytes.sublist(3), allowMalformed: true);
    }
    if (_startsWith(bytes, const [0xFF, 0xFE])) {
      return _decodeUtf16(bytes, Endian.little);
    }
    if (_startsWith(bytes, const [0xFE, 0xFF])) {
      return _decodeUtf16(bytes, Endian.big);
    }
    try {
      return utf8.decode(bytes);
    } on FormatException {
      return null;
    }
  }

  static bool _startsWith(Uint8List bytes, List<int> prefix) {
    if (bytes.length < prefix.length) return false;
    for (var i = 0; i < prefix.length; i++) {
      if (bytes[i] != prefix[i]) return false;
    }
    return true;
  }

  static String _decodeUtf16(Uint8List bytes, Endian endian) {
    final data = ByteData.sublistView(bytes);
    final units = <int>[
      for (var i = 2; i + 1 < bytes.length; i += 2) data.getUint16(i, endian),
    ];
    return String.fromCharCodes(units);
  }

  static const _windows1252HighRange = [
    0x20AC, 0x81, 0x201A, 0x0192, 0x201E, 0x2026, 0x2020, 0x2021, //
    0x02C6, 0x2030, 0x0160, 0x2039, 0x0152, 0x8D, 0x017D, 0x8F, //
    0x90, 0x2018, 0x2019, 0x201C, 0x201D, 0x2022, 0x2013, 0x2014, //
    0x02DC, 0x2122, 0x0161, 0x203A, 0x0153, 0x9D, 0x017E, 0x0178,
  ];

  static int _windows1252CodePoint(int byte) =>
      byte >= 0x80 && byte <= 0x9F ? _windows1252HighRange[byte - 0x80] : byte;

  /// Würde FFmpeg die Datei annehmen? Spart eine fehlschlagende Konvertierung.
  static bool hasSubtitles(String text, SubtitleFormat format) {
    if (text.contains('\u0000')) return false;
    return format == SubtitleFormat.ass ? _isAss(text) : _isSrt(text);
  }

  /// Bildet die Erkennung des SRT-Demuxers nach: Die erste nichtleere Zeile
  /// beginnt mit einer Zahl, die nächste ist die Zeitangabe mit genau
  /// „ --> “. Andere Dateien lehnt FFmpeg trotz Endung `.srt` ab.
  static bool _isSrt(String text) {
    final lines = text.split(RegExp(r'\r\n|\r|\n'));
    final first = lines.indexWhere((line) => line.isNotEmpty);
    if (first == -1 || first + 1 >= lines.length) return false;
    return RegExp(r'^\s*\+?\d').hasMatch(lines[first]) &&
        RegExp(
          r'^-?\d+:\d+:\d+[,.]\d+ --> -?\d+:\d+:\d+',
        ).hasMatch(lines[first + 1]);
  }

  /// libass braucht neben den Events einen erkennbaren Dateityp, sonst
  /// scheitert `ass_read_file` („Could not create a libass track“).
  static bool _isAss(String text) {
    final lower = text.toLowerCase();
    final hasType = lower.contains('scripttype:') || lower.contains('[v4');
    return hasType &&
        lower.contains('[events]') &&
        RegExp(r'^\s*dialogue:', multiLine: true).hasMatch(lower);
  }

  /// Öffnet die Dateiauswahl des Systems. Null, wenn sie abgebrochen wurde.
  ///
  /// `FileType.any`, weil `file_picker` Endungen über Androids MIME-Tabelle
  /// abbildet und `.srt`/`.ass` dort nicht zuverlässig stehen; die Endung wird
  /// hier geprüft. `file_picker` kopiert die `content://`-URI in den Cache.
  /// Das braucht es auch: libass öffnet ASS-Dateien selbst über einen echten
  /// Dateipfad, FFmpegs `saf:`-Verweise kennt es nicht.
  ///
  /// Die eigene Kopie hat einen festen ASCII-Namen, damit Sonderzeichen im
  /// Dateinamen weder im Filtergraphen noch in den Crashlytics-Logs landen.
  ///
  /// [languageCode] ist die App-Sprache, siehe [decodeText].
  static Future<BurnInSubtitle?> pick({required String languageCode}) async {
    final FilePickerResult? result;
    try {
      result = await FilePicker.pickFiles(type: FileType.any);
    } catch (_) {
      throw const SubtitleFileException(SubtitleFileError.invalid);
    }
    final picked = result?.files.single;
    if (picked == null) return null;

    final format = formatForName(picked.name);
    final pickedPath = picked.path;
    try {
      if (format == null) {
        throw const SubtitleFileException(SubtitleFileError.unsupportedFormat);
      }
      if (pickedPath == null) {
        throw const SubtitleFileException(SubtitleFileError.invalid);
      }
      return await _copyToCache(pickedPath, picked.name, format, languageCode);
    } on FileSystemException {
      throw const SubtitleFileException(SubtitleFileError.invalid);
    } finally {
      if (pickedPath != null) await _deleteQuietly(pickedPath);
    }
  }

  static Future<BurnInSubtitle> _copyToCache(
    String sourcePath,
    String displayName,
    SubtitleFormat format,
    String languageCode,
  ) async {
    final source = File(sourcePath);
    if (await source.length() > maxFileBytes) {
      throw const SubtitleFileException(SubtitleFileError.invalid);
    }
    final text = await decodeText(
      await source.readAsBytes(),
      languageCode: languageCode,
    );
    if (!hasSubtitles(text, format)) {
      throw const SubtitleFileException(SubtitleFileError.invalid);
    }

    final tmpDir = await getTemporaryDirectory();
    final dir = await Directory(
      '${tmpDir.path}/$_cacheFolder',
    ).create(recursive: true);
    final stamp = DateTime.now().millisecondsSinceEpoch;
    final target = File('${dir.path}/subtitle_$stamp.${format.name}');
    await target.writeAsString(text, flush: true);
    return BurnInSubtitle(
      path: target.path,
      displayName: displayName,
      format: format,
    );
  }

  /// Unmittelbar vor der Konvertierung: Datei noch da, Schriften registriert?
  ///
  /// Die Registrierung läuft jedes Mal neu, weil `_cleanAppCache` den Ordner
  /// `fontconfig/` mit der Konfiguration beim App-Start löscht. Sie setzt nur
  /// eine Umgebungsvariable und betrifft Aufträge ohne Untertitel nicht.
  static Future<bool> prepareForConversion(BurnInSubtitle subtitle) async {
    try {
      final file = File(subtitle.path);
      if (!await file.exists() || await file.length() == 0) return false;
      if (Platform.isAndroid) {
        await FFmpegKitConfig.setFontDirectoryList(
          _fontDirectories,
          _fontMapping,
        );
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> delete(BurnInSubtitle subtitle) =>
      _deleteQuietly(subtitle.path);

  static Future<void> _deleteQuietly(String path) async {
    try {
      await File(path).delete();
    } catch (_) {}
  }
}
