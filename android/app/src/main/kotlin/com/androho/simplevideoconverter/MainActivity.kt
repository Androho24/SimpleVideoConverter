package com.androho.simplevideoconverter

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.os.Build
import android.os.Bundle
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
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "nativeAd",
            NativeAdFactoryImpl(layoutInflater)
        )

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
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "nativeAd")
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
