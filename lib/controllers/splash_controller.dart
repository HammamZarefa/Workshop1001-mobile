import 'package:coda_workshop/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
@override
  void onInit() {
    super.onInit();
    splashscreenwait();}

}

void splashscreenwait() {
Future.delayed(Duration(seconds: 2)); 
    Get.off(()=>HomeScreen());
  }

