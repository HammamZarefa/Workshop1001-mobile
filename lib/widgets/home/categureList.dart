import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/home_controller.dart';
import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/screens/home/productsCategores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryData> categories;

  CategoriesList({
    super.key,
    required this.categories,
    required HomeController controller,
  });
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: categories.isEmpty
          ? const Center(child: Text("No Categories"))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length> 7 ? 7 : categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, left: 15),
                      child: InkWell(
                        onTap: () {
                          productController.getProductsByCategory(category.id!);
                          Get.to(ProductsByCategoryScreen(
                              categoryId: category.id!,
                              categoryName: category.title!));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.lightOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.network(category.icon!,),
                          ),
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
