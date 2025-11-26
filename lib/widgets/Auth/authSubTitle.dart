import 'package:flutter/material.dart';

class AuthSubTitle extends StatelessWidget {
  AuthSubTitle({super.key, required this.subtitle});
  String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle!,
      // "Sign in with your email and password \n or continue with social media",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 17,
        //  color: Colors.black54
      ),
    );
  }
}
