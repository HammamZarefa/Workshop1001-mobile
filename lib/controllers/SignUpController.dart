import 'package:coda_workshop/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class Signupcontroller extends GetxController {
final email=TextEditingController();
final password=TextEditingController();
final confirmPassword=TextEditingController();
final firstname=TextEditingController();
final lastname=TextEditingController();
final phone=TextEditingController();
final address=TextEditingController();

var isloading =false.obs;

final AuthService _service = AuthService();


Future<void> signUp() async {
  isloading.value = true;

  bool success = await _service.signUp(
       email.value, password.value,_service,confirmPassword.value, firstname.value, lastname.value, phone.value, address.value);

  isloading.value = false;

  if (success) {
    Get.snackbar("Success", "Account Created!");
  } else {
    Get.snackbar("Error", "Signup failed");
  }
}
  @override
  void onClose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    firstname.dispose();
    lastname.dispose();
    phone.dispose();
    address.dispose();
    super.onClose();
  }
}