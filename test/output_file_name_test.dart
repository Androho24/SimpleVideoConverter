// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/output_file_name.dart';

void main() {
  const cache = '/data/user/0/app/cache/3f2a';

  test('keeps the original name without its extension', () {
    expect(
      OutputFileName.baseName('$cache/PXL_20260806_071353486.mp4'),
      'PXL_20260806_071353486',
    );
    expect(
      OutputFileName.baseName('$cache/Urlaub am Meer.mov'),
      'Urlaub am Meer',
    );
    expect(OutputFileName.baseName('$cache/archiv.2024.mkv'), 'archiv.2024');
    expect(OutputFileName.baseName('$cache/ohne_endung'), 'ohne_endung');
  });

  test('keeps spaces, apostrophes, brackets and umlauts', () {
    expect(
      OutputFileName.baseName("$cache/Oma's Geburtstag (2) äöü ß.mp4"),
      "Oma's Geburtstag (2) äöü ß",
    );
  });

  test('replaces characters that break the command or the file system', () {
    expect(
      OutputFileName.baseName('$cache/a"b\\c:d*e?f<g>h|i.mp4'),
      'a_b_c_d_e_f_g_h_i',
    );
    expect(OutputFileName.baseName('$cache/tab\there.mp4'), 'tab_here');
  });

  test('never produces a hidden or empty name', () {
    expect(OutputFileName.baseName('$cache/..versteckt.mp4'), 'versteckt');
    expect(OutputFileName.baseName('$cache/.mp4'), 'video');
    expect(OutputFileName.baseName('$cache/   .mp4'), 'video');
  });

  test('caps very long names by characters, not bytes', () {
    final long = 'ä' * 150;
    final result = OutputFileName.baseName('$cache/$long.mp4');
    expect(result.runes.length, OutputFileName.maxLength);
  });

  test('survives FFmpegKit parsing as a single output argument', () {
    for (final name in [
      "Oma's Geburtstag (2) äöü",
      'a"b\\c',
      'Film  mit  Doppel leerzeichen',
      '100% fertig #1',
    ]) {
      final output =
          '/cache/conversions/${OutputFileName.baseName('$cache/$name.mov')}.mp4';
      final arguments = FFmpegKitConfig.parseArguments(
        '-i "/in.mov" -c:v libx264 -y "$output"',
      );
      expect(arguments.last, output, reason: name);
      expect(arguments[arguments.length - 2], '-y', reason: name);
    }
  });
}
