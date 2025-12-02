import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/Favorite_Controller.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProducts extends StatelessWidget {


  

  // ProductController controller = Get.put(ProductController());
  final FavoriteController favController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text("Popular Product"),
        centerTitle: true,
      ),
      
      body: GetBuilder<HomeController>(
        // initState: (_) => controller.getProductsByCategory(categoryId),
        builder: (_) {
         

          // if (controller.productsid.isEmpty) {
          //   return const Center(child: Text("No products available"));
          // }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.popular.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final popular = controller.popular[index];

              return Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(14)),
                        child: Image.network(
                          popular.featuredImage ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        popular.title ?? "",
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
                            "${popular.price ?? 0} \$",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(() {
                            bool isFav =
                                favController.favoriteIds.contains(popular.id);
                            return IconButton(
                              icon: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red),
                              onPressed: () {
                                favController.toggleFavorite({
                                  "id": popular.id,
                                  "title": popular.title,
                                  "price": popular.price,
                                  "image": popular.featuredImage
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
