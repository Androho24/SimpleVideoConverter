// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:flutter/services.dart';

/// Fragt beim Android-Teil ab, ob das Gerät HEVC in Hardware kodieren kann.
///
/// Das Ergebnis ändert sich zur Laufzeit nicht und wird deshalb einmal pro
/// Prozess ermittelt. Jeder Fehler (anderes OS, fehlender Channel, Exception
/// auf der Plattformseite) ergibt `false` — der Schalter bleibt dann verborgen.
class HardwareEncoderService {
  static const _channel = MethodChannel(
    'com.androho.simplevideoconverter/conversion_service',
  );

  static Future<bool>? _hevc;

  static Future<bool> hasHardwareHevcEncoder() => _hevc ??= _queryHevc();

  static Future<bool> _queryHevc() async {
    if (!Platform.isAndroid) return false;
    try {
      return await _channel.invokeMethod<bool>('hasHardwareHevcEncoder') ??
          false;
    } catch (_) {
      return false;
    }
  }
}
