// import 'package:flutter/cupertino.dart';

// class onBoardingBotton {
//   PageController? controller;

//   onBoardingBotton({required this.controller});

// }
import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';
 
class onBoardingBotton extends StatelessWidget {
final  void Function()? onPressed;
 final String? bottomTitle;
  onBoardingBotton({
    super.key, this.onPressed, this.bottomTitle,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        bottomTitle!,
        style: TextStyle(fontSize: 20, color: appColors.background),
      ),
      color: appColors.primary,
      minWidth: 300,
      height: 50,
    );
  }
}
