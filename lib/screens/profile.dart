import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.background,
        body: Center(
          child: Text("Profile Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
