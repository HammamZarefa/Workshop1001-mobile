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
  login() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      return "valid";
    } else {
      return "not valoid";
    }
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

  goToForgetPassword() {}

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
