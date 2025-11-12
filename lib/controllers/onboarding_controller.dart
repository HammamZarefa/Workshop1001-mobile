import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/onboardingModel.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  // final myServices = Get.find<sharedPref>();

  final PageController pageController = PageController();
  GetStorage box = GetStorage();
  late int pageCount = pages.length;
  int currentpage = 0;
  RxString button_title = 'Next'.obs;
  List<onboardingModel> pages = [
    onboardingModel(
        image: imageAssets.logo, title: "Welcome to CODA App, Let's shop"),
    onboardingModel(
        image: imageAssets.logo,
        title:
            "We help people conect with store around Unated State of Swaida"),
    onboardingModel(image: imageAssets.logo, title: "title3"),
  ];
  Future<void> next() async {
    ;
    if (currentpage < pageCount - 1) {
      pageController.animateToPage(currentpage + 1,
          duration: Duration(milliseconds: 20), curve: Curves.easeInOut);
      currentpage++;
      textbutton();
      update();
    } else {
      //  await myServices.sharedPreferences.setBool('onboarding_done', true);

      gotohome();
    }

    update();
  }

  gotohome() {
    box.write( "isOnboardinrShow", true);
    Get.offAllNamed(AppRoutes.homescreen);
  }

  textbutton() {
    currentpage < pageCount - 1
        ? button_title.value = "Next"
        : button_title.value = "Containue";
  }

  @override
  void onInit() {
    currentpage;
    button_title;
    // TODO: implement onInit
    super.onInit();
  }
}
