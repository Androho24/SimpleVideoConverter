package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.app.Application
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.google.android.gms.ads.MobileAds
import com.google.android.ump.ConsentInformation
import com.google.android.ump.UserMessagingPlatform

/**
 * Verwaltet den UMP-Consent-Flow und die MobileAds-Initialisierung.
 *
 * Die frühere App-Open-Ad (App-Start-Ad) wurde entfernt. Übrig bleibt der für die
 * Flutter-Native-Ads nötige Stack:
 * - UMP Consent-Flow vor MobileAds-Initialisierung (Google-Anforderung)
 * - MobileAds-Init (idempotent), mit App-Volume 0 für stumme Ad-Videos
 * - Privacy-Options-Formular (für den Settings-Screen)
 */
class AppOpenAdManagerImpl : AppOpenAdManager {

    @Volatile private var isMobileAdsInitialized = false
    private lateinit var application: Application

    private val mainHandler = Handler(Looper.getMainLooper())

    companion object {
        private const val TAG = "AppOpenAdManager"
    }

    override fun initialize(application: Application) {
        this.application = application

        // Früh-Init für Bestandsnutzer mit bereits gecachtem Consent — spart Zeit, bis
        // die MainActivity den Consent-Flow anstößt. Auf den nächsten Main-Looper-Tick
        // posten, damit Application.onCreate() schnell returned.
        val consentInfo = UserMessagingPlatform.getConsentInformation(application)
        if (consentInfo.canRequestAds()) {
            mainHandler.post {
                Log.d(TAG, "Consent bereits vorhanden – starte MobileAds früh")
                MobileAds.initialize(application) {
                    isMobileAdsInitialized = true
                    MobileAds.setAppVolume(0.0f)
                    Log.d(TAG, "MobileAds früh initialisiert")
                }
            }
        } else {
            Log.d(TAG, "Kein Consent gecacht – warte auf MainActivity")
        }
    }

    override fun initializeMobileAds(canShowAds: Boolean, onInitialized: () -> Unit) {
        Log.d(TAG, "initializeMobileAds() canShowAds=$canShowAds")
        if (isMobileAdsInitialized) {
            Log.d(TAG, "MobileAds bereits initialisiert")
            mainHandler.post { onInitialized() }
            return
        }
        if (!canShowAds) {
            Log.d(TAG, "canShowAds=false – MobileAds wird nicht initialisiert")
            mainHandler.post { onInitialized() }
            return
        }
        MobileAds.initialize(application) {
            isMobileAdsInitialized = true
            MobileAds.setAppVolume(0.0f)
            Log.d(TAG, "MobileAds initialisiert nach Consent")
            mainHandler.post { onInitialized() }
        }
    }

    override fun requestConsentAndInitialize(activity: Activity, onReady: () -> Unit) {
        if (isProPurchased()) {
            Log.d(TAG, "requestConsentAndInitialize: Pro aktiv – Consent übersprungen")
            onReady()
            return
        }
        ConsentHelper.requestAndShowIfRequired(activity) { canShowAds ->
            // Frischen Consent auf Firebase anwenden (Analytics/Crashlytics-Signale
            // + Collection), nachdem das Consent-Formular durchlaufen wurde.
            ConsentModeHelper.apply(activity)
            initializeMobileAds(canShowAds) {
                onReady()
            }
        }
    }

    override fun isPrivacyOptionsRequired(context: Context): Boolean {
        val consentInfo = UserMessagingPlatform.getConsentInformation(context)
        return consentInfo.privacyOptionsRequirementStatus ==
                ConsentInformation.PrivacyOptionsRequirementStatus.REQUIRED
    }

    override fun showPrivacyOptionsForm(activity: Activity, onDone: () -> Unit) {
        UserMessagingPlatform.showPrivacyOptionsForm(activity) { formError ->
            if (formError != null) {
                Log.w(TAG, "Privacy options form error: ${formError.message}")
            }
            // Nutzer kann seine Einwilligung hier geändert haben → Firebase neu setzen.
            ConsentModeHelper.apply(activity)
            onDone()
        }
    }

    private fun isProPurchased(): Boolean =
        application.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            .getBoolean("flutter.isPro", false)
}
