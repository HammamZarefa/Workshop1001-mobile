import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  final Map<String, dynamic> data;
  final RxString currentImage;
  final RxInt quantity;
  final CartController cartController = Get.put(CartController());
  final String name;
  final String image;
  final RxInt count;
final double price;
  final int productId;

  AddToCartButton({
    required this.data,
    required this.currentImage,
    required this.quantity,
    super.key,
    required this.name,
    required this.image,
    required this.count,
    required this.price,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AuthGradientButton(
        title: "Add to cart",
        onPressed: () {
          cartController.addToCart( productId,price,count.value);
          
        },
      ),
    );
  }
}
