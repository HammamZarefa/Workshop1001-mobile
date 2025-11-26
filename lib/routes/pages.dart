import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/Auth/Complet_profieal.dart';
import 'package:coda_workshop/screens/Auth/Forget_password.dart';
import 'package:coda_workshop/screens/Auth/Otp_vierification.dart';
import 'package:coda_workshop/screens/Auth/completeSignup.dart';
import 'package:coda_workshop/screens/Auth/Loginscreen.dart';
import 'package:coda_workshop/screens/Auth/signUp.dart';
import 'package:coda_workshop/screens/Auth/sucssful_Sinin.dart';
import 'package:coda_workshop/screens/favorite_screen.dart';
import 'package:coda_workshop/screens/home/productsCategores.dart';
import 'package:coda_workshop/screens/mainScreen.dart';
import 'package:coda_workshop/screens/onboarding_screen.dart';
import 'package:coda_workshop/screens/home/home.dart';
import 'package:coda_workshop/screens/prodoctes_screen.dart';
import 'package:coda_workshop/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.HomeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.onboarding,
    page: () => OnpoardingScreen(),
    binding: BindingsBuilder(() {
      Get.put(OnboardingController());
    }),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => Loginscreen(),
  ),
  GetPage(
    name: AppRoutes.SinUp,
    page: () => Signup(),
  ),
GetPage(
  name: AppRoutes.productsCategores,
  page: () => ProductsByCategoryScreen(
    categoryId: Get.arguments['id'],
    categoryName: Get.arguments['name'],
  ),
),

  GetPage(
    name: AppRoutes.mainScreen,
    page: () => MainScreen(),
  ),




   GetPage(
    name: AppRoutes.SinUp,
    page: () =>  Signup(),
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
    name: AppRoutes.OtpVierification,
    page: () =>  OtpVierification(),
  ),



 GetPage(
    name: AppRoutes.SucssfulSinin,
    page: () =>  SucssfulSinin(),
  ),



 GetPage(
    name: AppRoutes.ProdoctesScreen,
    page: () =>  ProductsScreen(),
  ),


 GetPage(
    name: AppRoutes.FavoritesScreen,
    page: () => FavoritesScreen(),
  ),

];
