import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/onboarding_screen.dart';
import 'package:coda_workshop/screens/home/home.dart';
import 'package:coda_workshop/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const SplashScreen(),
  ),
   GetPage(
    name: AppRoutes.homescreen,
    page: () => const homeScreen(),
  ),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => const onpoardingScreen(),
  ),
];
