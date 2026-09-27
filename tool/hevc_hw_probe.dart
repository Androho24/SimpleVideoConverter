// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

// Gerätetest für Hardware-Encoding über MediaCodec (hevc_mediacodec /
// h264_mediacodec) im gebündelten FFmpegKit-Build. Kein Teil der App — eigener
// Einstiegspunkt, der nur über `flutter run -t tool/hevc_hw_probe.dart` läuft
// und vom Release-Build nicht erreicht wird.
//
// Klärt vor der Feature-Planung:
// - welche *_mediacodec-Encoder der Build registriert und welche Optionen sie
//   kennen,
// - ob der Encoder in MP4/MKV schreiben kann (Global Header) oder nur in TS,
// - welche Bitraten-Modi, Pixelformate und Auflösungen das Gerät annimmt,
// - Laufzeit und Dateigröße gegen libx265/libx264 bei gleicher Zielbitrate.
//
// Ergebnisse stehen auf dem Bildschirm (Kopieren-Button), im Logcat unter dem
// Präfix HEVC_PROBE und vollständig in hevc_probe_report.md im Ausgabeordner —
// Android kürzt sowohl kopierten Text als auch lange Logcat-Zeilen. Der Bericht
// wird Zeile für Zeile geschrieben, damit er auch einen Absturz mitten im Lauf
// übersteht. Jede Quelle hat einen eigenen Unterordner (testbild/, galerie/),
// damit der zweite Lauf den ersten nicht löscht. Daneben liegt pro Testfall das ungekürzte FFmpeg-Log (<name>.log)
// und die erzeugte Videodatei:
//   adb pull /storage/emulated/0/Android/data/com.androho.simplevideoconverter/files/hevc_probe

import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: _ProbeScreen()));
}

/// Zielbitrate für alle Läufe mit Bitraten-Steuerung. 8 Mbit/s bei 1080p ist
/// der Bereich, in dem Hardware laut Einschätzung kaum noch abfällt — für den
/// Tempo- und Größenvergleich reicht ein fester Wert.
const _bitrate = '8M';

class _ProbeCase {
  const _ProbeCase(
    this.name,
    this.videoArgs,
    this.extension, {
    this.note = '',
    this.remuxArgs,
  });

  final String name;
  final String videoArgs;
  final String extension;
  final String note;

  /// Wenn gesetzt, wird die Ausgabe danach per Stream-Copy nach MP4 umgepackt
  /// (Argumente zwischen Eingabe und Ausgabedatei).
  final String? remuxArgs;
}

// Runde 1 (Pixel 10, Android 17, 2026-09-25): Jede MediaCodec-Ausgabe nach MP4
// oder MKV brach sofort mit „IllegalStateException … Released state“ ab, nur TS
// lief. MP4 und MKV verlangen vom Encoder einen Global Header; offenbar
// übersteht der Pixel-Encoder FFmpegs Extradata-Erzeugung nicht. Dadurch
// waren nv12, cbr, Hochkant, nicht 16-aligned und h264 ungeprüft — sie laufen
// jetzt über TS. 10 Bit entfällt: hevc_mediacodec nimmt laut Encoder-Hilfe nur
// yuv420p/nv12 an, p010le wird auf yuv420p zurückgesetzt.
//
// Runde 2 (Pixel 10, echter 1080p-Clip): `-flags:v -global_header` behebt den
// MP4-Fehler; movenc baut hvcC aus dem ersten Paket. hevc_hw_mp4_app prüft
// darauf aufbauend die Kombination, die in die App käme.
const _hevcHw = '-c:v hevc_mediacodec -b:v $_bitrate -bitrate_mode vbr';
const _remuxHevc = '-c copy -tag:v hvc1 -movflags +faststart';

