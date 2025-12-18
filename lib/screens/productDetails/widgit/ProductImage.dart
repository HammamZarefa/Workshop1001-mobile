import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  final RxString currentImage;
  ProductImage({required this.currentImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Image.network(
            currentImage.value,
            key: ValueKey(currentImage.value),
            height: 250,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
