import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/home_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("All Categories"),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          if (controller.catigures.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: controller.catigures.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final category = controller.catigures[index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.lightGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.productsCategores,
                        arguments: {
                          "id": category.id!,
                          "name": category.title ?? "Category",
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.category,
                            size: 45, color: Colors.blue),
                        const SizedBox(height: 10),
                        Text(
                          category.title ?? "Category",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
