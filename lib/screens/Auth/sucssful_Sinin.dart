
import 'package:coda_workshop/constant/colors.dart';

import 'package:coda_workshop/controllers/Auth/login_controller.dart';
import 'package:coda_workshop/controllers/Auth/sucssfull.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';

import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';

import 'package:coda_workshop/widgets/Auth/authTitle.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SucssfulSinin extends StatelessWidget {
  SucssfulSinin({super.key});
  Sucssfullcontroller controller = Get.put(Sucssfullcontroller());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Sucssfullcontroller>(
        builder: (controller) => Form(

              child: Scaffold(
                backgroundColor: appColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      appParTilte(
                        appbarTilte: "Logein Success",
                      ),
SizedBox(height: 100,),
 Icon(Icons.task_alt_rounded,size: 200,color: Colors.orange,),

                      authTitle(
                        title: "Logein Success",
                      ),
                   
                     SizedBox(height: 250),
                      
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthGradientButton(
                            title: "Back To Home",
                            onPressed: () {
                              print("Button clicked!");
                              controller. gotohome();
                            },
                          )),

                      ///////////////////////////////////////
                 
                    ],
                  ),
                ),
              ),
            ));
  }
}
