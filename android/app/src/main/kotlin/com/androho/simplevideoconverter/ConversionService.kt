package com.androho.simplevideoconverter

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

class ConversionService : Service() {

    companion object {
        @Volatile var isRunning = false

        const val ACTION_START = "com.androho.simplevideoconverter.ACTION_START"
        const val ACTION_UPDATE_PROGRESS = "com.androho.simplevideoconverter.ACTION_UPDATE"
        const val ACTION_COMPLETE = "com.androho.simplevideoconverter.ACTION_COMPLETE"
        const val ACTION_STOP = "com.androho.simplevideoconverter.ACTION_STOP"

        const val EXTRA_FILE_NAME = "fileName"
        const val EXTRA_PERCENT = "percent"
        const val EXTRA_SPEED_TEXT = "speedText"

        private const val NOTIFICATION_ID_PROGRESS = 2001
        private const val NOTIFICATION_ID_DONE = 2002
        private const val CHANNEL_PROGRESS_ID = "conversion_progress"
        private const val CHANNEL_DONE_ID = "conversion_done"
    }

    private lateinit var notificationManager: NotificationManager
    private var currentFileName = ""

    override fun onCreate() {
        super.onCreate()
        isRunning = true
        notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            notificationManager.createNotificationChannel(
                NotificationChannel(
                    CHANNEL_PROGRESS_ID,
                    getString(R.string.notification_channel_progress),
                    NotificationManager.IMPORTANCE_LOW
                ).apply { setShowBadge(false) }
            )
            notificationManager.createNotificationChannel(
                NotificationChannel(
                    CHANNEL_DONE_ID,
                    getString(R.string.notification_channel_done),
                    NotificationManager.IMPORTANCE_DEFAULT
                )
            )
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        when (intent?.action) {
            ACTION_START -> {
                currentFileName = intent.getStringExtra(EXTRA_FILE_NAME) ?: ""
                startForeground(NOTIFICATION_ID_PROGRESS, buildProgressNotification(0, ""))
            }
            ACTION_UPDATE_PROGRESS -> {
                val percent = intent.getIntExtra(EXTRA_PERCENT, 0)
                val speedText = intent.getStringExtra(EXTRA_SPEED_TEXT) ?: ""
                notificationManager.notify(
                    NOTIFICATION_ID_PROGRESS,
                    buildProgressNotification(percent, speedText)
                )
            }
            ACTION_COMPLETE -> {
                val fileName = intent.getStringExtra(EXTRA_FILE_NAME) ?: currentFileName
                stopForegroundCompat()
                notificationManager.notify(NOTIFICATION_ID_DONE, buildDoneNotification(fileName))
                stopSelf()
            }
            ACTION_STOP -> {
                stopForegroundCompat()
                notificationManager.cancel(NOTIFICATION_ID_DONE)
                stopSelf()
            }
        }
        return START_NOT_STICKY
    }

    override fun onDestroy() {
        isRunning = false
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    private fun buildProgressNotification(percent: Int, speedText: String): Notification {
        val contentText = if (speedText.isNotEmpty()) "$percent% · $speedText" else "$percent%"
        return NotificationCompat.Builder(this, CHANNEL_PROGRESS_ID)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(currentFileName.ifEmpty { getString(R.string.notification_converting) })
            .setContentText(contentText)
            .setProgress(100, percent, false)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setContentIntent(buildTapIntent())
            .build()
    }

    private fun buildDoneNotification(fileName: String): Notification {
        return NotificationCompat.Builder(this, CHANNEL_DONE_ID)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(getString(R.string.notification_done_title))
            .setContentText(fileName)
            .setStyle(NotificationCompat.BigTextStyle()
                .setSummaryText(getString(R.string.notification_done_tap)))
            .setAutoCancel(true)
            .setPriority(NotificationCompat.PRIORITY_DEFAULT)
            .setContentIntent(buildTapIntent())
            .build()
    }

    private fun buildTapIntent(): PendingIntent =
        PendingIntent.getActivity(
            this,
            0,
            Intent(this, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_REORDER_TO_FRONT or Intent.FLAG_ACTIVITY_SINGLE_TOP
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

    @Suppress("DEPRECATION")
    private fun stopForegroundCompat() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            stopForeground(true)
        }
    }
}
