package com.cromac.project_k

import io.flutter.embedding.android.FlutterActivity
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.ContentResolver
import android.graphics.Color
import android.graphics.RenderEffect
import android.graphics.Shader
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsetsController
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsControllerCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity(){

 private val CHANNEL = "project_k_notification";

     override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "createNotificationChannel" -> {
                    val argData = call.arguments as HashMap<String, String>
                    val completed = createNotificationChannel(argData)
                    if (completed) result.success(true) else result.error("Error", "Channel creation failed", null)
                }
                
                else -> result.notImplemented()
            }
        }
    }

     // 🔔 Notification channel
    private fun createNotificationChannel(mapData: HashMap<String, String>): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val id = mapData["id"] ?: return false
            val name = mapData["name"] ?: return false
            val descriptionText = mapData["description"] ?: ""

            val importance = NotificationManager.IMPORTANCE_HIGH
            val mChannel = NotificationChannel(id, name, importance)
            mChannel.description = descriptionText

            val soundUri = Uri.parse(
                "${ContentResolver.SCHEME_ANDROID_RESOURCE}://${applicationContext.packageName}/raw/notification_sound"
            )
            val att = AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_NOTIFICATION)
                .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                .build()
            mChannel.setSound(soundUri, att)

            val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(mChannel)
            return true
        }
        return false
    }
}
