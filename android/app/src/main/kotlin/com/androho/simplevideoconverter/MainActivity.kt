package com.androho.simplevideoconverter

import android.Manifest
import android.content.ActivityNotFoundException
import android.content.ContentUris
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.TextView
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.view.WindowInsetsControllerCompat
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class MainActivity : FlutterActivity() {

    private val ADS_CHANNEL = "com.androho.simplevideoconverter/ads"
    private val SERVICE_CHANNEL = "com.androho.simplevideoconverter/conversion_service"
    private val GALLERY_CHANNEL = "com.androho.simplevideoconverter/gallery"

    override fun provideFlutterEngine(context: Context): FlutterEngine? =
        (application as SimpleVideoConverterApplication).getMainFlutterEngine()

    // Engine-Lifecycle liegt vollständig bei SimpleVideoConverterApplication.
    // Die Activity zerstört die Engine nie selbst — erst detachen (super), dann ggf. destroyen.
    override fun shouldDestroyEngineWithHost(): Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        applySystemBarStyle()
    }

    override fun onResume() {
        super.onResume()
        applySystemBarStyle()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        // GeneratedPluginRegistrant schluckt Konstruktor-Fehler des GMA-Plugins
        // still (z. B. wenn Play Services fehlen) — die Plugin-Instanz fehlt dann
        // im Engine-Cache und registerNativeAdFactory wirft IllegalStateException.
        // Ohne try/catch killt das die Activity in onCreate.
        try {
            GoogleMobileAdsPlugin.registerNativeAdFactory(
                flutterEngine,
                "nativeAd",
                NativeAdFactoryImpl(layoutInflater)
            )
        } catch (e: Exception) {
            Log.e("MainActivity", "Failed to register NativeAdFactory", e)
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ADS_CHANNEL)
            .setMethodCallHandler { call, result ->
                val adManager = (application as? SimpleVideoConverterApplication)?.getAppOpenAdManager()
                when (call.method) {
                    "isPrivacyOptionsRequired" ->
                        result.success(adManager?.isPrivacyOptionsRequired(this) ?: false)
                    "showPrivacyOptionsForm" ->
                        adManager?.showPrivacyOptionsForm(this) { result.success(null) }
                            ?: result.success(null)
                    else -> result.notImplemented()
                }
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
            // Nach DATE_ADDED DESC sortieren — falls eine alte Datei mit
            // gleichem Namen noch im Index liegt, wird die neueste genommen.
            val sortOrder = "${MediaStore.Video.Media.DATE_ADDED} DESC"
            val selection = "${MediaStore.Video.Media.DISPLAY_NAME} = ?"
            val selectionArgs = arrayOf(displayName)

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

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        try {
            GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "nativeAd")
        } catch (e: Exception) {
            Log.e("MainActivity", "Failed to unregister NativeAdFactory", e)
        }
        // Erst super: Flutter detacht die Engine sauber von dieser Activity.
        // Danach release: Engine ggf. zerstören — nie vorher, sonst hängt Flutter im Limbo.
        super.cleanUpFlutterEngine(flutterEngine)
        (application as? SimpleVideoConverterApplication)?.releaseMainFlutterEngineIfIdle()
    }

    private fun applySystemBarStyle() {
        window.statusBarColor = Color.WHITE
        val insetsController = WindowInsetsControllerCompat(window, window.decorView)
        insetsController.isAppearanceLightStatusBars = true

        var flags = window.decorView.systemUiVisibility
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            flags = flags or View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            window.navigationBarColor = Color.WHITE
            insetsController.isAppearanceLightNavigationBars = true
            flags = flags or View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR
        }
        window.decorView.systemUiVisibility = flags
    }
}

class NativeAdFactoryImpl(
    private val layoutInflater: LayoutInflater
) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_ad, null) as NativeAdView

        adView.mediaView        = adView.findViewById<MediaView>(R.id.ad_media)
        adView.headlineView     = adView.findViewById<TextView>(R.id.ad_headline)
        adView.advertiserView   = adView.findViewById<TextView>(R.id.ad_advertiser)
        adView.callToActionView = adView.findViewById<Button>(R.id.ad_call_to_action)

        (adView.headlineView     as TextView).text = nativeAd.headline
        (adView.callToActionView as Button).text   = nativeAd.callToAction
        adView.mediaView?.mediaContent             = nativeAd.mediaContent

        val advertiser = nativeAd.advertiser
        (adView.advertiserView as TextView).text = advertiser ?: ""
        adView.advertiserView?.visibility =
            if (advertiser != null) View.VISIBLE else View.INVISIBLE

        adView.setNativeAd(nativeAd)
        return adView
    }
}