const _cases = <_ProbeCase>[
  _ProbeCase(
    'hevc_hw_mp4',
    '$_hevcHw -pix_fmt yuv420p',
    'mp4',
    note: 'Kontrolle: scheiterte in Runde 1',
  ),
  _ProbeCase(
    'hevc_hw_mp4_noglobal',
    '$_hevcHw -pix_fmt yuv420p -flags:v -global_header',
    'mp4',
    note: 'Global Header abgeschaltet — movenc baut hvcC dann aus dem 1. Paket',
  ),
  _ProbeCase(
    'hevc_hw_mp4_app',
    '$_hevcHw -pix_fmt yuv420p -flags:v -global_header -tag:v hvc1 -g 150',
    'mp4',
    note: 'Kandidat für die App: hvc1 für Apple, Keyframe alle ~5 s statt 1 s',
  ),
  _ProbeCase(
    'hevc_hw_ts_remux',
    '$_hevcHw -pix_fmt yuv420p',
    'ts',
    note: 'Fallback: TS kodieren, dann per Stream-Copy nach MP4',
    remuxArgs: _remuxHevc,
  ),
  _ProbeCase(
    'hevc_hw_ts_nv12',
    '$_hevcHw -pix_fmt nv12',
    'ts',
    note: 'natives MediaCodec-Format',
  ),
  _ProbeCase(
    'hevc_hw_ts_cbr',
    '-c:v hevc_mediacodec -b:v $_bitrate -bitrate_mode cbr -pix_fmt yuv420p',
    'ts',
  ),
  _ProbeCase(
    'hevc_hw_ts_cq_nv12',
    '-c:v hevc_mediacodec -bitrate_mode cq -pix_fmt nv12',
    'ts',
    note: 'CQ mit yuv420p scheiterte schon bei configure — Hinweis von FFmpeg',
  ),
  _ProbeCase(
    'hevc_hw_ts_portrait',
    '-vf scale=1080:1920 $_hevcHw -pix_fmt yuv420p',
    'ts',
    note: 'Hochkant wie Handyvideos; manche Encoder begrenzen die Breite',
  ),
  _ProbeCase(
    'hevc_hw_ts_unaligned',
    '-vf scale=1916:1076 $_hevcHw -pix_fmt yuv420p',
    'ts',
    note: 'gerade, aber nicht durch 16 teilbar',
  ),
  _ProbeCase(
    'h264_hw_ts_remux',
    '-c:v h264_mediacodec -b:v $_bitrate -bitrate_mode vbr -pix_fmt yuv420p',
    'ts',
    remuxArgs: '-c copy -movflags +faststart',
  ),
  _ProbeCase(
    'x265_ref',
    '-c:v libx265 -b:v $_bitrate -pix_fmt yuv420p',
    'mp4',
    note: 'Referenz; der Build ist 10-Bit-only, Ausgabe wird Main 10',
  ),
  _ProbeCase(
    'x264_ref',
    '-c:v libx264 -b:v $_bitrate -pix_fmt yuv420p',
    'mp4',
    note: 'Referenz, Preset wie in der App (Standard)',
  ),
];

// Qualitätsreihe: Bei 8 Mbit/s lagen alle Encoder per VMAF gegen das Original
// innerhalb von zwei Punkten (x265 93,4 / HW-HEVC 92,4 bzw. 91,6 / x264 92,1).
// Unterschiede zeigen sich erst bei knapper Bitrate. Die Ausgaben werden am PC
// per libvmaf gegen die Quelle gemessen; ohne Audio, damit der Lauf kürzer ist.
// Hardware mit denselben Argumenten wie hevc_hw_mp4_app.
List<_ProbeCase> _qualityCases() => [
  for (final rate in ['2M', '4M']) ...[
    _ProbeCase(
      'q_hevc_hw_$rate',
      '-c:v hevc_mediacodec -b:v $rate -bitrate_mode vbr -pix_fmt yuv420p '
          '-flags:v -global_header -tag:v hvc1 -g 150',
      'mp4',
    ),
    _ProbeCase(
      'q_h264_hw_$rate',
      '-c:v h264_mediacodec -b:v $rate -bitrate_mode vbr -pix_fmt yuv420p '
          '-flags:v -global_header -g 150',
      'mp4',
    ),
    _ProbeCase('q_x265_$rate', '-c:v libx265 -b:v $rate', 'mp4'),
    _ProbeCase(
      'q_x264_$rate',
      '-c:v libx264 -b:v $rate -pix_fmt yuv420p',
      'mp4',
    ),
  ],
];

class _ProbeScreen extends StatefulWidget {
  const _ProbeScreen();

  @override
  State<_ProbeScreen> createState() => _ProbeScreenState();
}

