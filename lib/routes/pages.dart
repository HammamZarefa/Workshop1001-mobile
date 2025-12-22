import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/Auth/complete_profile.dart';
import 'package:coda_workshop/screens/Auth/forgot_password.dart';
import 'package:coda_workshop/screens/Auth/otp_verification.dart';
import 'package:coda_workshop/screens/Auth/Loginscreen.dart';
import 'package:coda_workshop/screens/Auth/signUp.dart';
import 'package:coda_workshop/screens/Auth/successful_signin.dart';
import 'package:coda_workshop/screens/favorite_screen.dart';
import 'package:coda_workshop/screens/home/popularProuduct.dart';
import 'package:coda_workshop/screens/home/spacialProduct.dart';
import 'package:coda_workshop/screens/mainScreen.dart';
import 'package:coda_workshop/screens/onboarding_screen.dart';
import 'package:coda_workshop/screens/home/home.dart';
import 'package:coda_workshop/screens/prodoctes_screen.dart';
import 'package:coda_workshop/screens/productDetails/productDetails.dart';
import 'package:coda_workshop/screens/profial/MyAccount.dart';
import 'package:coda_workshop/screens/profial/profile_Screen.dart';
import 'package:coda_workshop/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.homeScreen,
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
    name: AppRoutes.signUp,
    page: () => SignUp(),
  ),
  
  GetPage(
    name: AppRoutes.mainScreen,
    page: () => MainScreen(),
  ),




   


   GetPage(
    name: AppRoutes.completeProfile,
    page: () =>  CompletProfile(),
  ),




   GetPage(
    name: AppRoutes.forgotPassword,
    page: () =>  ForgotPassword(),
  ),



 GetPage(
    name: AppRoutes.otpVerification,
    page: () =>  OtpVerification(),
  ),



 GetPage(
    name: AppRoutes.successfulSignIn,
    page: () =>  SuccessfulSignIn(),
  ),



 GetPage(
    name: AppRoutes.productsScreen,
    page: () =>  ProductsScreen(),
  ),


 GetPage(
    name: AppRoutes.favoritesScreen,
    page: () => FavoritesScreen(),
  ),







 GetPage(
    name: AppRoutes.productDetailsScreen,
    page: () => ProductDetails(),
  ),




 GetPage(
    name: AppRoutes.profileScreen,
    page: () => ProfileScreen(),
  ),


 GetPage(
    name: AppRoutes.myAccountScreen,
    page: () => MyAccountScreen(),
  ),

GetPage(
    name: AppRoutes.spacialProducts,
    page: () => SpacialProducts(),
  ),
  GetPage(
    name: AppRoutes.popularProducts,
    page: () => PopularProducts(),
  ),




];

