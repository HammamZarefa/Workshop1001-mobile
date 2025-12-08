import 'package:coda_workshop/constant/colors.dart';

import 'package:coda_workshop/controllers/Auth/login_controller.dart';
import 'package:coda_workshop/controllers/Auth/successful_controller.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';
import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:coda_workshop/widgets/Auth/authTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SuccessfulSignIn extends StatelessWidget {
  SuccessfulSignIn({super.key});
   SuccessfulController   controller = Get.put(SuccessfulController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuccessfulController>(
        builder: (controller) => Form(

              child: Scaffold(
                backgroundColor: AppColors.background,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AppParTilte(
                        appbarTilte: "Logein Success",
                      ),
SizedBox(height: 100,),
 Icon(Icons.task_alt_rounded,size: 200,color: Colors.orange,),

                      AuthTitle(
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

                 
                    ],
                  ),
                ),
              ),
            ));
  }
}
