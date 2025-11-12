import 'dart:async';
import 'package:coda_workshop/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();
  Timer get time => Timer(
        Duration(seconds: 5),
        () => splashTimer(),
      );
  splashTimer() {
    bool isShow = box.read("isOnboardinrShow");
    isShow == false
        ? Get.offNamed(AppRoutes.onboarding)
        : Get.offNamed(AppRoutes.homescreen);
    update();
  }

  @override
  void onInit() {
    // splashTimer();
    time;
    super.onInit();
  }
}
