import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingpagesWedjet extends StatelessWidget {
   OnboardingpagesWedjet({super.key,required this.title,required this.image});
  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CODA",
              style: TextStyle(color: appColors.primary, fontSize: 30),
            ),
            Text(title),
            Image.asset(image),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
