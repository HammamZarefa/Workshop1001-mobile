import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/Auth/Forget_password.dart';
import 'package:coda_workshop/services/Login_Service.dart';
import 'package:coda_workshop/services/forgotpassword_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ForgotPasswordcontroller extends GetxController {
  
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
      var response = await ForgotpasswordService().postForgotpasswordData(email!.text);

       if (response != null) {
      if ((response["token"] != null)) {
    
         Get.offNamed(
            AppRoutes.Otp_Vierification,
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



 goTosibup() {

Get.toNamed(AppRoutes.SinUp);

 }

 goTohome() {

Get.toNamed(AppRoutes.homescreen);

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
