import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:coda_workshop/controllers/nav_controller.dart';
import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:coda_workshop/screens/cart.dart';
import 'package:coda_workshop/screens/home/categories.dart';
import 'package:coda_workshop/widgets/home/banner.dart';
import 'package:coda_workshop/widgets/home/categureList.dart';
import 'package:coda_workshop/widgets/home/pupolarProduct.dart';
import 'package:coda_workshop/widgets/home/SpecialList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final NavController navController = Get.put(NavController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.pannerData.isEmpty || controller.catigures.isEmpty) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final banner = controller.pannerData.first;
        final categoriesList = controller.catigures.length > 7
            ? controller.catigures.take(7).toList()
            : controller.catigures;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: ListView(
            children: [
              
              /// ================== Top par ==================
              Padding(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  productController.searchWord = value;
                                  productController.searchCompare();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search product...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart_outlined),
                        onPressed: () => Get.to(CartScreen()),
                      ),
                    ),

                    SizedBox(width: 10),

                    CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      child: Icon(Icons.notifications_active_outlined),
                    ),
                  ],
                ),
              ),

              GetBuilder<ProductController>(
                builder: (pc) {
                  if (pc.searchResult.isEmpty) return SizedBox();

                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(10),
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.builder(
                      itemCount: pc.searchResult.length,
                      itemBuilder: (_, index) {
                        final item = pc.searchResult[index];

                        return ListTile(
                          leading: Image.network(item.featuredImage!, width: 45),
                          title: Text(item.title!),
                          subtitle: Text("${item.price} \$",
                              style: TextStyle(color: Colors.red)),
                          trailing: Icon(Icons.arrow_forward_ios, size: 18),
                          onTap: () {},
                        );
                      },
                    ),
                  );
                },
              ),

              BannerCard(
                image: banner.image,
                title: banner.title,
                description: banner.description,
                backgroundColor: AppColors.pannerColor!,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Categories:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () => Get.to(CategoriesScreen()),
                    child: Text("See all ->",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ],
              ),

              CategoriesList(controller: controller, categories: categoriesList),

              /// ================== Special & Popular ==================
              SpecialList(controller: controller),
              PopularList(controller: controller),
            ],
          ),
        );
      },
    );
  }
}
