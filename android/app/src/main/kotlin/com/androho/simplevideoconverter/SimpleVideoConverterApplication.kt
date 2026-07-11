package com.androho.simplevideoconverter

import android.app.Application
import android.util.Log
import android.view.LayoutInflater
import com.androho.simplevideoconverter.ads.AppOpenAdManager
import com.androho.simplevideoconverter.ads.AppOpenAdManagerImpl
import com.androho.simplevideoconverter.ads.ConsentModeHelper
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class SimpleVideoConverterApplication : Application() {

    private var appOpenAdManager: AppOpenAdManager? = null
    private var mainFlutterEngine: FlutterEngine? = null

    companion object {
        private const val TAG = "SimpleVideoConverterApp"
        const val MAIN_ENGINE_ID = "main_engine"
    }

    override fun onCreate() {
        super.onCreate()
        // Gecachten Consent früh auf Firebase anwenden, bevor die UI/der Consent-Flow
        // startet. So bleibt Analytics/Crashlytics für Bestandsnutzer korrekt (an/aus),
        // ohne auf die MainActivity zu warten. Erstnutzer ohne TCF-Daten → Collection aus.
        ConsentModeHelper.apply(this)
        initializeAppOpenAds()
    }

    private fun initializeAppOpenAds() {
        try {
            appOpenAdManager = AppOpenAdManagerImpl()
            appOpenAdManager?.initialize(this)
            Log.d(TAG, "AppOpenAdManager initialized")
        } catch (e: Exception) {
            Log.e(TAG, "Failed to initialize AppOpenAdManager", e)
        }
    }

    fun getAppOpenAdManager(): AppOpenAdManager? = appOpenAdManager

    fun getMainFlutterEngine(): FlutterEngine {
        mainFlutterEngine?.let { return it }

        val engine = FlutterEngine(this)
        GeneratedPluginRegistrant.registerWith(engine)

        // NativeAdFactory an die Engine-Lebensdauer binden, NICHT an den
        // Activity-Lifecycle. Die Engine ist prozess-weit gecacht und Dart läuft
        // weiter, während keine Activity attached ist (App im Hintergrund). Würde
        // die Factory beim Activity-Detach abgemeldet, crasht ein Ad-Load aus dem
        // NativeAdPreloader mit "No NativeAdFactory with id: nativeAd". Hier
        // einmalig registriert, lebt sie so lange wie die Engine.
        // GeneratedPluginRegistrant schluckt Konstruktor-Fehler des GMA-Plugins
        // still (z. B. wenn Play Services fehlen) → try/catch gegen die dann
        // geworfene IllegalStateException.
        try {
            GoogleMobileAdsPlugin.registerNativeAdFactory(
                engine,
                "nativeAd",
                NativeAdFactoryImpl(LayoutInflater.from(this))
            )
        } catch (e: Exception) {
            Log.e(TAG, "Failed to register NativeAdFactory", e)
        }

        engine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        FlutterEngineCache.getInstance().put(MAIN_ENGINE_ID, engine)
        mainFlutterEngine = engine
        Log.d(TAG, "Main FlutterEngine created and cached")
        return engine
    }
}
