import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  final homeController controller = Get.put(homeController());

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

        return Scaffold(
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
                            onPressed: () {},
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: appColors.pannerColor),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(25),
                        child: Image.network(
                          banner.image ?? "",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stack) =>
                              Image.asset(imageAssets.twitter),
                        ),
                      ),
                    ),
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              banner.title ?? "title",
                              style: TextStyle(
                                color: appColors.background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              banner.description ?? "description",
                              style: TextStyle(
                                fontSize: 30,
                                color: appColors.background,
                              ),
                            ),
                          ),
                        ],
                      ),
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
