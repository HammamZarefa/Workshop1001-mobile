import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/Login_Service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  bool tick = false;
  bool isShow = false;
  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GetStorage box = GetStorage();
 
 
 
   validate_login() {



    var formdata = formState.currentState;
    if (formdata!.validate()) {
     login();
    }
     
   


  }


Future login() async {
    try {
      var response = await LoginService().postLoginData(
        email!.text,
        password!.text,
      


      );
       if (response != null) {
      if ((response["token"] != null)) {
    
        
         Get.offNamed(AppRoutes.homescreen, arguments: {
            "email": email?.text,
            "token": response["token"],});
        
        
        
        

      } else {
        Get.snackbar("Error", response["message"] ?? "Unknown error");
      }
    } else {
      Get.snackbar("Error", "Server error");
    }
    } catch (e) {}

  
  }


  rememberMeTick() {
    if (tick == false) {
      tick = true;
      box.write(
        "remember",true
      );
      update();
    } else if (tick == true) {
      tick = false;
box.write(
        "remember",false
      );
      update();
    } else {
      tick = false;
    }
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

  goToForgetPassword() {

Get.toNamed(AppRoutes.Forget_password);

  }

 goTosibup() {

Get.toNamed(AppRoutes.SinUp);

 }




  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    tick;
    isShow;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }
}
