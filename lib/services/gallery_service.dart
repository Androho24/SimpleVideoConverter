// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/services.dart';

/// Bridge zur nativen Galerie-Integration auf Android.
///
/// `viewSavedVideo` queryt MediaStore nach dem zuletzt gespeicherten Video
/// und öffnet es per ACTION_VIEW. Im Vergleich zu `Gal.open()` (das nur die
/// Standard-Galerie-App startet, oft auf dem "Photos"-Tab) zeigt das die
/// Datei direkt mit Album-Context — unabhängig vom OEM-Galerie-UI.
class GalleryService {
  static const _channel = MethodChannel('com.androho.simplevideoconverter/gallery');

  /// Öffnet das gespeicherte Video mit dem angegebenen Dateinamen
  /// (DISPLAY_NAME aus MediaStore).
  ///
  /// Liefert `true`, wenn die Galerie/ein Player gestartet wurde,
  /// sonst `false` (z. B. Eintrag nicht in MediaStore, kein Handler).
  /// Aufrufer kann bei `false` auf `Gal.open()` als Fallback ausweichen.
  static Future<bool> viewSavedVideo(String displayName) async {
    try {
      final ok = await _channel
          .invokeMethod<bool>('viewSavedVideo', {'displayName': displayName});
      return ok ?? false;
    } catch (_) {
      return false;
    }
  }
}
