import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home screen"),),
      body: Container(color: Colors.orange,height: Get.height,),
    );
  }
}