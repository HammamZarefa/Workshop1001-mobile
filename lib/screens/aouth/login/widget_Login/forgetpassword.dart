import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  Forgetpassword({
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            )
          ],
        ));
  }
}
