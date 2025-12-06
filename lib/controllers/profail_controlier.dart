import 'dart:io';
import 'package:coda_workshop/routes/routes.dart';

import 'package:coda_workshop/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ProfileService service = ProfileService();

  RxString profileImageUrl = "".obs;
  GetStorage box = GetStorage();
  Future<void> pickAndUploadImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        var response = await service.postImageProfileData(imageFile);

        if (response != null &&
            response["data"] != null &&
            response["data"]["profile_image"] != null) {
          profileImageUrl.value = response["data"]["profile_image"];

          print("UPDATED IMAGE URL => ${profileImageUrl.value}");

          Get.snackbar(
            "Success",
            "Profile image updated successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "Failed to upload image",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      print("ProfileController image upload error: $e");
      Get.snackbar(
        "Error",
        "An error occurred while uploading the image",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void gotoMyAccount() {
    Get.toNamed(AppRoutes.MyAccountScreen);
  }

  Future LogoutProfile() async {
    try {
      var response = await ProfileService().PostlogoutData();

      if (response != null) {
        if (response["message"] != null) {
          box.remove("token");

          Get.offAllNamed(AppRoutes.login);

          Get.snackbar(
            "Success",
            response["message"] ?? "Logged out successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      print("Logout error: $e");
    }
  }
}
