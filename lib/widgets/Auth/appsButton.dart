import 'package:flutter/material.dart';

class appsButton extends StatelessWidget {
  appsButton({super.key, required this.image, this.onTap});
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
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          )),
    );
  }
}
