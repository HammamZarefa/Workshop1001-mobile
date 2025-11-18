// custom or shared widget
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class backWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        )
      );
    
  }
}