import 'package:coda_workshop/routes/routes.dart';


import 'package:coda_workshop/services/Otp_vierification_service.dart';
import 'package:coda_workshop/services/Resendverification_service.dart';

import 'package:get/get.dart';


class VierificationController extends GetxController {
  late String otp;

  late String email;

  Future gotosussifulsinup() async {
    if (otp.isEmpty) {
      // Get.defaultDialog(
      //   title: "تنبيه",
      //   middleText: "يرجى إدخال رمز التحقق قبل المتابعة.",
      // );
      

      try {
        var response = await OtpVierificationService().postOtpvierificaionData(email, otp);



        if (response != null) {
          if ((response["token"] != null)) {
            Get.offNamed(AppRoutes.SucssfulSinin );
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

     Future      resendVerificationCode() async {



      try {
        var response = await ResendverificationService().postResendverificationData(email);



        if (response != null) {
          if ((response["token"] != null)) {
            Get.offNamed(AppRoutes.homescreen, );
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

