package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.app.Application
import android.content.Context

/**
 * Interface für App Open Ad Management.
 * Ermöglicht spätere IAP-Integration durch einfaches Austauschen der Implementierung.
 */
interface AppOpenAdManager {

    /** Initialisiert den Ad Manager mit der Application-Instanz. */
    fun initialize(application: Application)

    /** Lädt eine neue App Open Ad im Hintergrund. */
    fun loadAd()

    /**
     * Führt den UMP-Consent-Flow durch und initialisiert danach MobileAds.
     * Bei Pro-Nutzern wird der Consent-Flow übersprungen.
     */
    fun requestConsentAndInitialize(activity: Activity, onReady: () -> Unit)

    /**
     * Initialisiert MobileAds nach abgeschlossenem Consent.
     * Idempotent: Bei bereits erfolgter Initialisierung sofortiger Callback.
     */
    fun initializeMobileAds(canShowAds: Boolean, onInitialized: () -> Unit)

    /** Gibt zurück ob der User seinen Datenschutz-Consent anpassen kann (EU/CCPA). */
    fun isPrivacyOptionsRequired(context: Context): Boolean

    /** Zeigt das UMP Privacy Options Formular (für Settings-Screen). */
    fun showPrivacyOptionsForm(activity: Activity, onDone: () -> Unit)

    /**
     * Cold-Start / Background-Return Modus via SplashActivity.
     * Blockiert den Start bis die Ad gezeigt wurde oder ein Timeout greift (3s).
     *
     * @param onAdShowing Callback wenn die Ad tatsächlich sichtbar wird
     * @param onAdFinished Callback wenn Ad-Flow abgeschlossen (Dismiss, Fehler oder Timeout)
     */
    fun showAdForColdStart(activity: Activity, onAdShowing: () -> Unit, onAdFinished: () -> Unit)
}
