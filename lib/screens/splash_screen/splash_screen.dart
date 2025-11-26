import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/ImageAssets.dart';
import 'package:coda_workshop/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          ImageAssets.logo,
          height: Get.height * 0.2,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "CODA",
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
