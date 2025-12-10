import 'dart:io';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ProfileService service = ProfileService();

  RxString profileImageUrl = "".obs;

  final ImagePicker picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    getProfileData();
  }

  Future<void> pickImageSource() async {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from Gallery"),
              onTap: () {
                Get.back();
                pickAndUploadImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a Photo"),
              onTap: () {
                Get.back();
                pickAndUploadImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickAndUploadImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        var response = await service.postImageProfileData(imageFile);

        if (response != null &&
            response["data"] != null &&
            response["data"]["profile_image"] != null) {
          profileImageUrl.value = response["data"]["profile_image"];

          await getProfileData();

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

  Future<void> getProfileData() async {
    try {
      var response = await service.getmyaccount();

      if (
          response.data != null &&
          response.data!.profileImage != null) {
        profileImageUrl.value =
            "${response.data!.profileImage!}?t=${DateTime.now().millisecondsSinceEpoch}";

        print("PROFILE IMAGE FROM BACKEND => ${profileImageUrl.value}");
      }
    } catch (e) {
      print("Error fetching profile data: $e");
    }
  }

  void gotoMyAccount() {
    Get.toNamed(AppRoutes.myAccountScreen);
  }

  Future LogoutProfile() async {
    try {
      var response = await service.PostlogoutData();

      if (response != null) {
        if (response["message"] != null) {
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
