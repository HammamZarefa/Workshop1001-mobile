import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Gotogoogleandfacebook extends StatelessWidget {
  Gotogoogleandfacebook({super.key, required this.image, this.onTap});
  String? image;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60), color: Colors.grey[100]),
          child: Image.asset(
            image!,
            height: Get.height * 0.10,
            width: Get.width * 0.10,
            fit: BoxFit.contain,
          )),
    );
  }
}
