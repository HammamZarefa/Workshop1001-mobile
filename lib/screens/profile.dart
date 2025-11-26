import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Text("Profile Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
