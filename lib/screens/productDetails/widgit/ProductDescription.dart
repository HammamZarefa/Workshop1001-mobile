
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String description;
  ProductDescription({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}