class _ProbeScreenState extends State<_ProbeScreen> {
  final _lines = <String>[];
  bool _running = false;
  File? _reportFile;

  void _log(String line) {
    debugPrint('HEVC_PROBE $line');
    _reportFile?.writeAsStringSync('$line\n', mode: FileMode.append);
    setState(() => _lines.add(line));
  }

  Future<void> _runSynthetic() => _run(
    // testsrc2 ist leicht zu kodieren — gut für die Funktionsfragen, für den
    // Tempovergleich ist ein echtes Video aussagekräftiger.
    inputArgs: '-f lavfi -i testsrc2=size=1920x1080:rate=30 -t 10',
    audioArgs: '-an',
    label: 'testsrc2 1920x1080 30 fps, 10 s',
    folder: 'testbild',
  );

  Future<void> _runGallery() async {
    final picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picked == null) return;
    await _run(
      inputArgs: '-t 20 -i "${picked.path}"',
      audioArgs: '-c:a aac -b:a 128k',
      label: 'Galerie-Video (erste 20 s): ${picked.name}',
      folder: 'galerie',
    );
  }

  Future<void> _runQuality() async {
    final picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picked == null) return;
    await _run(
      inputArgs: '-t 20 -i "${picked.path}"',
      audioArgs: '-an',
      label: 'Qualitätsreihe 2/4 Mbit/s (erste 20 s): ${picked.name}',
      folder: 'qualitaet',
      cases: _qualityCases(),
    );
  }

  Future<void> _run({
    required String inputArgs,
    required String audioArgs,
    required String label,
    required String folder,
    List<_ProbeCase> cases = _cases,
  }) async {
    setState(() {
      _running = true;
      _lines.clear();
    });
    try {
      final outDir = await _prepareOutputDir(folder);
      _reportFile = File('${outDir.path}/hevc_probe_report.md')
        ..writeAsStringSync(
          '# HEVC-Hardware-Test ${DateTime.now().toIso8601String()}\n\n',
        );
      _log('Quelle: $label');
      _log('Ausgabe: ${outDir.path}');
      _log('Bericht: ${_reportFile!.path}');
      if (identical(cases, _cases)) await _probeEncoders();
      for (final c in cases) {
        await _runCase(c, inputArgs, audioArgs, outDir);
      }
      _log('--- fertig ---');
    } catch (e, st) {
      _log('ABBRUCH: $e\n$st');
    } finally {
      _reportFile = null;
      if (mounted) setState(() => _running = false);
    }
  }

  Future<Directory> _prepareOutputDir(String folder) async {
    // Externes App-Verzeichnis, damit die Dateien per adb pull erreichbar sind.
    final base =
        await getExternalStorageDirectory() ?? await getTemporaryDirectory();
    final dir = Directory('${base.path}/hevc_probe/$folder');
    if (dir.existsSync()) dir.deleteSync(recursive: true);
    dir.createSync(recursive: true);
    return dir;
  }

  Future<void> _probeEncoders() async {
    final list = await FFmpegKit.execute('-hide_banner -encoders');
    final output = await list.getOutput() ?? '';
    final hw = output
        .split('\n')
        .where((l) => l.contains('mediacodec'))
        .map((l) => l.trim())
        .toList();
    _log('== Registrierte MediaCodec-Encoder ==');
    _log(hw.isEmpty ? '(keine)' : hw.join('\n'));

    for (final encoder in ['hevc_mediacodec', 'h264_mediacodec']) {
      final help = await FFmpegKit.execute('-hide_banner -h encoder=$encoder');
      _log('== Optionen $encoder ==');
      _log((await help.getOutput() ?? '').trim());
    }
  }

  Future<void> _runCase(
    _ProbeCase c,
    String inputArgs,
    String audioArgs,
    Directory outDir,
  ) async {
    final out = '${outDir.path}/${c.name}.${c.extension}';
    final command =
        '-hide_banner -y $inputArgs ${c.videoArgs} $audioArgs "$out"';
    _log('== ${c.name}${c.note.isEmpty ? '' : ' — ${c.note}'} ==');
    _log('ffmpeg $command');

    final watch = Stopwatch()..start();
    final session = await FFmpegKit.execute(command);
    watch.stop();
    final rc = await session.getReturnCode();
    final logs = await session.getAllLogsAsString() ?? '';
    File('${outDir.path}/${c.name}.log').writeAsStringSync(logs);
    final ok = ReturnCode.isSuccess(rc);
    _log(
      '${ok ? 'OK' : 'FEHLER'} rc=${rc?.getValue()} '
      'Laufzeit=${(watch.elapsedMilliseconds / 1000).toStringAsFixed(1)} s',
    );

    // Welcher Hardware-Codec tatsächlich gegriffen hat (c2.* / OMX.*) und
    // warum ein Lauf scheitert, steht nur im FFmpeg-Log.
    final logLines = logs.split('\n');
    final relevant = logLines
        .where(
          (l) => RegExp(
            r'mediacodec|c2\.|omx\.|global_header|error|failed|incompatible|'
            r'not supported|auto-selecting',
            caseSensitive: false,
          ).hasMatch(l),
        )
        .map((l) => l.trim())
        .where((l) => l.isNotEmpty)
        .take(20)
        .toList();
    if (relevant.isNotEmpty) _log(relevant.join('\n'));
    if (!ok) {
      final tail = logLines
          .map((l) => l.trim())
          .where((l) => l.isNotEmpty)
          .toList();
      _log(
        'Log-Ende:\n${tail.skip(tail.length > 12 ? tail.length - 12 : 0).join('\n')}',
      );
      return;
    }
    await _describeOutput(out);
    if (c.remuxArgs != null) await _remux(c, out, outDir);
  }

  Future<void> _remux(_ProbeCase c, String input, Directory outDir) async {
    final out = '${outDir.path}/${c.name}.mp4';
    final command = '-hide_banner -y -i "$input" ${c.remuxArgs} "$out"';
    _log('-- Umpacken nach MP4 --');
    _log('ffmpeg $command');
    final watch = Stopwatch()..start();
    final session = await FFmpegKit.execute(command);
    watch.stop();
    final rc = await session.getReturnCode();
    File(
      '${outDir.path}/${c.name}_remux.log',
    ).writeAsStringSync(await session.getAllLogsAsString() ?? '');
    _log(
      '${ReturnCode.isSuccess(rc) ? 'OK' : 'FEHLER'} rc=${rc?.getValue()} '
      'Laufzeit=${(watch.elapsedMilliseconds / 1000).toStringAsFixed(1)} s',
    );
    if (ReturnCode.isSuccess(rc)) await _describeOutput(out);
  }

  Future<void> _describeOutput(String path) async {
    final file = File(path);
    final sizeMb = file.existsSync() ? file.lengthSync() / (1024 * 1024) : 0;
    final info = (await FFprobeKit.getMediaInformation(
      path,
    )).getMediaInformation();
    final video = info?.getStreams().where((s) => s.getType() == 'video');
    final v = (video == null || video.isEmpty) ? null : video.first;
    _log(
      'Ausgabe: ${sizeMb.toStringAsFixed(2)} MB, '
      'Dauer=${info?.getDuration() ?? '?'} s, '
      'Bitrate=${info?.getBitrate() ?? '?'}, '
      'codec=${v?.getCodec() ?? '?'} '
      'profile=${v?.getStringProperty('profile') ?? '?'} '
      'pix_fmt=${v?.getFormat() ?? '?'} '
      '${v?.getWidth() ?? '?'}x${v?.getHeight() ?? '?'}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HEVC-Hardware-Test'),
        actions: [
          IconButton(
            tooltip: 'Kopieren',
            icon: const Icon(Icons.copy),
            onPressed: _lines.isEmpty
                ? null
                : () =>
                      Clipboard.setData(ClipboardData(text: _lines.join('\n'))),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                FilledButton(
                  onPressed: _running ? null : _runSynthetic,
                  child: const Text('Testbild'),
                ),
                FilledButton.tonal(
                  onPressed: _running ? null : _runGallery,
                  child: const Text('Video aus Galerie'),
                ),
                FilledButton.tonal(
                  onPressed: _running ? null : _runQuality,
                  child: const Text('Qualitätsreihe'),
                ),
                if (_running) const CircularProgressIndicator(),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SelectionArea(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: _lines.length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    _lines[i],
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
