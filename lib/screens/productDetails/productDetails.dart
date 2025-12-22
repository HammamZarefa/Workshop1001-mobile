import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/favorite_controller.dart';

import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/screens/productDetails/widgit/AddToCartButton.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ColorAndQuantitySelector.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ProductDescription.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ProductImage.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ProductTitleAndFavorite.dart';
import 'package:coda_workshop/screens/productDetails/widgit/RatingStarsWidget.dart';
import 'package:coda_workshop/screens/productDetails/widgit/ThumbnailImages.dart';

class ProductDetails extends StatelessWidget {
  final RxInt quantity = 1.obs;
  final RxString selectedColor = "".obs;

  final FavoriteController favController = Get.put(FavoriteController());

  final ProductController controller = Get.find();

  ProductDetails({super.key}) {
    final int id = Get.arguments ?? 0;
    if (id != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.showProduct(id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        if (controller.isLoading || controller.productById.id == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final Data product = controller.productById;
        final RxString currentImage = (product.featuredImage ?? "").obs;

        final List<Gallery> images = [
          if (product.featuredImage != null)
            Gallery(id: 0, url: product.featuredImage),
          ...(product.gallery ?? []),
        ];

        final List<String> colors =
            product.colors == null ? [] : List<String>.from(product.colors!);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RatingStarsWidget(
                  productId: product.id ?? 0,
                  averageRating: controller.averageRating,
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.only(left: 2),
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ProductImage(currentImage: currentImage),
                    const SizedBox(height: 20),
                    ThumbnailImages(images: images, currentImage: currentImage),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 244, 244),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleAndFavorite(
                      data: product.toJson(),
                      favController: favController,
                      currentImage: currentImage,
                    ),
                    const SizedBox(height: 15),
                    ProductDescription(description: product.description ?? ""),
                    const SizedBox(height: 20),
                    ColorAndQuantitySelector(
                      colors: colors,
                      selectedColor: selectedColor,
                      quantity: quantity,
                    ),
                    const SizedBox(height: 25),
                    AddToCartButton(
                      data: product.toJson(),
                      currentImage: currentImage,
                      quantity: quantity,
                      name: product.title!,
                      image: product.featuredImage!,
                      count: quantity,
                      price: product.price!.toDouble(),
                      productId: product.id!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
