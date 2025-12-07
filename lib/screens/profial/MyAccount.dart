import 'package:coda_workshop/controllers/myacount_controller.dart';
import 'package:coda_workshop/functions/validInput.dart';
import 'package:coda_workshop/constant/colors.dart';

import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';

import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';

import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});

  MyAccountController controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAccountController>(
      builder: (controller) {
        if (controller.isLoading) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Form(
          key: controller.MyAccount,
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  AppParTilte(appbarTilte: "My Account"),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Authtextfeild(
                      validator: (val) => validInput(val!, 2, 40, "username"),
                      mycontroller: controller.firstName,
                      hintText: "Enter your first name",
                      labelText: "First Name",
                      icon: Icons.person_outline,
                      obscureText: false,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Authtextfeild(
                      validator: (val) => validInput(val!, 2, 40, "username"),
                      mycontroller: controller.lastName,
                      hintText: "Enter your last name",
                      labelText: "Last Name",
                      icon: Icons.person_outline,
                      obscureText: false,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Authtextfeild(
                      validator: (val) => validInput(val!, 10, 35, 'email'),
                      mycontroller: controller.email,
                      hintText: "Enter your email",
                      labelText: "Email",
                      icon: Icons.email_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Authtextfeild(
                      validator: (val) => validInput(val!, 10, 15, "phone"),
                      mycontroller: controller.phoneNumber,
                      hintText: "Enter your phone number",
                      labelText: "Phone Number",
                      icon: Icons.phone_android_outlined,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Authtextfeild(
                      validator: (val) => validInput(val!, 5, 100, "address"),
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
                      title: "Update Account",
                      onPressed: () {
                        controller.updateAccount();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
