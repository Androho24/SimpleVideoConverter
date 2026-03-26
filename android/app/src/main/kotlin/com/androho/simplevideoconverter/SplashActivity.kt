package com.androho.simplevideoconverter

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log

/**
 * SplashActivity — Launcher-Activity für SimpleVideoConverter.
 *
 * Cold Start:
 *   SplashActivity → (Ad oder Timeout 3s) → startet MainActivity → finish()
 *
 * Background Return:
 *   SplashActivity über MainActivity gelegt → (Ad oder Timeout 3s) → finish()
 *   (MainActivity wird danach sichtbar)
 */
class SplashActivity : Activity() {

    companion object {
        private const val TAG = "SplashActivity"
        const val EXTRA_LAUNCH_MODE = "launch_mode"
        const val MODE_COLD_START = "cold_start"
        const val MODE_BACKGROUND_RETURN = "background_return"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Kein setContentView – Theme (LaunchTheme) liefert den windowBackground

        val mode = intent.getStringExtra(EXTRA_LAUNCH_MODE) ?: MODE_COLD_START
        Log.d(TAG, "onCreate() mode=$mode")

        val app = application as? SimpleVideoConverterApplication
        val adManager = app?.getAppOpenAdManager()

        if (adManager == null) {
            Log.w(TAG, "AdManager nicht verfügbar – direkt weiter")
            proceed(mode)
            return
        }

        adManager.showAdForColdStart(
            activity = this,
            onAdShowing = {
                Log.d(TAG, "Ad wird angezeigt")
                // Ad übernimmt den Bildschirm – nichts zu tun
            },
            onAdFinished = {
                Log.d(TAG, "Ad-Flow abgeschlossen – proceed()")
                proceed(mode)
            }
        )
    }

    private fun proceed(mode: String) {
        if (mode == MODE_COLD_START) {
            startActivity(Intent(this, MainActivity::class.java))
        }
        finish()
        overridePendingTransition(0, 0)
    }
}
