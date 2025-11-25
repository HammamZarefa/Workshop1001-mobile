import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:coda_workshop/controllers/nav_controller.dart';
import 'package:coda_workshop/screens/cart.dart';
import 'package:coda_workshop/widgets/home/banner.dart';
import 'package:coda_workshop/widgets/home/categureList.dart';
import 'package:coda_workshop/widgets/home/pupolarProduct.dart';
import 'package:coda_workshop/widgets/home/specialList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  final homeController controller = Get.put(homeController());
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeController>(
      builder: (controller) {
        if (controller.pannerData.isEmpty) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final banner = controller.pannerData.first;
        final categores = controller.catigures.first;

        return Scaffold(
          backgroundColor: appColors.background,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Container(
                      width: 220,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: appColors.lightGrey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search product',
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: appColors.lightGrey,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.to(cartScreen());
                            },
                            icon: Icon(Icons.shopping_cart_outlined))),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: appColors.lightGrey,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications_active_outlined))),
                  ],
                ),
              ),
              BannerCard(
                image: banner.image,
                title: banner.title,
                description: banner.description,
                backgroundColor: appColors.pannerColor!,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 250.0,
                ),
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "See all ->",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              CategoriesList(controller: controller),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       right: 20.0, left: 20, top: 0, bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Special for you",
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //       MaterialButton(
              //         onPressed: () {},
              //         child: Text(
              //           "See more",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.grey,
              //               fontSize: 16),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              specialList(controller: controller),
              popularList(controller: controller),
            ],
          ),
        );
      },
    );
  }
}
