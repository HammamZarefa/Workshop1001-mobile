


import 'package:coda_workshop/controllers/splashcontroller/splach.dart';
import 'package:coda_workshop/screens/splash_screen/widget/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Splashcontroller());
    return Scaffold(
    
    backgroundColor: Colors.white,
    body: 
    
    Container(

child: Splash()

    ));
  }
}
