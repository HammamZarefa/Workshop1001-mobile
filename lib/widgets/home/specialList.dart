import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialList extends StatelessWidget {
  final HomeController controller;

  SpecialList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Special for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.spacialProducts);
                },
                child: Text(
                  "See more",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                controller.special.length > 7 ? 7 : controller.special.length,
            itemBuilder: (context, index) {
              final specialItem = controller.special[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 6.0, left: 20),
                child: Container(
                    height: 100,
                    width: 220,
                    decoration: BoxDecoration(
                      color: AppColors.lightOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: Image.network(
                            specialItem.featuredImage!,
                            fit: BoxFit.fill, width: 220,
                            // color: Colors.black12,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black54,
                                Colors.white70,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                specialItem.title!,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.background,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                specialItem.description!,
                                style: TextStyle(color: AppColors.background),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
