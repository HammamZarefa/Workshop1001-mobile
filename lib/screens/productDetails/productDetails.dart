import 'package:coda_workshop/controllers/Favorite_Controller.dart';
import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:coda_workshop/screens/productDetails/widgit/AddToCartButton.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ColorAndQuantitySelector.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ProductDescription.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ProductImage.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ProductTitleAndFavorite.dart';
import 'package:coda_workshop/screens/productDetails/widgit/RatingStarsWidget.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ThumbnailImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetails extends StatelessWidget {
  final FavoriteController favController = Get.put(FavoriteController());
  final CartController cartController = Get.put(CartController());

  final data = Get.arguments;
  final RxInt quantity = 1.obs;

  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final RxString selectedColor = "".obs;
    final RxString currentImage = (data["image"] ?? "").toString().obs;



    final List<String> images =
        (data["images"] ?? [data["image"]]).cast<String>();

    final List<String> colors =
        (data["colors"] is List) ? List<String>.from(data["colors"]) : [];

    Map<String, Color> colorMap = {
      "red": Colors.red,
      "green": Colors.green,
      "blue": Colors.blue,
      "black": Colors.black,
      "white": Colors.white,
      "yellow": Colors.yellow,
      "orange": Colors.orange,
      "purple": Colors.purple,
      "grey": Colors.grey,
    };

    return Scaffold(
appBar: AppBar(
  title: Text("Product Details"),
  centerTitle: true,
  actions: [
    SizedBox(
      width: 120, // عرض ثابت يمنع الـ Overflow
      child: Center(
        child: RatingStarsWidget(
          averageRating: 4.2,
          totalRatings: 120,
        ),
      ),
    ),
  ],
),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ProductImage(currentImage: currentImage),
            const SizedBox(height: 20),
            ThumbnailImages(images: images, currentImage: currentImage),
            const SizedBox(height: 20),
            ProductTitleAndFavorite(data: data, favController: favController),
            const SizedBox(height: 10),
            ProductDescription(description: data["description"] ?? ""),
            const SizedBox(height: 60),
            ColorAndQuantitySelector(
              colors: colors,
              colorMap: colorMap,
              selectedColor: selectedColor,
              quantity: quantity,
            ),
            const SizedBox(height: 20),
            AddToCartButton(
              cartController: cartController,
              data: data,
              currentImage: currentImage,
              quantity: quantity,
            ),
          ],
        ),
      ),
    );
  }
}
