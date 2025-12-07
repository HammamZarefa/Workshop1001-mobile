import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/profile_controller.dart';
import 'package:coda_workshop/screens/profial/widgit/buttion.dart';
import 'package:coda_workshop/screens/profial/widgit/image_profile.dart';
import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: AppParTilte(appbarTilte: "Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30),
            ImageProfile(controller: controller),
            const SizedBox(height: 30),
            CustomButtionProfail(
              icon1: Icons.person,
              text: "My Account",
              icon2: Icons.navigate_next_outlined,
              onPressed: () {
                controller.gotoMyAccount();
              },
            ),
            const SizedBox(height: 20),
            CustomButtionProfail(
              icon1: Icons.notifications,
              text: "Notification",
              icon2: Icons.navigate_next_outlined,
            ),
            const SizedBox(height: 20),
            CustomButtionProfail(
              icon1: Icons.settings,
              text: "Settings",
              icon2: Icons.navigate_next_outlined,
            ),
            const SizedBox(height: 20),
            CustomButtionProfail(
              icon1: Icons.help,
              text: "Help center",
              icon2: Icons.navigate_next_outlined,
            ),
            const SizedBox(height: 20),
            CustomButtionProfail(
              icon1: Icons.logout,
              text: "Log Out",
              icon2: Icons.navigate_next_outlined,
              onPressed: () {
                controller.LogoutProfile();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
