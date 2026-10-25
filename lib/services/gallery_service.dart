// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gal/gal.dart';

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

  /// Speichert ein Video nach `Movies/Video Converter` (ab Android 10, siehe
  /// VideoGallerySaver.kt). Gal kann das nicht: Mit Album legt es Videos
  /// unter `Pictures/` ab. Unter Android 10 und auf iOS bleibt es deshalb bei
  /// Gal, weil das Speichern dort eine Berechtigung braucht, die Gal abfragt.
  /// Wirft bei einem Fehler.
  static Future<void> saveVideo(String path) async {
    if (Platform.isAndroid) {
      final saved = await _channel.invokeMethod<bool>('saveVideo', {
        'path': path,
      });
      if (saved ?? false) return;
    }
    // Muss zu GALLERY_ALBUM in MainActivity.kt passen.
    await Gal.putVideo(path, album: 'Video Converter');
  }

  /// Öffnet die Dateiauswahl des Systems (SAF). Videos auf dem Gerät kommen
  /// als `content://`-URI zurück und werden direkt gelesen, andere (Cloud)
  /// werden in den Cache kopiert. Null bei Abbruch, wirft bei einem
  /// Lesefehler.
  ///
  /// Android statt image_picker, weil dessen Photo Picker nur eine Nummer als
  /// Namen liefert und keinen Verweis, der sich in den Papierkorb legen lässt
  /// (siehe OriginalVideoPicker.kt).
  ///
  /// [onCopyProgress] erhält den Kopierfortschritt 0.0–1.0. Der erste Aufruf
  /// heißt auch: Die Auswahl ist zu, das Kopieren läuft. Ohne bekannte
  /// Dateigröße oder beim Direktlesen kommt keiner.
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
      source: result['source']! as String,
      displayName: result['displayName'] as String?,
      trashUri: result['trashUri'] as String?,
    );
  }

  /// Gibt die dauerhaften Leseberechtigungen direkt gelesener Videos frei,
  /// außer der für [keep] (die Quelle des geladenen Videos). Fehler sind
  /// unkritisch: Übrige Berechtigungen räumt der nächste Aufruf ab.
  static Future<void> releaseVideoAccess({String? keep}) async {
    try {
      await _channel.invokeMethod<void>('releaseVideoAccess', {'keep': keep});
    } catch (_) {}
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
  /// `content://`-URI des Originals oder Pfad der Kopie im Cache (benannt wie
  /// das Original). Für FFmpeg über `VideoSource.ffmpegPath` auflösen.
  final String source;

  /// Dateiname des Originals, null wenn der Anbieter keinen nennt.
  final String? displayName;

  /// MediaStore-Verweis auf das Original für „Original löschen“. Null unter
  /// Android 11 oder wenn die Datei nicht aus dem MediaStore stammt.
  final String? trashUri;

  const PickedVideo({required this.source, this.displayName, this.trashUri});
}
