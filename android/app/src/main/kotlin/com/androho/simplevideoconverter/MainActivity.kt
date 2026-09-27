package com.androho.simplevideoconverter

import android.Manifest
import android.content.ActivityNotFoundException
import android.content.ContentUris
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.graphics.Color
import android.media.MediaCodecList
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import android.view.View
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.view.WindowInsetsControllerCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val ADS_CHANNEL = "com.androho.simplevideoconverter/ads"
    private val SERVICE_CHANNEL = "com.androho.simplevideoconverter/conversion_service"
    private val GALLERY_CHANNEL = "com.androho.simplevideoconverter/gallery"
    private val SYSTEM_BARS_CHANNEL = "com.androho.simplevideoconverter/system_bars"
    // Muss zu `Gal.putVideo(…, album: 'Video Converter')` in conversion_screen.dart passen.
    private val GALLERY_ALBUM = "Video Converter"
    private var adsChannel: MethodChannel? = null
    private val originalVideoPicker = OriginalVideoPicker(this)
    private var pendingConsentResult: Boolean? = null
    private var systemBarsColor: Int? = null
    private var systemBarsDark: Boolean? = null

    override fun provideFlutterEngine(context: Context): FlutterEngine? =
        (application as SimpleVideoConverterApplication).getMainFlutterEngine()

    // Engine-Lifecycle liegt vollständig bei SimpleVideoConverterApplication.
    // Die Activity zerstört die Engine nie selbst — erst detachen (super), dann ggf. destroyen.
    override fun shouldDestroyEngineWithHost(): Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        applySystemBarStyle()

        // UMP-Consent-Flow anstoßen. Nach Abschluss initialisiert Flutter das
        // AdMob Next-Gen SDK samt Bidding-Adaptern.
        val adManager = (application as? SimpleVideoConverterApplication)
            ?.getAppOpenAdManager()
        if (adManager == null) {
            Log.w("MainActivity", "Consent-Manager nicht verfügbar; Ads bleiben deaktiviert")
            notifyDartAboutConsent(false)
        } else {
            adManager.requestConsent(this) { canRequestAds ->
                Log.d("MainActivity", "Consent abgeschlossen: canRequestAds=$canRequestAds")
                notifyDartAboutConsent(canRequestAds)
            }
        }
    }

    @Deprecated("Deprecated in Java")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (originalVideoPicker.onActivityResult(requestCode, resultCode, data)) return
        super.onActivityResult(requestCode, resultCode, data)
    }

    override fun onResume() {
        super.onResume()
        applySystemBarStyle()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        adsChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ADS_CHANNEL).also {
            channel ->
            channel.setMethodCallHandler { call, result ->
                val adManager = (application as? SimpleVideoConverterApplication)
                    ?.getAppOpenAdManager()
                when (call.method) {
                    "isPrivacyOptionsRequired" -> result.success(
                        adManager?.isPrivacyOptionsRequired(this) ?: false
                    )
                    "showPrivacyOptionsForm" -> {
                        if (adManager == null) {
                            result.success(null)
                        } else {
                            adManager.showPrivacyOptionsForm(this) { canRequestAds ->
                                notifyDartAboutConsent(canRequestAds)
                                result.success(null)
                            }
                        }
                    }
                    else -> result.notImplemented()
                }
            }
        }
        pendingConsentResult?.let { canRequestAds ->
            pendingConsentResult = null
            notifyDartAboutConsent(canRequestAds)
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SERVICE_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "requestNotificationPermission" -> {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU &&
                            ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS)
                                != PackageManager.PERMISSION_GRANTED
                        ) {
                            ActivityCompat.requestPermissions(
                                this,
                                arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                                0
                            )
                        }
                        result.success(null)
                    }
                    "startService" -> {
                        val fileName = call.argument<String>("fileName") ?: ""
                        val intent = Intent(this, ConversionService::class.java).apply {
                            action = ConversionService.ACTION_START
                            putExtra(ConversionService.EXTRA_FILE_NAME, fileName)
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                            startForegroundService(intent)
                        } else {
                            startService(intent)
                        }
                        result.success(null)
                    }
                    "updateProgress" -> {
                        val percent = call.argument<Int>("percent") ?: 0
                        val speedText = call.argument<String>("speedText") ?: ""
                        startService(Intent(this, ConversionService::class.java).apply {
                            action = ConversionService.ACTION_UPDATE_PROGRESS
                            putExtra(ConversionService.EXTRA_PERCENT, percent)
                            putExtra(ConversionService.EXTRA_SPEED_TEXT, speedText)
                        })
                        result.success(null)
                    }
                    "stopService" -> {
                        startService(Intent(this, ConversionService::class.java).apply {
                            action = ConversionService.ACTION_STOP
                        })
                        result.success(null)
                    }
                    "showCompletion" -> {
                        val fileName = call.argument<String>("fileName") ?: ""
                        startService(Intent(this, ConversionService::class.java).apply {
                            action = ConversionService.ACTION_COMPLETE
                            putExtra(ConversionService.EXTRA_FILE_NAME, fileName)
                        })
                        result.success(null)
                    }
                    "hasHardwareHevcEncoder" -> result.success(hasHardwareHevcEncoder())
                    else -> result.notImplemented()
                }
            }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, GALLERY_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "viewSavedVideo" -> {
                        val displayName = call.argument<String>("displayName") ?: ""
                        result.success(viewSavedVideo(displayName))
                    }
                    "pickVideo" -> originalVideoPicker.pickVideo(result)
                    "trashOriginal" ->
                        originalVideoPicker.trashOriginal(call.argument<String>("uri"), result)
                    else -> result.notImplemented()
                }
            }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SYSTEM_BARS_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "setSystemBars" -> {
                        val color = call.argument<Number>("color")?.toInt()
                        val isDark = call.argument<Boolean>("isDark")
                        if (color == null || isDark == null) {
                            result.error("invalid_args", "color und isDark erforderlich", null)
                        } else {
                            systemBarsColor = color
                            systemBarsDark = isDark
                            applySystemBarStyle()
                            result.success(null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    /**
     * Öffnet das zuletzt gespeicherte Video aus MediaStore via ACTION_VIEW.
     * Die Galerie zeigt das Video direkt mit Album-Context an — unabhängig
     * davon, welche Galerie-App der Hersteller voreingestellt hat.
     *
     * @return true wenn ein Handler gefunden und gestartet wurde, sonst false.
     *         Der Aufrufer kann bei false auf Gal.open() zurückfallen.
     */
    private fun viewSavedVideo(displayName: String): Boolean {
        if (displayName.isBlank()) return false
        try {
            val collection = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                MediaStore.Video.Media.getContentUri(MediaStore.VOLUME_EXTERNAL)
            } else {
                MediaStore.Video.Media.EXTERNAL_CONTENT_URI
            }
            val projection = arrayOf(MediaStore.Video.Media._ID)
            // Videos tragen den Namen des Originals. Liegt der Name im Album
            // schon, benennt MediaStore die neue Datei um („Urlaub (1).mp4“,
            // vor API 29 macht Gal „Urlaub1.mp4“) — ein exakter Vergleich fände
            // dann die ältere. Deshalb: gleicher Namensanfang und gleiche
            // Endung, im Album von Gal, und davon die zuletzt eingefügte.
            // DATE_ADDED hat nur Sekunden, _ID steigt streng.
            val sortOrder = "${MediaStore.Video.Media.DATE_ADDED} DESC, " +
                "${MediaStore.Video.Media._ID} DESC"
            val dot = displayName.lastIndexOf('.')
            val stem = if (dot > 0) displayName.substring(0, dot) else displayName
            val extension = if (dot > 0) displayName.substring(dot) else ""
            val namePattern = likeEscape(stem) + "%" + likeEscape(extension)
            val albumColumn = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                MediaStore.Video.Media.RELATIVE_PATH
            } else {
                @Suppress("DEPRECATION")
                MediaStore.Video.Media.DATA
            }
            val selection = "${MediaStore.Video.Media.DISPLAY_NAME} LIKE ? ESCAPE '\\' " +
                "AND $albumColumn LIKE ?"
            val selectionArgs = arrayOf(namePattern, "%/$GALLERY_ALBUM/%")

            val uri: Uri? = contentResolver.query(
                collection, projection, selection, selectionArgs, sortOrder
            )?.use { cursor ->
                if (cursor.moveToFirst()) {
                    val id = cursor.getLong(
                        cursor.getColumnIndexOrThrow(MediaStore.Video.Media._ID)
                    )
                    ContentUris.withAppendedId(collection, id)
                } else null
            }

            if (uri == null) {
                Log.w("MainActivity", "viewSavedVideo: kein MediaStore-Eintrag für '$displayName'")
                return false
            }

            val intent = Intent(Intent.ACTION_VIEW).apply {
                setDataAndType(uri, "video/*")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
            startActivity(intent)
            return true
        } catch (e: ActivityNotFoundException) {
            Log.w("MainActivity", "viewSavedVideo: kein Handler für ACTION_VIEW", e)
            return false
        } catch (e: Exception) {
            Log.e("MainActivity", "viewSavedVideo: unerwarteter Fehler", e)
            return false
        }
    }

    /**
     * Gibt es auf dem Gerät einen Hardware-Encoder für HEVC? Grundlage für den
     * Schalter „Hardware-Encoder“ im Expertenmodus (FFmpeg `hevc_mediacodec`).
     *
     * Ab API 29 meldet der Codec das selbst. Darunter hilft nur der Name: Die
     * Software-Codecs von Android heißen `OMX.google.*` bzw. `c2.android.*`.
     * Jeder Fehler ergibt false — dann erscheint der Schalter nicht.
     */
    private fun hasHardwareHevcEncoder(): Boolean = try {
        MediaCodecList(MediaCodecList.REGULAR_CODECS).codecInfos.any { info ->
            val isHevcEncoder = info.isEncoder &&
                info.supportedTypes.any { it.equals("video/hevc", ignoreCase = true) }
            val isHardware = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                info.isHardwareAccelerated
            } else {
                val name = info.name.lowercase()
                !name.startsWith("omx.google.") && !name.startsWith("c2.android.")
            }
            isHevcEncoder && isHardware
        }
    } catch (e: Exception) {
        Log.w("MainActivity", "hasHardwareHevcEncoder: MediaCodecList nicht lesbar", e)
        false
    }

    /** Maskiert `%`, `_` und `\` für LIKE … ESCAPE '\'. */
    private fun likeEscape(value: String): String =
        value.replace("\\", "\\\\").replace("%", "\\%").replace("_", "\\_")

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        // Engine wird bewusst NICHT zerstört — sie bleibt für die Prozess-Lebensdauer
        // im Application-Scope gecacht. Das verhindert einen "FlutterJNI is not attached
        // to native"-Crash, der entsteht wenn engine.destroy() läuft während noch
        // ein Touch-Event in der MessageQueue liegt. Speicherkosten (~30-50 MB) sind
        // gegenüber dem Crash-Risiko zu vernachlässigen; bei Prozess-Ende räumt
        // Android sowieso auf.
        super.cleanUpFlutterEngine(flutterEngine)
    }

    private fun notifyDartAboutConsent(canRequestAds: Boolean) {
        val channel = adsChannel
        if (channel == null) {
            pendingConsentResult = canRequestAds
            return
        }
        channel.invokeMethod("consentReady", canRequestAds)
    }

    /**
     * Setzt Farbe und Icon-Helligkeit der Systemleisten. Die Werte meldet Dart über
     * [SYSTEM_BARS_CHANNEL], sobald das Theme aufgelöst ist — sie stammen aus `AppTheme`,
     * damit Leisten und App-Hintergrund zusammenpassen.
     *
     * Das erneute Setzen in onResume bleibt nötig: Consent-Form und Ad-Activities fassen
     * die Leisten an, und Flutter setzt seinen eigenen Overlay-Style nur dann neu, wenn er
     * sich geändert hat.
     */
    private fun applySystemBarStyle() {
        // Bevor Dart gemeldet hat, ist der Nachtmodus des Systems die beste
        // Näherung — sonst blitzt beim Start die falsche Farbe auf.
        val isDark = systemBarsDark ?: isSystemInDarkMode()
        val barColor = systemBarsColor ?: if (isDark) Color.BLACK else Color.WHITE

        window.statusBarColor = barColor
        val insetsController = WindowInsetsControllerCompat(window, window.decorView)
        insetsController.isAppearanceLightStatusBars = !isDark

        var flags = window.decorView.systemUiVisibility
        flags = setFlag(flags, View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR, !isDark)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            window.navigationBarColor = barColor
            insetsController.isAppearanceLightNavigationBars = !isDark
            flags = setFlag(flags, View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR, !isDark)
        }
        window.decorView.systemUiVisibility = flags
    }

    private fun setFlag(flags: Int, flag: Int, enabled: Boolean): Int =
        if (enabled) flags or flag else flags and flag.inv()

    private fun isSystemInDarkMode(): Boolean =
        (resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
}
