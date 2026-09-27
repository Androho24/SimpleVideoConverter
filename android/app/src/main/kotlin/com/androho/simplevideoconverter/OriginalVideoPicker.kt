package com.androho.simplevideoconverter

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.provider.OpenableColumns
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.UUID

/**
 * Videoauswahl über die Dateiauswahl des Systems (SAF) und „Original löschen“.
 *
 * Bewusst nicht der Photo Picker (über image_picker): Der liefert als Namen nur
 * eine Nummer („45677.mp4“), und seine URI lehnt `createTrashRequest` ab
 * („All requested items must be referenced by specific ID“). SAF liefert den
 * echten Namen, und `MediaStore.getMediaUri` macht aus dem Dokument einen
 * MediaStore-Eintrag, den der Papierkorb-Dialog annimmt. Gerätetest
 * 2026-09-27, Pixel 10. Keiner der Wege braucht Medien-Leserechte: Die Auswahl
 * selbst gibt Zugriff auf genau diese eine Datei.
 */
class OriginalVideoPicker(private val activity: Activity) {

    companion object {
        private const val TAG = "OriginalVideoPicker"
        private const val REQUEST_PICK = 7301
        private const val REQUEST_TRASH = 7302
    }

    private var pendingResult: MethodChannel.Result? = null

    /**
     * Öffnet die Dateiauswahl. Ergebnis: null bei Abbruch, sonst
     * `path` (Kopie im Cache, echter Name), `displayName` und `trashUri`
     * (MediaStore-URI des Originals, nur ab Android 11 und nur für Dateien aus
     * dem MediaStore — sonst null, dann gibt es keinen Löschen-Button).
     */
    fun pickVideo(result: MethodChannel.Result) {
        if (!claim(result)) return
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = "video/*"
        }
        try {
            activity.startActivityForResult(intent, REQUEST_PICK)
        } catch (e: Exception) {
            // Geräte ohne Dateiauswahl (manche TV-Boxen, abgespeckte Builds):
            // Ohne das Zurücksetzen bliebe pendingResult belegt, und jeder
            // weitere Versuch endete mit „busy“.
            Log.w(TAG, "Dateiauswahl nicht verfügbar", e)
            pendingResult = null
            result.error("no_picker", e.message, null)
        }
    }

    /** Legt das Original über den System-Dialog in den Papierkorb. Ergebnis: bestätigt ja/nein. */
    fun trashOriginal(uri: String?, result: MethodChannel.Result) {
        if (uri == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            result.success(false)
            return
        }
        if (!claim(result)) return
        try {
            val request = MediaStore.createTrashRequest(
                activity.contentResolver, listOf(Uri.parse(uri)), true
            )
            activity.startIntentSenderForResult(request.intentSender, REQUEST_TRASH, null, 0, 0, 0)
        } catch (e: Exception) {
            Log.w(TAG, "createTrashRequest abgelehnt", e)
            pendingResult = null
            result.error("trash_failed", e.message, null)
        }
    }

    /** @return true, wenn der Request hierher gehörte. */
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQUEST_PICK && requestCode != REQUEST_TRASH) return false
        val result = pendingResult ?: return true
        pendingResult = null
        if (requestCode == REQUEST_TRASH) {
            result.success(resultCode == Activity.RESULT_OK)
            return true
        }
        val picked = data?.data
        if (resultCode != Activity.RESULT_OK || picked == null) {
            result.success(null)
            return true
        }
        // Große Videos zu kopieren dauert — nicht auf dem Main-Thread.
        Thread {
            val reply = try {
                copyToCache(picked)
            } catch (e: Exception) {
                Log.w(TAG, "Kopieren fehlgeschlagen", e)
                null
            }
            activity.runOnUiThread {
                if (reply == null) {
                    result.error("copy_failed", "Video konnte nicht gelesen werden", null)
                } else {
                    result.success(reply)
                }
            }
        }.start()
        return true
    }

    private fun claim(result: MethodChannel.Result): Boolean {
        if (pendingResult != null) {
            result.error("busy", "Eine Auswahl läuft bereits", null)
            return false
        }
        pendingResult = result
        return true
    }

    /**
     * Kopiert wie image_picker nach `cache/<UUID>/<Name>`. Den UUID-Ordner räumt
     * der App-Start wieder ab (`_cleanAppCache` in converter_screen.dart).
     */
    private fun copyToCache(uri: Uri): Map<String, Any?> {
        val displayName = queryDisplayName(uri)
        // Nur was als Dateiname im Cache nicht geht; die Bereinigung für den
        // Ausgabenamen macht OutputFileName auf der Dart-Seite.
        val safeName = displayName
            ?.replace(Regex("[\\u0000-\\u001f/]"), "_")
            ?.trim()
            ?.takeIf { it.isNotEmpty() && it != "." && it != ".." }
            ?: "video.mp4"
        val dir = File(activity.cacheDir, UUID.randomUUID().toString()).apply { mkdirs() }
        val target = File(dir, safeName)
        activity.contentResolver.openInputStream(uri).use { input ->
            requireNotNull(input) { "Kein Datenstrom für $uri" }
            target.outputStream().use { input.copyTo(it) }
        }
        return mapOf(
            "path" to target.path,
            "displayName" to displayName,
            "trashUri" to mediaStoreUri(uri)?.toString(),
        )
    }

    private fun queryDisplayName(uri: Uri): String? = try {
        activity.contentResolver
            .query(uri, arrayOf(OpenableColumns.DISPLAY_NAME), null, null, null)
            ?.use { if (it.moveToFirst()) it.getString(0) else null }
    } catch (e: Exception) {
        null
    }

    /** Null, wenn das Dokument nicht aus dem MediaStore stammt (z. B. Cloud-Anbieter). */
    private fun mediaStoreUri(documentUri: Uri): Uri? {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return null
        return try {
            MediaStore.getMediaUri(activity, documentUri)
        } catch (e: Exception) {
            Log.i(TAG, "Kein MediaStore-Eintrag für $documentUri: $e")
            null
        }
    }
}
