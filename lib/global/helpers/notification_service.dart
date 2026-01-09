import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  
    // Singleton pattern implementation
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();


  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); // object to show notification on device

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'project_k_notification', // id
    'High Importance Notifications', // title
    ledColor: Color.fromARGB(255, 48, 20, 97),
    importance: Importance.max, // 🔥 MUST be max
    playSound: true,
    sound: RawResourceAndroidNotificationSound('notification_sound'),
    enableLights: true,
  );
  
  Future<void> init() async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()?.createNotificationChannel(channel);
    // Initialize settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');


    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: callOnFrontNotification,
    );
  }

   Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          icon: "@drawable/logo",

          // other properties...
          enableVibration: true,
          enableLights: true,
          colorized: true,
          color: Colors.deepPurple,
          playSound: true,
        );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      
    );

    // RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.pendingNotificationRequests()
        .then((value) => value.any((element) => element.id == id))
        .then((v5) {
          if (v5) {
            // Cancel the existing notification
            flutterLocalNotificationsPlugin.cancelAll();
          }
          flutterLocalNotificationsPlugin.show(
            id,
            title,
            body,
            platformChannelSpecifics,
            payload: payload,
          );
        })
        .catchError((vx5) {
          print("The notification Error $vx5");
        });
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

}