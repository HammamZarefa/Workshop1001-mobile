import 'package:coda_workshop/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller=Get.put(SplashController());  

  @override

  Widget build(BuildContext context) {
    return Container(
      child:  Center(
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
            'assets/logo/logo.png',
            width: 200,
            height: 200,
          ),
          SizedBox(
            width: 40,
          ),
          Text('CODA'),
          ],
        ),
      ),
    );
  }
}
