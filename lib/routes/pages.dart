import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/aouth/login/screenlogin.dart';
import 'package:coda_workshop/screens/home/homescreen.dart';
import 'package:coda_workshop/screens/onbording/onbordingscreen.dart';
import 'package:coda_workshop/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const SplashScreen(),
  ),


  GetPage(
    name: AppRoutes.homescreen,
    page: () => const Homescreen(),
  ),




  GetPage(
    name: AppRoutes.onbordingscreen,
    page: () => const Onbordingscreen(),
  ),



  GetPage(
    name: AppRoutes.screenlogin,
    page: () => const Screenlogin(),
  ),



];
