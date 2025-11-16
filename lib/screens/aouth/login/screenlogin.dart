import 'package:coda_workshop/controllers/aouth/logincontroller.dart';
import 'package:coda_workshop/screens/aouth/login/widget_Login/buttoin.dart';
import 'package:coda_workshop/screens/aouth/login/widget_Login/forgetpassword.dart';
import 'package:coda_workshop/screens/aouth/login/widget_Login/gotogoogleandfacebook.dart';

import 'package:coda_workshop/screens/aouth/login/widget_Login/subtitle.dart';
import 'package:coda_workshop/screens/aouth/login/widget_Login/textdonthaveanacount.dart';
import 'package:coda_workshop/screens/aouth/login/widget_Login/textformfiled.dart';
import 'package:coda_workshop/screens/aouth/login/widget_Login/title.dart';
import 'package:coda_workshop/screens/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screenlogin extends StatelessWidget {
  const Screenlogin({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp Controller = Get.put(LogincontrollerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text_title(title: "Sign in"),
          centerTitle: true,
        ),
        body: GetBuilder<LogincontrollerImp>(
          builder: (Controller) => Form(
            key: Controller.formState,
            child: ListView(
              children: [
                SizedBox(
                  height: 70,
                ),
                Subtitle(
                    subtitle: "Welcome Back",
                    bodytitle:
                        "sign in waith your email and  password \n         or continue with social media"),
                SizedBox(
                  height: 30,
                ),
                Textformfiled(
                    valid: (val) => validInput(val!, 5, 100, "email"),
                    mycontrller: Controller.email,
                    hintText: "Enter your email",
                    leabeltext: "Email",
                    iconData: Icons.email_outlined),
                SizedBox(
                  height: 20,
                ),
                Textformfiled(
                    valid: (val) => validInput(val!, 5, 100, "password"),
                    mycontrller: Controller.password,
                    hintText: "Enter your password",
                    leabeltext: "Password",
                    iconData: Icons.lock_outline),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.orange,
                      value: Controller.remamber,
                      onChanged: (value) {
                        Controller.changepoksRemamberme();
                      },
                    ),
                    Text("Remamber me"),
                    SizedBox(
                      width: 80,
                    ),
                    Forgetpassword(
                      text: "ForgetPassword",
                      buttion: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Buttoin(
                  text: "Continue",
                  buttion: () {
                    Controller.gotohome();
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width * 0.10,
                  height: Get.height * 0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gotogoogleandfacebook(image: "images/google.jpg"),
                      SizedBox(
                        width: 40,
                      ),
                      Gotogoogleandfacebook(image: "images/facebook.png"),
                      SizedBox(
                        width: 40,
                      ),
                      Gotogoogleandfacebook(image: "images/twitter.png")
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Donthave_anacount(),
              ],
            ),
          ),
        ));
  }
}
