import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
