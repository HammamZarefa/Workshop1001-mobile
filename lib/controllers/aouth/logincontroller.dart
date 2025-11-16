import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Logincontroller extends GetxController {
  gotohome();
  gotoforgetpassword();
  changepoksRemamberme();
  gotosinup();
}

class LogincontrollerImp extends Logincontroller {
  bool remamber = true;

  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  changepoksRemamberme() {
    if (remamber == false) {
      remamber = true;

      update();
    } else if (remamber == true) {
      remamber = false;
      update();
    } else
      () {
        remamber = false;
        update();
      };
  }

  @override
  gotoforgetpassword() {}

  @override
  gotohome() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      print("valied");
    } else {
      print("Not valied");
    }
  }

  @override
  gotosinup() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    remamber;
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
