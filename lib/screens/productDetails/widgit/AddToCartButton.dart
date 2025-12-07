import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  final Map<String, dynamic> data;
  final RxString currentImage;
  final RxInt quantity;

  AddToCartButton({
    required this.data,
    required this.currentImage,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AuthGradientButton(
        title: "Add to cart",
        onPressed: () {},
      ),
    );
  }
}
