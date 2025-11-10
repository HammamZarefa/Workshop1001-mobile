import 'package:get/get.dart';

class SplashController extends GetxController {


}

void splashscreenwait() {
Future.delayed(Duration(seconds: 2)); 
    Get.offNamed('/Homescreen');
  }

