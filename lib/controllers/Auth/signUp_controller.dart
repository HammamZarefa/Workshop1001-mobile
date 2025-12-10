import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/Auth/signApp_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpController extends GetxController {
  bool isShow = false;
TextEditingController? email;
TextEditingController? password;
TextEditingController? passwordConfirmation;
TextEditingController? firstName;
TextEditingController? lastName;
TextEditingController? phoneNumber;
TextEditingController? location;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> completeForm = GlobalKey<FormState>();

//   GetStorage box = GetStorage();

  validateSignup() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.toNamed(AppRoutes.completeProfile);
    }
  }

  validateSignupComplete() {
    var formdata = completeForm.currentState;
    if (formdata!.validate()) {
      signup()    ;     
    }
  }

  Future signup() async {
    try {
      var response = await SignUpServive().postSignUpData(
        email!.text,
        password!.text,
       passwordConfirmation!.text,
        firstName!.text,
        lastName!.text,
        phoneNumber!.text,
        location!.text,
      );
      if (response != null) {
       



          Get.offAllNamed(AppRoutes.homeScreen);


    
      }
    } catch (e) {}
  }

  showPassword() {
    if (isShow == false) {
      isShow = true;
      update();
    } else if (isShow == true) {
      isShow = false;
      update();
    }

    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    phoneNumber = TextEditingController();
    location = TextEditingController();
    isShow;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    passwordConfirmation!.dispose();
    firstName!.dispose();
    lastName!.dispose();
    phoneNumber!.dispose();
    location!.dispose();

    super.dispose();
  }
}
