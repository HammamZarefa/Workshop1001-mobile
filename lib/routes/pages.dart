import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/Auth/Complet_profieal.dart';
import 'package:coda_workshop/screens/Auth/Forget_password.dart';
import 'package:coda_workshop/screens/Auth/Otp_vierification.dart';
import 'package:coda_workshop/screens/Auth/loginScreen.dart';
import 'package:coda_workshop/screens/Auth/signUp.dart';
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
    page: () => onpoardingScreen(),
    binding: BindingsBuilder(() {
      Get.put(OnboardingController());
    }),
  ),


   GetPage(
    name: AppRoutes.login,
    page: () =>  loginscreen(),
  ),




   GetPage(
    name: AppRoutes.SinUp,
    page: () =>  SinUp(),
  ),



   GetPage(
    name: AppRoutes.Complet_profile,
    page: () =>  CompletProfile(),
  ),




   GetPage(
    name: AppRoutes.Forget_password,
    page: () =>  Forget_password(),
  ),



 GetPage(
    name: AppRoutes.Otp_Vierification,
    page: () =>  OtpVierification(),
  ),





];
