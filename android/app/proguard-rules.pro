# FFmpegKit: Native-Methoden werden von .so-Dateien via JNI aufgerufen.
# R8 sieht diese Aufrufe nicht und würde die Methoden/Klassen sonst entfernen.
-keep class com.antonkarpenko.ffmpegkit.** { *; }

# Alle Flutter-Plugin-Implementierungen schützen — deckt open_filex, ffmpeg_kit
# und alle zukünftigen Plugins ab, ohne einzelne Keep-Regeln pflegen zu müssen.
-keep class ** implements io.flutter.embedding.engine.plugins.FlutterPlugin { *; }

# Flutter / Google Mobile Ads
-keep class com.google.android.gms.ads.** { *; }
-keep class io.flutter.** { *; }

# Flutter referenziert Play Core Split Install intern (Deferred Components),
# wir nutzen dieses Feature nicht → Warnungen unterdrücken statt Build-Fehler.
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**
