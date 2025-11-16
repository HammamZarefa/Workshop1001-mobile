



import 'dart:async';

import 'package:coda_workshop/routes/routes.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController{







 void gotohome(){


 
    Timer(const Duration(seconds: 5), () => Get.offNamed(AppRoutes.onbordingscreen));


 }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      gotohome();
  }





}
