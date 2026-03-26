package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.ProcessLifecycleOwner
import com.androho.simplevideoconverter.SimpleVideoConverterApplication
import com.androho.simplevideoconverter.SplashActivity
import com.google.android.gms.ads.AdError
import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.FullScreenContentCallback
import com.google.android.gms.ads.LoadAdError
import com.google.android.gms.ads.appopen.AppOpenAd
import java.util.Date

/**
 * Implementierung des App Open Ad Managers für SimpleVideoConverter.
 *
 * Features:
 * - Frequenz-Limit: Max. 1 Ad alle 2 Stunden
 * - Ad-Caching: Max. 4 Stunden alte Ads
 * - Cold-Start + Background-Return via SplashActivity
 * - 1 Stunde Grace Period bei Erstinstallation
 */
class AppOpenAdManagerImpl : AppOpenAdManager, DefaultLifecycleObserver {

    private var appOpenAd: AppOpenAd? = null
    private var isShowingAd = false
    private var isLoadingAd = false
    private var loadTime: Long = 0
    private lateinit var application: Application

    // Cold-Start-Modus: SplashActivity wartet auf Ad oder Timeout
    private var coldStartCallback: (() -> Unit)? = null
    private var coldStartShowingCallback: (() -> Unit)? = null
    private var inColdStartMode = false
    private var coldStartTimeoutRunnable: Runnable? = null
    private val mainHandler = Handler(Looper.getMainLooper())

    companion object {
        private const val TAG = "AppOpenAdManager"

        // TODO: Produktions-Ad-Unit-ID aus AdMob eintragen (Typ: App Open)
        // In AdMob → Apps → Simple Video Converter → Ad Units → App open erstellen

        // Frequenz-Limit: Min. 2 Stunden zwischen Ads
        private const val AD_FREQUENCY_HOURS = 2
        private const val AD_FREQUENCY_MS = 7_200_000L

        // Ad Cache Limit: Max. 4 Stunden alte Ads
        private const val AD_CACHE_MAX_AGE_MS = 4 * 60 * 60 * 1000L

        // SharedPreferences
        private const val PREFS_NAME = "app_open_ad_prefs"
        private const val KEY_LAST_AD_TIME = "last_ad_show_time"

        // Grace Period bei Erstinstallation: erste Ad frühestens nach 1 Stunde
        private const val FIRST_INSTALL_GRACE_PERIOD_MS = 1L * 60 * 60 * 1000L

        // Timeout für Cold-Start-Ad-Loading: 3 Sekunden
        private const val COLD_START_TIMEOUT_MS = 3000L
    }

    override fun initialize(application: Application) {
        this.application = application

        // Fresh-Install Check: Frequenz-Timestamp so setzen, dass erste Ad nach ~1h kommt
        val prefs = application.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        if (!prefs.contains(KEY_LAST_AD_TIME)) {
            val gracePeriodStart = System.currentTimeMillis() - FIRST_INSTALL_GRACE_PERIOD_MS
            prefs.edit().putLong(KEY_LAST_AD_TIME, gracePeriodStart).apply()
            Log.d(TAG, "Fresh install – erste Ad frühestens in 1h")
        }

        ProcessLifecycleOwner.get().lifecycle.addObserver(this)
        loadAd()
        Log.d(TAG, "AppOpenAdManager initialized")
    }

    override fun loadAd() {
        if (isAdAvailable()) {
            Log.d(TAG, "Ad bereits geladen und gültig")
            return
        }
        if (isLoadingAd) {
            Log.d(TAG, "Ad lädt bereits – kein Doppel-Request")
            return
        }
        isLoadingAd = true

        val request = AdRequest.Builder().build()
        AppOpenAd.load(
            application,
            AdConfig.getOpenAdUnitID(),
            request,
            object : AppOpenAd.AppOpenAdLoadCallback() {
                override fun onAdLoaded(ad: AppOpenAd) {
                    isLoadingAd = false
                    appOpenAd = ad
                    loadTime = Date().time
                    Log.d(TAG, "App Open Ad geladen")

                    if (inColdStartMode && coldStartCallback != null) {
                        val activity = getCurrentActivity()
                        if (activity != null) {
                            showAdForColdStartInternal(activity)
                        } else {
                            Log.w(TAG, "Cold-Start: Ad geladen, aber keine Activity – Callback sofort")
                            fireColdStartCallback()
                        }
                    }
                }

                override fun onAdFailedToLoad(loadAdError: LoadAdError) {
                    isLoadingAd = false
                    appOpenAd = null
                    Log.e(TAG, "Ad-Load fehlgeschlagen: ${loadAdError.message}")

                    if (inColdStartMode) {
                        Log.d(TAG, "Cold-Start: Ad-Load fehlgeschlagen – Callback sofort")
                        fireColdStartCallback()
                    }
                }
            }
        )
    }

