package com.androho.simplevideoconverter

import android.app.Application
import android.util.Log
import com.androho.simplevideoconverter.ads.AppOpenAdManager
import com.androho.simplevideoconverter.ads.AppOpenAdManagerImpl
import com.androho.simplevideoconverter.ads.ConsentModeHelper
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant

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

        engine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        FlutterEngineCache.getInstance().put(MAIN_ENGINE_ID, engine)
        mainFlutterEngine = engine
        Log.d(TAG, "Main FlutterEngine created and cached")
        return engine
    }
}
