package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.app.Application

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
     * Cold-Start / Background-Return Modus via SplashActivity.
     * Blockiert den Start bis die Ad gezeigt wurde oder ein Timeout greift (3s).
     *
     * @param onAdShowing Callback wenn die Ad tatsächlich sichtbar wird
     * @param onAdFinished Callback wenn Ad-Flow abgeschlossen (Dismiss, Fehler oder Timeout)
     */
    fun showAdForColdStart(activity: Activity, onAdShowing: () -> Unit, onAdFinished: () -> Unit)
}
