package com.androho.simplevideoconverter

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.util.Log
import com.androho.simplevideoconverter.ads.AppOpenAdManager
import com.androho.simplevideoconverter.ads.AppOpenAdManagerImpl
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant

class SimpleVideoConverterApplication : Application(), Application.ActivityLifecycleCallbacks {

    private val activeActivities = mutableSetOf<Activity>()
    private var appOpenAdManager: AppOpenAdManager? = null
    private var mainFlutterEngine: FlutterEngine? = null

    companion object {
        private const val TAG = "SimpleVideoConverterApp"
        const val MAIN_ENGINE_ID = "main_engine"
    }

    override fun onCreate() {
        super.onCreate()
        registerActivityLifecycleCallbacks(this)
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

    override fun onTerminate() {
        super.onTerminate()
        unregisterActivityLifecycleCallbacks(this)
    }

    fun getCurrentActivity(): Activity? = activeActivities.lastOrNull()

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

    fun releaseMainFlutterEngineIfIdle() {
        if (ConversionService.isRunning) return

        mainFlutterEngine?.let {
            FlutterEngineCache.getInstance().remove(MAIN_ENGINE_ID)
            mainFlutterEngine = null
            it.destroy()
            Log.d(TAG, "Main FlutterEngine released and destroyed")
        }
    }

    // ActivityLifecycleCallbacks
    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
        activeActivities.add(activity)
    }

    override fun onActivityDestroyed(activity: Activity) {
        activeActivities.remove(activity)
    }

    override fun onActivityStarted(activity: Activity) {}
    override fun onActivityResumed(activity: Activity) {}
    override fun onActivityPaused(activity: Activity) {}
    override fun onActivityStopped(activity: Activity) {}
    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}
}
