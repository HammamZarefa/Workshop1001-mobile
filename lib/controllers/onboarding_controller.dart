import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/onboardingModel.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  GetStorage box = GetStorage();
  late int pageCount = pages.length;
  int currentpage = 0;
  RxString button_title = 'Next'.obs;
  List<onboardingModel> pages = [
    onboardingModel(
      title: "CODA",
      subtitle: "Welcome to CODA! Start your shopping journey",
      description:
          "Discover amazing stores and products around you. Let’s make shopping fun and easy!",
      image: imageAssets.logo,
    ),
    onboardingModel(
      title: "CODA",
      subtitle: "Find the best stores near you",
      description:
          "We help people connect with local stores across the United States, so you never miss a deal!",
      image: imageAssets.logo,
    ),
    onboardingModel(
      title: "CODA",
      subtitle: "Enjoy seamless shopping experience",
      description:
          "Track your orders, explore new products, and enjoy a hassle-free shopping experience with CODA.",
      image: imageAssets.logo,
    ),
  ];
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
    box;
    currentpage;
    button_title;
    // TODO: implement onInit
    super.onInit();
  }
}
