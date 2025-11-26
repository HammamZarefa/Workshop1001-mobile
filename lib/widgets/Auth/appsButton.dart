import 'package:flutter/material.dart';

class AppsButton extends StatelessWidget {
  AppsButton({super.key, required this.image, this.onTap});
  String? image;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(60),
              color: Colors.grey[100]),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image.asset(
              image!,
              height: 10,
              width: 10,
              fit: BoxFit.scaleDown,
            ),
          )),
    );
  }
}
