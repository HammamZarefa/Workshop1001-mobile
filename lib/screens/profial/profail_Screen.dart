import 'package:coda_workshop/constant/colors.dart';

import 'package:coda_workshop/controllers/Auth/SinUp_controller.dart';
import 'package:coda_workshop/controllers/profail_controlier.dart';

import 'package:coda_workshop/screens/profial/widgit/buttion.dart';
import 'package:coda_workshop/screens/profial/widgit/image_profile.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfailScreen extends StatelessWidget {
  ProfailScreen({super.key});
 ProfailControlier controller = Get.put(ProfailControlier());
  @override
  Widget build(BuildContext context) {
    return 
      
           
               Scaffold(
                backgroundColor: AppColors.background,
appBar: AppBar(title:AppParTilte(appbarTilte: "Profile"),centerTitle: true,),



                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 50.0),
                      //   child: AppParTilte(
                      //     appbarTilte: 'Profile',
                      //   ),
                      // ),
 SizedBox(height: 30),

                      ImageProfile(),
                    SizedBox(height: 30),
CustomButtionProfail(icon1: Icons.person,text: "My Account",icon2: Icons.navigate_next_outlined,onPressed: () {
  controller.gotoMyAccount();
},),


SizedBox(height: 20,),
CustomButtionProfail(icon1: Icons.notifications,text: "Notification",icon2: Icons.navigate_next_outlined,),
SizedBox(height: 20,),
CustomButtionProfail(icon1: Icons.settings,text: "settings",icon2: Icons.navigate_next_outlined,),
SizedBox(height: 20,),
      CustomButtionProfail(icon1: Icons.help,text: "Help center",icon2: Icons.navigate_next_outlined,),
SizedBox(height: 20,),              
          CustomButtionProfail(icon1: Icons.logout,text: "Log Out",icon2: Icons.navigate_next_outlined,),
SizedBox(height: 20,),                  



                    ],
                  ),
                ),
              
            );
  }
}
