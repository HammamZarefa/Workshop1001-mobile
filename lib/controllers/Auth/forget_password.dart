import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/forgotpassword_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordcontroller extends GetxController {
  
  TextEditingController? email;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
 
 
 
 
   validate_forgetpassword() {



  validate_forgotpassword() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      Forget_password();
    }
  }
   }
  Future Forget_password() async {
    try {
      var response =
          await ForgotpasswordService().postForgotpasswordData(email!.text);

       if (response != null) {
      if ((response["token"] != null)) {
    
         Get.offNamed(
            AppRoutes.otpVerification,
            arguments: {"email": email!.text},
          );
        } else {
          Get.snackbar("Error", response["message"] ?? "Unknown error");
        }
      } else {
        Get.snackbar("Error", "Server error");
      }
    } catch (e) {}
  }



 goToSignUp() {

Get.toNamed(AppRoutes.signUp);

 }

 goToHome() {

Get.toNamed(AppRoutes.homeScreen);

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
