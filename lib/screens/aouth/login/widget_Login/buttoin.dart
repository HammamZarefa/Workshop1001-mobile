import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Buttoin extends StatelessWidget {
  Buttoin({
    super.key,
    required this.text,
    this.buttion,
  });

  final String text;
  final void Function()? buttion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: Get.width * 0.9,
      height: Get.height * 0.06,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color.fromARGB(255, 228, 112, 66),
        onPressed: buttion,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
