import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      
      Image.asset("logo.png"),
Center(child: Text("CODA",style: TextStyle(color: Colors.orange),),)
    ]),
    );
  } 
}

