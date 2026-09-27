# Lokale Patches auf `video_player_android`

Kopie von **video_player_android 2.12.0** (pub.dev), eingebunden über
`dependency_overrides` in der Wurzel-`pubspec.yaml`. Das Verzeichnis `example/`
des Upstream-Pakets ist nicht mitkopiert, sonst ist der Stand unverändert.

## Warum

Die Vorschau läuft auf Android mit `VideoViewType.platformView`
(`lib/screens/converter_screen.dart`), weil der Texture-Pfad 1080p60-Aufnahmen
nicht flüssig durch Flutters Raster-Pipeline bekommt. Der platformView-Pfad des
Plugins hat aber einen Absturz, der im Play-Console-Reporting ab Version 2.1.0
auftaucht:

```
java.lang.NullPointerException
  at java.util.Objects.requireNonNull (Objects.java:222)
  at io.flutter.plugins.videoplayer.platformview.PlatformViewExoPlayerEventListener.sendInitialized (…:29)
  at io.flutter.plugins.videoplayer.ExoPlayerEventListener.maybeSendInitialized (…:98)
  at io.flutter.plugins.videoplayer.ExoPlayerEventListener.onPlaybackStateChanged (…:110)
```

`sendInitialized()` liest `exoPlayer.getVideoFormat()` und schiebt es durch
`Objects.requireNonNull`. Erreicht der Player `STATE_READY`, ohne dass ein
Video-Format vorliegt, fliegt die NPE im Main-Looper — ein harter Prozess-Crash,
den ein `try`/`catch` um `controller.initialize()` auf der Dart-Seite nicht
abfangen kann. Zwei Wege führen dorthin:

1. `STATE_READY` ohne nutzbaren Video-Track (kein Decoder für den Codec — der
   Audio-Renderer läuft, der Video-Renderer liefert nie ein Format), oder das
   Format ist schlicht noch nicht gesetzt.
2. Der Timeout-Fallback in `ExoPlayerEventListener` (2 s bei unbekannter Dauer)
   ruft `sendInitialized()` bedingungslos auf.

Der Texture-Pfad ist nicht betroffen: `TextureExoPlayerEventListener` prüft
`width != 0 && height != 0`, bevor es an das `Format` geht.

## Der Patch

Betrifft ausschließlich
`android/src/main/java/io/flutter/plugins/videoplayer/platformview/PlatformViewExoPlayerEventListener.java`.

* Ist beim Aufruf von `sendInitialized()` kein Video-Format da, wird das
  `initialized`-Event **zurückgehalten** und alle 50 ms erneut geprüft, maximal
  2 Sekunden lang. Sobald das Format auftaucht, geht das Event mit den echten
  Maßen raus — langsam startende Videos laufen also normal, nur mit etwas
  Verzögerung.
* Läuft das Zeitfenster ab, geht `onInitialized(0, 0, duration, 0)` raus.
  Kein Absturz und kein ewiger Spinner; die Dart-Seite bekommt `size == Size.zero`.
* `dispose()` bricht eine laufende Warteschleife ab (wird von `VideoPlayer.dispose()`
  vor `exoPlayer.release()` aufgerufen).
* `RotationDegrees.fromDegrees(...)` läuft jetzt in einem `try`/`catch` auf
  `IllegalArgumentException` — bei einer Rotation außerhalb 0/90/180/270 hätte
  auch das den Prozess abgeräumt. Der Texture-Pfad macht es genauso.

Warum nicht einfach sofort `0, 0` senden und die Größe später korrigieren:
`onInitialized` ist der einzige Kanal für Breite/Höhe, und ein zweites
`initialized`-Event wirft auf der Dart-Seite einen `StateError`
(`video_player.dart`, `initializingCompleter.isCompleted`). Die Größe muss beim
ersten Event stimmen.

## Bei einem Plugin-Update

Prüfen, ob der Fix upstream angekommen ist (flutter/packages,
`packages/video_player/video_player_android`) — dann diesen Ordner samt
`dependency_overrides`-Block löschen. Sonst: neue Version frisch entpacken,
`example/` löschen, obigen Patch neu anwenden.
