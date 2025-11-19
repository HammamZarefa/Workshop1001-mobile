import 'package:coda_workshop/functions/validInput.dart';
import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/controllers/Auth/login_controller.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';
import 'package:coda_workshop/widgets/Auth/appsButton.dart';
import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/Auth/authTitle.dart';
import 'package:coda_workshop/widgets/Auth/inkWellText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class loginscreen extends StatelessWidget {
  loginscreen({super.key});
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Form(
              key: controller.formState,
              child: Scaffold(
                backgroundColor: appColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      appParTilte(
                        appbarTilte: "Sign in",
                      ),
                      authTitle(
                        title: "Welcome Back",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: authSubTitle(
                          subtitle:
                              "Sign in with your email and password \n or continue with social media",
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
                      Row(
                        children: [
                          Checkbox(
                            checkColor: appColors.primary,
                            activeColor: appColors.background,
                            // activeColor: appColors.primary,

                            value: controller.tick,
                            onChanged: (value) {
                              controller.rememberMeTick();
                            },
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 75),
                              child: InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text('Forget Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline)),
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Continue",
                            onPressed: () {
                              print("Button clicked!");
                              controller.login();
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
                      Inkwelltext(
                        FirstText: "Dont have an account?",
                        SecondText: "  Sign Up",
                        onTap: () {

controller.goTosibup();

                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
