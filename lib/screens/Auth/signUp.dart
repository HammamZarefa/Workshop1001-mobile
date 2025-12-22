import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/controllers/Auth/signup_controller.dart';
import 'package:coda_workshop/functions/validInput.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';
import 'package:coda_workshop/widgets/Auth/appsButton.dart';
import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/Auth/authTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        builder: (controller) => Form(
              key: controller.formstate,
              child: Scaffold(
                backgroundColor: AppColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: AppParTilte(
                          appbarTilte: 'Sign Up',
                        ),
                      ),
                      AuthTitle(
                        title: 'Register Account',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 10,
                        ),
                        child: AuthSubTitle(
                          subtitle:
                              'Complete your details or continue\n with social media',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          hintText: "Enter your email",
                          labelText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email_outlined,
                          obscureText: false,
                          mycontroller: controller.email,
                          validator: (val) => validInput(val!, 10, 35, 'email'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          hintText: "Enter your password",
                          labelText: "Password",
                          icon: controller.isShow == true
                              ? Icons.lock
                              : Icons.lock_open,
                          onPressed: () {
                          
                            controller.update();
                          },
                          obscureText: controller.isShow,
                          mycontroller: controller.password,
                          validator: (val) =>
                              validInput(val!, 5, 20, 'password'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          hintText: "Re-enter your password",
                          labelText: "Confirm Password",
                          icon: controller.isShow == true
                              ? Icons.lock
                              : Icons.lock_open,
                          onPressed: () {
                            
                            controller.update();
                          },
                          obscureText: controller.isShow,
                          mycontroller: controller.passwordConfirmation,
                          validator: (val) {
                            
                            String? validation =
                                validInput(val!, 5, 20, 'password');
                            if (validation != null) return validation;

                          
                            if (val != controller.password!.text) {
                              return 'Passwords do not match';
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Continue",
                            onPressed: () {
                              print("Button clicked!");
                              controller.validateSignup();
                            },
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppsButton(
                            image: ImageAssets.google,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          AppsButton(
                            image: ImageAssets.facebook,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          AppsButton(
                            image: ImageAssets.twitter,
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 18, right: 18),
                        child: Text(
                          "By continuing your confirm that you agree\n with our Term and Condition",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
