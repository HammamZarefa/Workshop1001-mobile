import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/forgotpassword_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordcontroller extends GetxController {
  
  TextEditingController? email;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
 
 
 
 
  



  validate_forgotpassword() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      Forget_password();
    }
  }
   Future Forget_password() async {
  try {
    var response =
        await ForgotpasswordService().postForgotpasswordData(email!.text);

    if (response != null) {
      Get.offNamed(
        AppRoutes.otpVerification,
        arguments: {"email": email!.text},
      );

      Get.snackbar("Success", response["message"]);
    } else {
      Get.snackbar("Error", "Server error");
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
}

 

 goToSignUp() {

Get.toNamed(AppRoutes.signUp);

 }







  @override
  void onInit() {
    email = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();

    super.dispose();
  }
}
