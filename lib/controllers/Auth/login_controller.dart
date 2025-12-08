import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/Auth/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  bool tick = false;
  bool isShow = false;
  String? hintemail;

  String? hintpassword;
  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  GetStorage box = GetStorage();
  validate() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      box.write('email', email!.text);
      box.write('password', password!.text);
      login();
    } else {
      return "not valid";
    }}
   


   
 Future login() async {
    try {
      var response =
          await LogInServive().postLogInData(email!.text, password!.text);
      if (response != null) {
        if ((response["token"] != null)) {
          box.write("token", response["token"]);
          Get.offAllNamed(AppRoutes.mainScreen);
        } else {
          Get.snackbar("Error", response["message"] ?? "Unknown error");
        }
      } else {
        Get.snackbar("Error", "Server error");
      }
    } catch (e) {}
  }






  gotoSignup() {
    Get.toNamed(AppRoutes.signUp);
  }

  rememberMeTick() {
    if (box.read("tick") == true) {
      box.write("tick", false);
      email = TextEditingController();
      password = TextEditingController();

      update();
    } else if (box.read("tick") == false) {
      box.write("tick", true);
      hintpassword = box.read('password');
      hintemail = box.read('email');
      email = TextEditingController(text: hintemail);
      password = TextEditingController(text: hintpassword);
      update();
    } else {
      box.write("tick", true);
      update();
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

Get.toNamed(AppRoutes.forgotPassword);

  }






  @override
  void onInit() {
    hintpassword = box.read('password');
    hintemail = box.read('email');
    email = box.read("tick") == true
        ? TextEditingController(text: hintemail)
        : TextEditingController();
password = box.read("tick") == true
        ? TextEditingController(text: hintpassword)
        : TextEditingController();   
         tick = box.read("tick") ?? false;
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

 

