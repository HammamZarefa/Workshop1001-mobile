import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:coda_workshop/controllers/nav_controller.dart';
import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/cart.dart';
import 'package:coda_workshop/screens/home/categories.dart';
import 'package:coda_workshop/screens/notification_screen.dart';
import 'package:coda_workshop/services/Notifications/notification_service.dart';
import 'package:coda_workshop/widgets/home/banner.dart';
import 'package:coda_workshop/widgets/home/categureList.dart';
import 'package:coda_workshop/widgets/home/pupolarList.dart';
import 'package:coda_workshop/widgets/home/SpecialList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
            final ProductController productController = Get.put(ProductController());

    return GetBuilder<HomeController>(
      builder: (controller) {
        ///default data
        if (controller.pannerData.isEmpty || controller.catigures.isEmpty) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(height: 30),
                BannerCard(
                  // image: ImageAssets.google,
                  title: "Welcome!",
                  description: "Find the best products",
                  backgroundColor: AppColors.pannerColor!,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Categories:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CategoriesList(
                  controller: controller,
                  categories: [
                    CategoryData(
                      id: 0,
                      title: "Category 1",
                      icon: ImageAssets.facebook,
                    ),
                    CategoryData(
                      id: 0,
                      title: "Category 2",
                      icon: ImageAssets.google,
                    ),
                    CategoryData(
                      id: 0,
                      title: "Category 3",
                      icon: ImageAssets.google,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "Loading real data...",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        }

        final banner = controller.pannerData.first;
        final categoriesList = controller.catigures.length > 7
            ? controller.catigures.take(7).toList()
            : controller.catigures;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              /// ================== Top par ==================
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
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
                                  controller.productController.searchWord =
                                      value;
                                  controller.productController.searchCompare();
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
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () => Get.to(CartScreen()),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                        backgroundColor: AppColors.lightGrey,
                        child: IconButton(
                          onPressed: () {
                            NotificationService.instance.showLocalNotification(
                              "Test Notification",
                              "This is a test notification",
                            );
                            Get.to(NotificationScreen());
                          },
                          icon: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.black,
                          ),
                        )),
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
                          leading:
                              Image.network(item.featuredImage!, width: 45),
                          title: Text(item.title!),
                          subtitle: Text("${item.price} \$",
                              style: TextStyle(color: Colors.red)),
                          trailing: Icon(Icons.arrow_forward_ios, size: 18),
                          onTap: () {  Get.toNamed(
                          AppRoutes.productDetailsScreen,
                          arguments: item.id!,
                        );},
                        );
                      },
                    ),
                  );
                },
              ),

              BannerCard(
                image: banner.image ?? "",
                title: banner.title ?? "title",
                description: banner.description ?? "description",
                backgroundColor: AppColors.pannerColor!,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.productsScreen);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 20, left: 100),
                  ),
                ),
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

              CategoriesList(
                  controller: controller, categories: categoriesList),

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
