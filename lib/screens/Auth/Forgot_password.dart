import 'package:coda_workshop/controllers/Auth/forget_password.dart';

import 'package:coda_workshop/functions/validInput.dart';
import 'package:coda_workshop/constant/colors.dart';

import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';

import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/Auth/authTitle.dart';
import 'package:coda_workshop/widgets/Auth/inkWellText.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  ForgetPasswordcontroller controller = Get.put(ForgetPasswordcontroller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordcontroller>(
        builder: (controller) => Form(
              key: controller.formState,
              child: Scaffold(
                backgroundColor: AppColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AppParTilte(
                        appbarTilte: "Forgot password",
                      ),
                      AuthTitle(
                        title: "Forgot password",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: AuthSubTitle(
                          subtitle:
                              "please enter your email and we will send  \n you a link to return to your account",
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
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Continue",
                            onPressed: () {
                              print("Button clicked!");
                              controller.Forget_password();
                            },
                          )),

                      ///////////////////////////////////////

                      Inkwelltext(
                        FirstText: "Dont have an account?",
                        SecondText: "  Sign Up",
                        onTap: () {
                          controller.validate_forgotpassword();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
