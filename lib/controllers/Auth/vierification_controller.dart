import 'package:coda_workshop/routes/routes.dart';

import 'package:coda_workshop/services/Otp_vierification_service.dart';
import 'package:coda_workshop/services/Resendverification_service.dart';

import 'package:get/get.dart';

class VierificationController extends GetxController {
  late String otp;

  late String email;

  @override
  void onInit() {
    email = Get.arguments?['email'] ?? "";
    super.onInit();
  }

  Future goToSuccessfulSignUp() async {
    if (otp.isNotEmpty) {
      try {
        var response =
            await OtpVierificationService().postOtpvierificaionData(email, otp);

        if (response != null) {
          if ((response["token"] != null)) {
            Get.offNamed(AppRoutes.successfulSignIn);
          } else {
            Get.snackbar("Error", response["message"] ?? "Unknown error");
          }
        } else {
          Get.snackbar("Error", "Server error");
        }
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    } else {
      Get.snackbar("Error", "Please enter the OTP");
    }
  }



 Future resendVerificationCode() async {
    try {
      var response =
          await ResendVerificationService().postResendverificationData(email);

      if (response != null) {
        Get.snackbar("Success", response["message"] ?? "Code resent successfully");
      } else {
        Get.snackbar("Error", "Server error");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}