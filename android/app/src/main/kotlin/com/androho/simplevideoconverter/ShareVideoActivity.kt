package com.androho.simplevideoconverter

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.util.Log

/**
 * Nimmt ein über „Teilen“ geschicktes Video an und reicht es an [MainActivity]
 * weiter. Hat keine eigene Oberfläche.
 *
 * Eine eigene Activity, weil Android die Empfänger von SEND im Task der
 * teilenden App startet. Stünde der Filter an MainActivity, liefe dort eine
 * zweite Instanz neben der ersten, beide an derselben gecachten Flutter-Engine.
 * Die Flags hier führen stattdessen zur vorhandenen Instanz. CLEAR_TOP schließt
 * dabei, was noch über ihr liegt (etwa eine Vollbild-Werbung): Ohne das käme
 * sonst wieder eine zweite Instanz obendrauf.
 *
 * Bewusst nur SEND und nicht VIEW („Öffnen mit“): Mit VIEW würde die App als
 * Videoplayer angeboten, inklusive „Immer“.
 */
class ShareVideoActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        sharedUri(intent)?.let(::forwardToMainActivity)
        // Theme.NoDisplay verlangt finish() noch vor onResume.
        finish()
    }

    private fun sharedUri(intent: Intent): Uri? {
        val stream = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent.getParcelableExtra(Intent.EXTRA_STREAM, Uri::class.java)
        } else {
            @Suppress("DEPRECATION")
            intent.getParcelableExtra(Intent.EXTRA_STREAM)
        }
        return stream ?: intent.clipData?.takeIf { it.itemCount > 0 }?.getItemAt(0)?.uri
    }

    private fun forwardToMainActivity(uri: Uri) {
        val forward = Intent(this, MainActivity::class.java).apply {
            action = MainActivity.ACTION_SHARED_VIDEO
            data = uri
            addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_CLEAR_TOP or
                    Intent.FLAG_ACTIVITY_SINGLE_TOP
            )
        }
        try {
            // Die Leseberechtigung hängt an dieser Activity und endet mit ihr,
            // deshalb geht sie an MainActivity weiter.
            startActivity(Intent(forward).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION))
        } catch (e: SecurityException) {
            // Die teilende App hat keine Berechtigung mitgegeben. Ohne das Flag
            // öffnet sich die App trotzdem und meldet die Datei als unlesbar.
            Log.w("ShareVideoActivity", "Keine Leseberechtigung erhalten", e)
            startActivity(forward)
        }
    }
}
