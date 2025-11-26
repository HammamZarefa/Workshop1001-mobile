import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Text("Favorite Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
