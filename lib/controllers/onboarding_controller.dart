import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/onboardingModel.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/obnboafding_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  GetStorage box = GetStorage();
  late int pageCount = pages.length;
  int currentpage = 0;
  RxString button_title = 'Next'.obs;
  List<responceModelData> pages = [
   
  ];

  Future<OnBoardingModel> getOndoardingData() async {
    try {
      var res = await ObnboardingService().getOnboarging();
      pages = res.data!;
      pageCount=pages.length;
      update();
    } catch (e) {}
          return OnBoardingModel();

  }
  Future<void> next() async {
    if (currentpage < pageCount - 1) {
      pageController.animateToPage(currentpage + 1,
          duration: Duration(milliseconds: 20), curve: Curves.easeInOut);
      currentpage++;
      textbutton();
      update();
    } else {
      gotologin();
    }

    update();
  }

  gotologin() {
    box.write("isOnboardinrShow", true);
    Get.offAllNamed(AppRoutes.login);
  }

  textbutton() {
    currentpage < pageCount - 1
        ? button_title.value = "Next"
        : button_title.value = "Containue";
  }

  @override
  void onInit() {
    getOndoardingData();
    box;
    currentpage;
    button_title;
    // TODO: implement onInit
    super.onInit();
  }
}
