import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/Auth/timer_controller.dart';

import 'package:coda_workshop/controllers/Auth/vierification_controller.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';

import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';

import 'package:coda_workshop/widgets/Auth/authTitle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});
  VierificationController controller = Get.put(VierificationController());
  final TimerController timerController = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VierificationController>(
        builder: (controller) => Form(
             // key: controller.formState,
              child: Scaffold(
                backgroundColor: AppColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AppParTilte(
                        appbarTilte: "Otp Verification",
                      ),
                      AuthTitle(
                        title: "Otp Verification",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: AuthSubTitle(
                          subtitle:
                              "We sent your code to email \n This code will expired",
                        ),

                        
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 200,
                        width: 200,
                        child: OtpTextField(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 3,
                          ),
                          fieldWidth: Get.width * 0.17,
                          // fieldHeight: Get.height*0.10,
                          borderRadius: BorderRadius.circular(18),
                          numberOfFields: 4,
                          contentPadding: EdgeInsets.all(5),

                          borderColor: Colors.black,
                          // enabledBorderColor: Colors.black,
                          filled: true,
                          //  fillColor: Colors.black,
                          showFieldAsBox: true,
                          focusedBorderColor: Colors.black,
                          cursorColor: Colors.black,
                          clearText: true,
                          onCodeChanged: (String code) {
                            //  controller.otp = code;
                          },
                          onSubmit: (String verificationcode) {
                            //  controller.otp = verificationcode;
                          },
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Continue",
                            onPressed: () {
                            
                              controller.goToSuccessfulSignUp();
                            },
                          )),

                      SizedBox(
                        height: 10,
                      ),

                  


SizedBox(height: 30,),


                      Obx(() {
                        final int seconds = timerController.seconds.value;
                        final String formattedTime =
                            "${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}";

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                            GestureDetector(
                              onTap: seconds == 0
                                  ? () {
                                      timerController
                                          .resetTimer();
                                    }
                                  : null,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Resend Otp code",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: seconds == 0
                                            ? Colors.black
                                            : Colors.grey, 
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  -  $formattedTime",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
            ));
  }
}
