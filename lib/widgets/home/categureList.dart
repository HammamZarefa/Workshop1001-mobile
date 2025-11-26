import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/screens/home/productsCategores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryData> categories;

  const CategoriesList({
    super.key,
    required this.categories,
    required HomeController controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: categories.isEmpty
          ? const Center(child: Text("No Categories"))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, left: 15),
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
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.lightOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.category),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        category.title ?? "",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
