import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/Auth/signApp_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class signUpController extends GetxController {
  bool isShow = false;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? repassword;
  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? phone;
  TextEditingController? address;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> completeForm = GlobalKey<FormState>();

  GetStorage box = GetStorage();

  validateSignup() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.toNamed(AppRoutes.completeSignup);
    }
  }

  validateSignupComplete() {
    var formdata = completeForm.currentState;
    if (formdata!.validate()) {
      signup();
    }
  }

  Future signup() async {
    try {
          print("=== VALUES FROM CONTROLLERS ===");
    print("email: ${email!.text}");
    print("password: ${password!.text}");
    print("repassword: ${repassword!.text}");
    print("firstName: ${firstName!.text}");
    print("lastName: ${lastName!.text}");
    print("phone: ${phone!.text}");
    print("address: ${address!.text}");
    print("================================");
      var response = await signUpServive().postSignUpData(
        email!.text,
        password!.text,
        repassword!.text,
        firstName!.text,
        lastName!.text,
        phone!.text,
        address!.text,
      );
       if (response != null) {
      if ((response["token"] != null)) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar("Error", response["message"] ?? "Unknown error");
      }
    } else {
      Get.snackbar("Error", "Server error");
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
    isShow;
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    firstName!.dispose();
    lastName!.dispose();
    phone!.dispose();
    address!.dispose();

    super.dispose();
  }
}