    override fun showAdForColdStart(activity: Activity, onAdShowing: () -> Unit, onAdFinished: () -> Unit) {
        Log.d(TAG, "showAdForColdStart() called")

        if (isProPurchased()) {
            Log.d(TAG, "Pro-Version aktiv – Cold-Start-Ad übersprungen")
            onAdFinished()
            return
        }

        if (!shouldShowAd(activity)) {
            Log.d(TAG, "Cold-Start: shouldShowAd=false – sofort weiter")
            onAdFinished()
            return
        }

        inColdStartMode = true
        coldStartCallback = onAdFinished
        coldStartShowingCallback = onAdShowing

        // Timeout: nach 3s wird Callback auf jeden Fall gefeuert
        coldStartTimeoutRunnable = Runnable {
            Log.w(TAG, "Cold-Start: Timeout (${COLD_START_TIMEOUT_MS}ms) – kein Ad geladen")
            fireColdStartCallback()
        }
        mainHandler.postDelayed(coldStartTimeoutRunnable!!, COLD_START_TIMEOUT_MS)

        if (isAdAvailable()) {
            Log.d(TAG, "Cold-Start: Ad bereits geladen – zeige sofort")
            showAdForColdStartInternal(activity)
            return
        }

        if (isLoadingAd) {
            Log.d(TAG, "Cold-Start: Ad lädt noch – warte auf onAdLoaded (Timeout: ${COLD_START_TIMEOUT_MS}ms)")
        } else {
            Log.d(TAG, "Cold-Start: Starte Ad-Load (Timeout: ${COLD_START_TIMEOUT_MS}ms)")
            loadAd()
        }
    }

    private fun showAdForColdStartInternal(activity: Activity) {
        if (!isAdAvailable()) {
            fireColdStartCallback()
            return
        }

        showAdInternal(
            activity,
            onShowing = {
                coldStartTimeoutRunnable?.let { mainHandler.removeCallbacks(it) }
                coldStartTimeoutRunnable = null
                coldStartShowingCallback?.invoke()
                coldStartShowingCallback = null
            },
            onDismissed = {
                fireColdStartCallback()
            }
        )
    }

    private fun showAdInternal(activity: Activity, onShowing: (() -> Unit)? = null, onDismissed: (() -> Unit)? = null) {
        appOpenAd?.fullScreenContentCallback = object : FullScreenContentCallback() {
            override fun onAdDismissedFullScreenContent() {
                appOpenAd = null
                isShowingAd = false
                saveLastAdTime(activity)
                loadAd() // Nächste Ad vorbereiten
                Log.d(TAG, "App Open Ad dismissed")
                onDismissed?.invoke()
            }

            override fun onAdFailedToShowFullScreenContent(adError: AdError) {
                appOpenAd = null
                isShowingAd = false
                Log.e(TAG, "Ad-Show fehlgeschlagen: ${adError.message}")
                onDismissed?.invoke()
            }

            override fun onAdShowedFullScreenContent() {
                Log.d(TAG, "App Open Ad shown")
                onShowing?.invoke()
            }
        }

        isShowingAd = true
        appOpenAd?.show(activity)
    }

    private fun fireColdStartCallback() {
        coldStartTimeoutRunnable?.let { mainHandler.removeCallbacks(it) }
        coldStartTimeoutRunnable = null

        val callback = coldStartCallback
        coldStartCallback = null
        coldStartShowingCallback = null
        inColdStartMode = false

        if (callback != null) {
            mainHandler.post { callback.invoke() }
        }
    }

