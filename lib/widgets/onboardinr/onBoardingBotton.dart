
import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingBotton extends StatelessWidget {
  final void Function()? onPressed;
  final String? bottomTitle;
  OnBoardingBotton({
    super.key,
    this.onPressed,
    this.bottomTitle,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        bottomTitle!,
        style: TextStyle(fontSize: 20, color: AppColors.background),
      ),
      color: AppColors.primary,
      minWidth: 300,
      height: 50,
    );
  }
}
