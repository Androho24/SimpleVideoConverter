# FFmpegKit: Native-Methoden werden von .so-Dateien via JNI aufgerufen.
# R8 sieht diese Aufrufe nicht und würde die Methoden/Klassen sonst entfernen.
-keep class com.antonkarpenko.ffmpegkit.** { *; }
# arthenica.smartexception ist eine FFmpegKit-Abhängigkeit (Reflection auf Stacktraces).
-keep class com.arthenica.smartexception.** { *; }
-dontwarn com.arthenica.smartexception.**

# Alle Flutter-Plugin-Implementierungen schützen — deckt die Plugin-Hauptklasse,
# aber nicht zwangsläufig deren Helfer/Inner Classes. Daher unten zusätzlich
# explizite Pakete für jedes verwendete Plugin.
-keep class ** implements io.flutter.embedding.engine.plugins.FlutterPlugin { *; }

# Flutter / Google Mobile Ads / UMP / Billing / Play-Services
-keep class io.flutter.** { *; }
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.android.ump.** { *; }
-keep class com.android.billingclient.** { *; }

# Verwendete Flutter-Plugins explizit (Reflection-sicher)
-keep class com.crazecoder.openfile.** { *; }                    # open_filex
-keep class studio.midoridesign.gal.** { *; }                    # gal
-keep class com.baseflow.permissionhandler.** { *; }             # permission_handler
-keep class com.mr.flutter.plugin.filepicker.** { *; }           # file_picker
-keep class com.piccmaq.disk_space_plus.** { *; }                # disk_space_plus
-keep class dev.fluttercommunity.plus.** { *; }                  # share_plus, package_info_plus
-keep class dev.britannio.in_app_review.** { *; }                # in_app_review
-keep class io.flutter.plugins.** { *; }                         # firebase_*, image_picker, video_player, url_launcher, path_provider, shared_preferences, in_app_purchase, googlemobileads, webview

# Reflection-Attribute für Plugins, die @Keep / generische Typen / Annotations nutzen.
-keepattributes Signature,InnerClasses,EnclosingMethod,*Annotation*,SourceFile,LineNumberTable

# Flutter referenziert Play Core Split Install intern (Deferred Components),
# wir nutzen dieses Feature nicht → Warnungen unterdrücken statt Build-Fehler.
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**
