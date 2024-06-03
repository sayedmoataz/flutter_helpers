import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  String? token = '';

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initialNotification() async {
    getToken();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification,
      onDidReceiveNotificationResponse: onSelectNotification,
      // onDidReceiveBackgroundNotificationResponse: onSelectNotification,
    );

    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Map data = message.data;

      if (message.notification != null) {
        showNotification(
          message.notification!.title!,
          message.notification!.body!,
          data.toString(),
        );
      }
    });
  }

  Future onSelectNotification(
      NotificationResponse notificationResponse) async {}

  void showNotification(String title, String body, String payload) async {
    await _demoNotification(title, body, payload);
  }

  Future<void> _demoNotification(
      String title, String body, String payload) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel_ID',
      'channel name',
      // 'channel description',
      importance: Importance.max,
      playSound: true,
      showProgress: true,
      priority: Priority.high,
      ticker: 'test ticker',
    );

    var iOSChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future<String?> getToken() async {
    firebaseMessaging.subscribeToTopic('all');

    token = await firebaseMessaging.getToken();
    log('getToken $token');

    return token;
  }
}
