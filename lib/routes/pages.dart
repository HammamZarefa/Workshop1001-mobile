import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/Auth/completeSignup.dart';
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
    page: () =>  homeScreen(),
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
    page: () => loginscreen(),
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => Signup(),
  ),
  GetPage(
    name: AppRoutes.completeSignup,
    page: () => completeSignup(),
  ),
];
