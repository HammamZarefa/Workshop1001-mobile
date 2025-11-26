import 'package:coda_workshop/controllers/Auth/SinUp_controller.dart';
import 'package:coda_workshop/functions/validInput.dart';
import 'package:coda_workshop/constant/colors.dart';


import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';

import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/Auth/authTitle.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class CompletProfile extends StatelessWidget {
  CompletProfile({super.key});
  SinUpController controller = Get.put(SinUpController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SinUpController>(
        builder: (controller) => Form(
              key: controller.completeForm,
              child: Scaffold(
                backgroundColor: AppColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AppParTilte(
                        appbarTilte: "Sign UP",
                      ),
                      AuthTitle(
                        title: "Complete Profile",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: AuthSubTitle(
                          subtitle:
                              "Complete your details or contiue  \n with social media",
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          validator: (val) => validInput(val!, 10, 40, "username"),
                          mycontroller: controller.firstName,
                          hintText: "Enter your first name",
                          labelText: "First Name",
                          icon: Icons.person_outline,
                          obscureText: false,
                          keyboardType: TextInputType.name,
                        ),
                      ),







                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          validator: (val) => validInput(val!, 2, 10, "username"),
                          mycontroller: controller.lastName,
                          hintText: "Enter your last name",
                          labelText: "Last Name",
                          icon: Icons.person_outline,
                          obscureText: false,
                          keyboardType: TextInputType.name,
                        ),
                      ),









                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          validator: (val) => validInput(val!, 10, 40, "phone number"),
                          mycontroller: controller.phonenumper,
                          hintText: "Enter your phone number",
                          labelText: "Phone Number",
                          icon: Icons.phone_android_outlined,
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 10, right: 10, bottom: 10),
                        child: Authtextfeild(
                          validator: (val) => validInput(val!, 10, 40, "Address"),
                          mycontroller: controller.locition,
                          hintText: "Enter your address",
                          labelText: "Address",
                          icon: Icons.location_on_outlined,
                          obscureText: false,
                          keyboardType: TextInputType.streetAddress,
                        ),
                      ),



                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Continue",
                            onPressed: () {
                              print("Button clicked!");
                            controller.signup();
                            },
                          )),

                      ///////////////////////////////////////
                    SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: AuthSubTitle(
                          subtitle:
                              "By continuing your confirm that you agree  \n wath our term and Condition",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
