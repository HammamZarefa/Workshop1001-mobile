import 'package:coda_workshop/routes/routes.dart';

import 'package:coda_workshop/services/Otp_vierification_service.dart';
import 'package:coda_workshop/services/Resendverification_service.dart';

import 'package:get/get.dart';

class VierificationController extends GetxController {
  late String otp;

  late String email;

  Future goToSussifulSignUp() async {
    if (otp.isEmpty) {
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
      } catch (e) {}
    }

    @override
    void onInit() {
      email = Get.arguments?['email'] ?? "";
      // TODO: implement onInit
      super.onInit();
    }

    Future resendVerificationCode() async {
      try {
        var response =
            await ResendVerificationService().postResendverificationData(email);

        if (response != null) {
          if ((response["token"] != null)) {
            Get.offNamed(
              AppRoutes.homeScreen,
            );
          } else {
            Get.snackbar("Error", response["message"] ?? "Unknown error");
          }
        } else {
          Get.snackbar("Error", "Server error");
        }
      } catch (e) {}
    }

    update();
  }
}
