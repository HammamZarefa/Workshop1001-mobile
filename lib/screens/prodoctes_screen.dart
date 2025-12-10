import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import '../routes/routes.dart';

class ProductsScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final FavoriteController favController = Get.put(FavoriteController());
    final ProductControllera controller = Get.put(ProductControllera());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      ),
      body: GetBuilder<ProductControllera>(
        init: ProductControllera(),
        builder: (controller) {
          scrollController.addListener(() {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              controller.loadMore();
            }
          });

          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    itemCount: controller.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 280,
                    ),
                    itemBuilder: (context, index) {
                      final item = controller.products[index];

                      return GestureDetector(
                        onTap: () {
                          controller.showProduct(item.id!);
                          Get.toNamed(
                            AppRoutes.productDetailsScreen,
                            arguments: item.id!,
                          );
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          child: Stack(
                            children: [
                              ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20),
                                        top: Radius.circular(20)),
                                    child: Container(
                                      height: 180,
                                      color: Colors.grey[300],
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.network(
                                          item.featuredImage!,
                                          height: 130,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    item.title!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${item.price} \$",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Obx(() {
                                        bool isFav = favController.favoriteIds
                                            .contains(item.id);
                                        return IconButton(
                                          icon: Icon(
                                            isFav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            if (item.id != null) {
                                              favController.toggleFavorite({
                                                "id": item.id,
                                                "title": item.title,
                                                "price": item.price,
                                                "image": item.featuredImage,
                                              });
                                            }
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                controller.isMoreLoading
                    ? Padding(
                        padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
