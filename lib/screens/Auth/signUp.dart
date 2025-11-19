import 'package:coda_workshop/controllers/Auth/SinUp_controller.dart';
import 'package:coda_workshop/functions/validInput.dart';
import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/imageAssets.dart';

import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';
import 'package:coda_workshop/widgets/Auth/appsButton.dart';
import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/Auth/authTitle.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class SinUp extends StatelessWidget {
  SinUp({super.key});
  SinUpController controller = Get.put(SinUpController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SinUpController>(
        builder: (controller) => Form(
              key: controller.formstate,
              child: Scaffold(
                backgroundColor: appColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      appParTilte(
                        appbarTilte: "Sign UP",
                      ),
                      authTitle(
                        title: "Register Account",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: authSubTitle(
                          subtitle:
                              "Complete your details or contiue  \n with social media",
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          validator: (val) => validInput(val!, 10, 40, "email"),
                          mycontroller: controller.email,
                          hintText: "Enter your email",
                          labelText: "Email",
                          icon: Icons.email_outlined,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 10, right: 10, bottom: 10),
                          child: Authtextfeild(
                            validator: (val) =>
                                validInput(val!, 5, 15, 'password'),
                            mycontroller: controller.password,
                            hintText: "Enter your Password",
                            labelText: "Password",
                            icon: controller.isShow == false
                                ? Icons.lock_open_outlined
                                : Icons.lock_outline,
                            onPressed: () {
                              controller.showPassword();
                              controller.update();
                              print('${controller.isShow}');
                            },
                            obscureText: controller.isShow,
                            keyboardType: TextInputType.visiblePassword,
                          )),

                      Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 10, right: 10, bottom: 10),
                          child: Authtextfeild(
                            validator: (val) =>
                                validInput(val!, 5, 15, 'password'),
                            mycontroller: controller.password_confirmation,
                            hintText: "Re-enter your Password",
                            labelText: "Confirm Password",
                            icon: controller.isShow == false
                                ? Icons.lock_open_outlined
                                : Icons.lock_outline,
                            onPressed: () {
                              controller.showPassword();
                              controller.update();
                              print('${controller.isShow}');
                            },
                            obscureText: controller.isShow,
                            keyboardType: TextInputType.visiblePassword,
                          )),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Continue",
                            onPressed: () {
                              print("Button clicked!");
                              controller.validateSignup();
                            },
                          )),

                      ///////////////////////////////////////
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            appsButton(
                              image: imageAssets.google,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            appsButton(
                              image: imageAssets.facebook,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            appsButton(
                              image: imageAssets.twitter,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: authSubTitle(
                          subtitle:
                              "By continuing your confirm that you agree  \n wath our tirm and Condition",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
