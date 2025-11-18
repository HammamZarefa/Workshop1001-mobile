import 'dart:convert';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/onboardingModel.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/onboardingservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  GetStorage box = GetStorage();
  late int pageCount = pages.length;
  int currentpage = 0;
  RxString button_title = 'Next'.obs;
  List<OnboardingModelData> pages = [
    
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

 Future<OnboardingModel> fetchOnboardingData() async {
  try{
    var response=await OnBoardingservices().getOnboardingDate();
    pages=response.data!;
  }catch(e){
    
  }
  return OnboardingModel();
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
