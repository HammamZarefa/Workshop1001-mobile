import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/Auth/Complete_profile.dart';
import 'package:coda_workshop/screens/Auth/Forgot_password.dart';
import 'package:coda_workshop/screens/Auth/Otp_Verification.dart';
import 'package:coda_workshop/screens/Auth/Loginscreen.dart';
import 'package:coda_workshop/screens/Auth/signUp.dart';
import 'package:coda_workshop/screens/Auth/sucssful_Sinin.dart';
import 'package:coda_workshop/screens/favorite_screen.dart';
import 'package:coda_workshop/screens/mainScreen.dart';
import 'package:coda_workshop/screens/onboarding_screen.dart';
import 'package:coda_workshop/screens/home/home.dart';
import 'package:coda_workshop/screens/prodoctes_screen.dart';
import 'package:coda_workshop/screens/productDetails/productDetails.dart';
import 'package:coda_workshop/screens/profial/MyAccount.dart';
import 'package:coda_workshop/screens/profial/profail_Screen.dart';

import 'package:coda_workshop/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.homescreen,
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
    page: () => LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.SinUp,
    page: () => SignUp(),
  ),
  
  GetPage(
    name: AppRoutes.mainScreen,
    page: () => MainScreen(),
  ),




   


   GetPage(
    name: AppRoutes.Complet_profile,
    page: () =>  CompletProfile(),
  ),




   GetPage(
    name: AppRoutes.Forget_password,
    page: () =>  ForgotPassword(),
  ),



 GetPage(
    name: AppRoutes.Otp_Vierification,
    page: () =>  OtpVerification(),
  ),



 GetPage(
    name: AppRoutes.SucssfulSinin,
    page: () =>  SuccessfulSignIn(),
  ),



 GetPage(
    name: AppRoutes.ProdoctesScreen,
    page: () =>  ProductsScreen(),
  ),


 GetPage(
    name: AppRoutes.FavoritesScreen,
    page: () => FavoritesScreen(),
  ),







 GetPage(
    name: AppRoutes.ProductDetails_Screen,
    page: () => ProductDetails(),
  ),




 GetPage(
    name: AppRoutes.ProfailScreen,
    page: () => ProfailScreen(),
  ),


 GetPage(
    name: AppRoutes.MyAccountScreen,
    page: () => MyAccountScreen(),
  ),






];

