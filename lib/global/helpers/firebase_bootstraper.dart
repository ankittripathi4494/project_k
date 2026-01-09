import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/web.dart';
import 'package:project_k/global/helpers/notification_service.dart';

NotificationService notificationService = NotificationService();

@pragma('vm:entry-point')
class FirebaseBootstraper {
  static bool _initialized = false;
  static AudioPlayer player = AudioPlayer();

  @pragma('vm:entry-point')
  static Future<void> ensureInitialized() async {
    if (_initialized) return;

    try {
      await Firebase.initializeApp();
      await FirebaseMessaging.instance.subscribeToTopic('retailer');

      // App In Foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        Logger().e('Foreground message Title: ${message.notification?.title}');
        Logger().e('Foreground message Body: ${message.notification?.body}');

        int id = Random().nextInt(1678877);
        final title = message.notification?.title;
        final body = message.notification?.body;
        notificationService.flutterLocalNotificationsPlugin.show(
          id,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              notificationService.channel.id,
              notificationService.channel.name,
              channelDescription: notificationService.channel.description,
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
            ),
          ),
        );
      });

      FirebaseMessaging.onMessageOpenedApp.listen((
        RemoteMessage message,
      ) async {
        Logger().e('Foreground message Title: ${message.notification?.title}');
        Logger().e('Foreground message Body: ${message.notification?.body}');
        Logger().e(message.data);
        int id = Random().nextInt(1678877);
        final title = message.notification?.title;
        final body = message.notification?.body;
        notificationService.flutterLocalNotificationsPlugin.show(
          id,
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              notificationService.channel.id,
              notificationService.channel.name,
              channelDescription: notificationService.channel.description,
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
            ),
          ),
        );
      });

      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      _initialized = true;
      Logger().e("🔥 Firebase initialized successfully");
    } catch (e) {
      Logger().e("Firebase init retry failed: $e");
    }
  }

  static Future<void> setupFlutterNotifications() async {
    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await notificationService.flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(notificationService.channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // APP in Terminated or in Background
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    await setupFlutterNotifications();

    Logger().e('Background message: ${message.notification?.title}');
    Logger().e(message.data);
    int id = Random().nextInt(1678877);
    final title = message.notification?.title;
    final body = message.notification?.body;
    notificationService.flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          notificationService.channel.id,
          notificationService.channel.name,
          channelDescription: notificationService.channel.description,
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
    );
    // Logger().e();
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    Logger().e('Handling a background message ${message.messageId}');
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      Logger().e("On Messsage Opened Click app");

      Logger().e(message.data.toString());
      Logger().e(
        message.data.containsKey("Command") ? "Command hai" : "Command nhi hai",
      );
      Logger().e('Foreground message Title: ${message.notification?.title}');
      Logger().e('Foreground message Body: ${message.notification?.body}');
      Logger().e(message.data);
      int id = Random().nextInt(1678877);
      final title = message.notification?.title;
      final body = message.notification?.body;
      notificationService.flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            notificationService.channel.id,
            notificationService.channel.name,
            channelDescription: notificationService.channel.description,
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
        ),
      );
    });
  }
}
