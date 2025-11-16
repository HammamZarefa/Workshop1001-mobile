import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Text_title extends StatelessWidget {
  const Text_title({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 90, 76, 76),
        ),
      ),
    );
  }
}
