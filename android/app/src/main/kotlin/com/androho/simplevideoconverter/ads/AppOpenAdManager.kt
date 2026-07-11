package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.app.Application
import android.content.Context

/**
 * Interface für Consent- und MobileAds-Initialisierung.
 *
 * Hinweis: Die frühere App-Open-Ad (App-Start-Ad) wurde entfernt. Der Manager
 * verwaltet nur noch den UMP-Consent-Flow, die MobileAds-Initialisierung und das
 * Privacy-Options-Formular — beides wird für die Flutter-Native-Ads benötigt.
 */
interface AppOpenAdManager {

    /** Initialisiert den Manager mit der Application-Instanz. */
    fun initialize(application: Application)

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
}