    private fun shouldShowAd(context: Context): Boolean {
        if (isShowingAd) {
            Log.d(TAG, "Ad wird bereits angezeigt")
            return false
        }

        if (!isFrequencyLimitReached(context)) {
            Log.d(TAG, "Frequenz-Limit noch nicht erreicht")
            return false
        }

        Log.d(TAG, "Alle Bedingungen erfüllt – Ad wird gezeigt")
        return true
    }

    private fun isFrequencyLimitReached(context: Context): Boolean {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val lastAdTime = prefs.getLong(KEY_LAST_AD_TIME, 0)
        val timeSinceLastAd = System.currentTimeMillis() - lastAdTime
        val hoursElapsed = timeSinceLastAd / (60 * 60 * 1000.0)
        val isReached = timeSinceLastAd >= AD_FREQUENCY_MS

        Log.d(TAG, "Frequenz-Check: ${hoursElapsed.format(2)}h seit letzter Ad / ${AD_FREQUENCY_HOURS}h erforderlich → $isReached")
        return isReached
    }

    private fun saveLastAdTime(context: Context) {
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .edit()
            .putLong(KEY_LAST_AD_TIME, System.currentTimeMillis())
            .apply()
        Log.d(TAG, "Zeitstempel letzter Ad gespeichert")
    }

    private fun isAdAvailable(): Boolean {
        val ad = appOpenAd ?: return false
        return (Date().time - loadTime) < AD_CACHE_MAX_AGE_MS
    }

    /** Lifecycle: App kommt in den Foreground (Start oder Background-Return). */
    override fun onStart(owner: LifecycleOwner) {
        super.onStart(owner)
        Log.d(TAG, "onStart() – App im Foreground")

        if (inColdStartMode) {
            Log.d(TAG, "onStart() übersprungen – Cold-Start-Modus aktiv")
            return
        }

        if (isProPurchased()) {
            Log.d(TAG, "Pro-Version aktiv – Background-Return-Ad übersprungen")
            return
        }

        tryLaunchSplashForBackgroundReturn(retryCount = 0, maxRetries = 3)
    }

    private fun tryLaunchSplashForBackgroundReturn(retryCount: Int, maxRetries: Int) {
        val currentActivity = getCurrentActivity()

        if (currentActivity != null) {
            if (currentActivity is SplashActivity) {
                Log.d(TAG, "Background-Return: SplashActivity bereits aktiv – überspringe")
                return
            }

            if (!shouldShowAd(currentActivity)) {
                Log.d(TAG, "Background-Return: shouldShowAd=false – kein Splash")
                return
            }

            Log.d(TAG, "Background-Return: Starte SplashActivity über ${currentActivity.javaClass.simpleName}")
            val intent = Intent(currentActivity, SplashActivity::class.java).apply {
                putExtra(SplashActivity.EXTRA_LAUNCH_MODE, SplashActivity.MODE_BACKGROUND_RETURN)
                addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
            }
            currentActivity.startActivity(intent)
            currentActivity.overridePendingTransition(0, 0)
            return
        }

        if (retryCount >= maxRetries) {
            Log.w(TAG, "Background-Return: Max Retries ($maxRetries) – keine Activity")
            return
        }

        val delayMs = when (retryCount) { 0 -> 50L; 1 -> 150L; else -> 300L }
        Log.d(TAG, "Background-Return: Retry ${retryCount + 1}/$maxRetries in ${delayMs}ms")
        mainHandler.postDelayed({ tryLaunchSplashForBackgroundReturn(retryCount + 1, maxRetries) }, delayMs)
    }

    private fun getCurrentActivity(): Activity? {
        return try {
            (application as? SimpleVideoConverterApplication)?.getCurrentActivity()
        } catch (e: Exception) {
            Log.e(TAG, "getCurrentActivity() fehlgeschlagen", e)
            null
        }
    }

    /** Liest den isPro-Flag, den Flutter's shared_preferences in FlutterSharedPreferences speichert. */
    private fun isProPurchased(): Boolean =
        application.getSharedPreferences("FlutterSharedPreferences", android.content.Context.MODE_PRIVATE)
            .getBoolean("flutter.isPro", false)

    private fun Double.format(digits: Int) = "%.${digits}f".format(this)
}
