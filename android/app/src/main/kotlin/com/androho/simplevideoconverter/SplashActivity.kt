package com.androho.simplevideoconverter

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat

/**
 * SplashActivity — Launcher-Activity für SimpleVideoConverter.
 *
 * Ablauf Cold Start:
 *   Phase 1: Consent-Flow + MobileAds-Init (requestConsentAndInitialize)
 *   Phase 2: Ad-Flow mit Safety-Timeout (showAdForColdStart)
 *   → MainActivity starten → finish()
 *
 * Ablauf Background Return:
 *   Gleicher Ablauf, aber am Ende nur finish() (MainActivity liegt bereits im Stack)
 */
class SplashActivity : Activity() {

    companion object {
        private const val TAG = "SplashActivity"
        const val EXTRA_LAUNCH_MODE = "launch_mode"
        const val MODE_COLD_START = "cold_start"
        const val MODE_BACKGROUND_RETURN = "background_return"
        private const val SAFETY_TIMEOUT_MS = 8000L
    }

    private var hasProceeded = false
    private val safetyHandler = Handler(Looper.getMainLooper())
    private var safetyRunnable: Runnable? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Status- und Navigationsleiste während des Splash ausblenden,
        // damit der weiße Hintergrund den ganzen Screen füllt — sonst stehen
        // schwarze Bars bei Themes ohne Light-Bar-Support oder auf <API 23.
        // Beim Übergang zur MainActivity setzt diese ihren eigenen Bar-Stil.
        WindowCompat.setDecorFitsSystemWindows(window, false)
        WindowInsetsControllerCompat(window, window.decorView).apply {
            hide(WindowInsetsCompat.Type.systemBars())
            systemBarsBehavior =
                WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
        }

        // App-Icon + drehender Spinner statt nur weißer Hintergrund —
        // damit User während des Cold-Start-Ad-Loads nicht denken,
        // die App hängt.
        setContentView(R.layout.splash_layout)

        // Konvertierung läuft im Hintergrund → bestehende MainActivity in den Vordergrund
        // bringen, statt eine neue Instanz zu erzeugen (→ schwarzer Screen durch doppelten Engine-Attach).
        if (ConversionService.isRunning) {
            startActivity(Intent(this, MainActivity::class.java).apply {
                addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT or Intent.FLAG_ACTIVITY_SINGLE_TOP)
            })
            finish()
            overridePendingTransition(0, 0)
            return
        }

        val mode = intent.getStringExtra(EXTRA_LAUNCH_MODE) ?: MODE_COLD_START
        Log.d(TAG, "onCreate() mode=$mode")

        val app = application as? SimpleVideoConverterApplication
        val adManager = app?.getAppOpenAdManager()

        if (adManager == null) {
            Log.w(TAG, "AdManager nicht verfügbar – direkt weiter")
            proceed(mode)
            return
        }

        // Phase 1: Consent + MobileAds-Init
        // Safety-Timeout startet erst in Phase 2, da Consent eigene Zeit braucht
        adManager.requestConsentAndInitialize(this) {
            // Phase 2: Ad-Flow
            safetyRunnable = Runnable {
                Log.w(TAG, "Safety-Timeout – weiter ohne Ad")
                proceed(mode)
            }
            safetyHandler.postDelayed(safetyRunnable!!, SAFETY_TIMEOUT_MS)

            adManager.showAdForColdStart(
                activity = this,
                onAdShowing = {
                    Log.d(TAG, "Ad sichtbar – Safety-Timeout gecancelt")
                    safetyRunnable?.let { safetyHandler.removeCallbacks(it) }
                    safetyRunnable = null
                },
                onAdFinished = {
                    proceed(mode)
                }
            )
        }
    }

    private fun proceed(mode: String) {
        if (hasProceeded) return
        hasProceeded = true

        safetyRunnable?.let { safetyHandler.removeCallbacks(it) }
        safetyRunnable = null

        Log.d(TAG, "proceed() mode=$mode")
        if (mode == MODE_COLD_START) {
            startActivity(Intent(this, MainActivity::class.java))
        }
        finish()
        overridePendingTransition(0, 0)
    }

    override fun onDestroy() {
        safetyRunnable?.let { safetyHandler.removeCallbacks(it) }
        safetyRunnable = null
        super.onDestroy()
    }
}
