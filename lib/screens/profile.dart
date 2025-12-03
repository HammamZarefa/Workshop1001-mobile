import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class ProFile extends StatelessWidget {
  const ProFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Text("ProFile Page", style: TextStyle(fontSize: 30)),
        ));
  }
}
