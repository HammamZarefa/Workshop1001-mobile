import 'package:coda_workshop/models/MyAccount_Model.dart';
import 'package:coda_workshop/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyAccountController extends GetxController {
  // Text Controllers
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumper = TextEditingController();
  TextEditingController locition = TextEditingController();

  GlobalKey<FormState> MyAccount = GlobalKey<FormState>();

  ModelMyAccount? accountData;
  bool isLoading = true;

  @override
  void onInit() {
    getMyAccountData();
    super.onInit();
  }

  Future<void> getMyAccountData() async {
    try {
      isLoading = true;
      update();

      accountData = await ProfileService().getmyaccount();

      if (accountData != null && accountData!.data != null) {
        firstName.text = accountData!.data!.firstName ?? "";
        lastName.text = accountData!.data!.lastName ?? "";
        email.text = accountData!.data!.email ?? "";
        phonenumper.text = accountData!.data!.phone ?? "";
        locition.text = accountData!.data!.address ?? "";
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
    }
  }

  
  Future<void> updateAccount() async {
    if (!MyAccount.currentState!.validate()) return;

    try {
      var res = await ProfileService().updateAccount(
        firstName.text,
        lastName.text,
        email.text,
        phonenumper.text,
        locition.text,
      );

      Get.snackbar("Success", "Account updated successfully");

    } catch (e) {
      Get.snackbar("Error", "Failed to update account");
    }
  }
}