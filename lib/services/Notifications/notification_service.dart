import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coda_workshop/controllers/notification_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
      final NotificationController controller = Get.put(NotificationController());

  Future<void> init() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'high_channel',
          channelName: 'High Priority',
          channelDescription: 'Channel for important notifications',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          ledColor: Colors.white,
        )
      ],
    );
  }

  Future<void> showLocalNotification(String title, String body) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        channelKey: 'high_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
        controller.addNotification(title, body);

    // String? token = await FirebaseMessaging.instance.getToken();
    // print("📱 FCM Token: $token");
  }

  Future<void> handleFCM(RemoteMessage message) async {
    final title = message.notification?.title ?? message.data['title'] ?? '';
    final body = message.notification?.body ?? message.data['body'] ?? '';

    // local notification
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        channelKey: 'high_channel',
        title: title,
        body: body,
      ),
    );
    print(body);

    controller.addNotification(title, body);
  }

  Future<void> initializeFCM() async {
    // permission
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String? token = await _messaging.getToken();
    print(" FCM Token: $token");
    print("🔔 Notification permission: ${settings.authorizationStatus}");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(" Foreground message: ${message.notification?.title}");
      handleFCM(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(" User opened the app from notification");
      handleFCM(message);
    });

    RemoteMessage? initialMsg = await _messaging.getInitialMessage();
    if (initialMsg != null) {
      print(" App opened from terminated state");
      handleFCM(initialMsg);
    }
  }
}

// Background handler
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      channelKey: 'high_channel',
      title: message.notification?.title ?? message.data['title'] ?? '',
      body: message.notification?.body ?? message.data['body'] ?? '',
    ),
  );
}
