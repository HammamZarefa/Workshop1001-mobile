import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/Favorite_Controller.dart';
import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  ProductsByCategoryScreen(
      {required this.categoryId, required this.categoryName});

  final ProductController controller = Get.put(ProductController());
  final FavoriteController favController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    controller.getProductsByCategory(categoryId);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: GetBuilder<ProductController>(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final product = controller.productsid[index];

              return Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(14)),
                        child: Image.network(
                          product.featuredImage ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.price ?? 0} \$",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(() {
                            bool isFav =
                                favController.favoriteIds.contains(product.id!);
                            return IconButton(
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                favController.toggleFavorite({
                                  "id": product.id,
                                  "title": product.title,
                                  "price": product.price,
                                  "image": product.featuredImage,
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
