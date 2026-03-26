package com.androho.simplevideoconverter

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.util.Log
import com.androho.simplevideoconverter.ads.AppOpenAdManager
import com.androho.simplevideoconverter.ads.AppOpenAdManagerImpl

class SimpleVideoConverterApplication : Application(), Application.ActivityLifecycleCallbacks {

    private val activeActivities = mutableSetOf<Activity>()
    private var appOpenAdManager: AppOpenAdManager? = null

    companion object {
        private const val TAG = "SimpleVideoConverterApp"
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
