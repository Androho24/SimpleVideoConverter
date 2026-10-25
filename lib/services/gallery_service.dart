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
  static const _channel = MethodChannel(
    'com.androho.simplevideoconverter/gallery',
  );

  /// Öffnet das gespeicherte Video mit dem angegebenen Dateinamen
  /// (DISPLAY_NAME aus MediaStore).
  ///
  /// Liefert `true`, wenn die Galerie/ein Player gestartet wurde,
  /// sonst `false` (z. B. Eintrag nicht in MediaStore, kein Handler).
  /// Aufrufer kann bei `false` auf `Gal.open()` als Fallback ausweichen.
  static Future<bool> viewSavedVideo(String displayName) async {
    try {
      final ok = await _channel.invokeMethod<bool>('viewSavedVideo', {
        'displayName': displayName,
      });
      return ok ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Öffnet die Dateiauswahl des Systems (SAF) und kopiert das Video in den
  /// Cache. Null bei Abbruch, wirft bei einem Lesefehler.
  ///
  /// Android statt image_picker, weil dessen Photo Picker nur eine Nummer als
  /// Namen liefert und keinen Verweis, der sich in den Papierkorb legen lässt
  /// (siehe OriginalVideoPicker.kt).
  ///
  /// [onCopyProgress] erhält den Kopierfortschritt 0.0–1.0. Der erste Aufruf
  /// heißt auch: Die Auswahl ist zu, das Kopieren läuft. Ohne bekannte
  /// Dateigröße kommt keiner.
  static Future<PickedVideo?> pickVideo({
    void Function(double fraction)? onCopyProgress,
  }) async {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'pickProgress') {
        onCopyProgress?.call((call.arguments as num).toDouble());
      }
    });
    final Map<String, Object?>? result;
    try {
      result = await _channel.invokeMapMethod<String, Object?>('pickVideo');
    } finally {
      _channel.setMethodCallHandler(null);
    }
    if (result == null) return null;
    return PickedVideo(
      path: result['path']! as String,
      trashUri: result['trashUri'] as String?,
    );
  }

  /// Legt das Original über den Papierkorb-Dialog von Android ab (ab
  /// Android 11, 30 Tage wiederherstellbar). True, wenn der Nutzer bestätigt
  /// hat; wirft, wenn Android den Verweis ablehnt.
  static Future<bool> trashOriginal(String trashUri) async {
    final ok = await _channel.invokeMethod<bool>('trashOriginal', {
      'uri': trashUri,
    });
    return ok ?? false;
  }
}

class PickedVideo {
  /// Kopie im Cache, benannt wie das Original.
  final String path;

  /// MediaStore-Verweis auf das Original für „Original löschen“. Null unter
  /// Android 11 oder wenn die Datei nicht aus dem MediaStore stammt.
  final String? trashUri;

  const PickedVideo({required this.path, this.trashUri});
}
