package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.app.Application
import android.content.Context
import android.util.Log
import com.google.android.ump.ConsentInformation
import com.google.android.ump.UserMessagingPlatform

/**
 * Verwaltet den nativen UMP-Consent-Flow.
 *
 * Die frühere App-Open-Ad (App-Start-Ad) wurde entfernt. Übrig bleibt der für die
 * Flutter-Native-Ads nötige Stack:
 * - UMP Consent-Flow vor der Next-Gen-SDK-Initialisierung
 * - Privacy-Options-Formular (für den Settings-Screen)
 */
class AppOpenAdManagerImpl : AppOpenAdManager {

    private lateinit var application: Application

    companion object {
        private const val TAG = "AppOpenAdManager"
    }

    override fun initialize(application: Application) {
        this.application = application
    }

    override fun requestConsent(activity: Activity, onReady: (Boolean) -> Unit) {
        if (isProPurchased()) {
            Log.d(TAG, "requestConsent: Pro aktiv – Consent und Ads übersprungen")
            onReady(false)
            return
        }
        ConsentHelper.requestAndShowIfRequired(activity) { canRequestAds ->
            // Frischen Consent auf Firebase anwenden (Analytics/Crashlytics-Signale
            // + Collection), nachdem das Consent-Formular durchlaufen wurde.
            ConsentModeHelper.apply(activity)
            onReady(canRequestAds)
        }
    }

    override fun isPrivacyOptionsRequired(context: Context): Boolean {
        val consentInfo = UserMessagingPlatform.getConsentInformation(context)
        return consentInfo.privacyOptionsRequirementStatus ==
                ConsentInformation.PrivacyOptionsRequirementStatus.REQUIRED
    }

    override fun showPrivacyOptionsForm(activity: Activity, onDone: (Boolean) -> Unit) {
        UserMessagingPlatform.showPrivacyOptionsForm(activity) { formError ->
            if (formError != null) {
                Log.w(TAG, "Privacy options form error: ${formError.message}")
            }
            // Nutzer kann seine Einwilligung hier geändert haben → Firebase neu setzen.
            ConsentModeHelper.apply(activity)
            val canRequestAds =
                UserMessagingPlatform.getConsentInformation(activity).canRequestAds()
            onDone(canRequestAds)
        }
    }

    private fun isProPurchased(): Boolean =
        application.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            .getBoolean("flutter.isPro", false)
}
