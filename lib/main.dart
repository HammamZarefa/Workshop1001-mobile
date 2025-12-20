import 'package:coda_workshop/controllers/file%20auth_controller.dart';
import 'package:coda_workshop/routes/pages.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/Notifications/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());

  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

  await NotificationService.instance.init();
  String? token = await FirebaseMessaging.instance.getToken();
  print("📱 FCM Token: $token");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NotificationService.instance.initializeFCM();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CODA',
      initialRoute: AppRoutes.splashScreen,
      // initialRoute: AppRoutes.HomeScreen,
      getPages: pages,
    );
  }
}