import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:coda_workshop/screens/home/productsCategores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/home_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final HomeController controller = Get.find<HomeController>();
  final ProductControllera productController = Get.find<ProductControllera>();

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

         return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.catigures.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
          var catigury=controller.catigures[index];

              return InkWell(
                onTap: (){

                  //  productController.getProductsByCategory(catigury.id!);
                  //         Get.to(ProductsByCategoryScreen(
                  //             categoryId: catigury.id!,
                  //             categoryName: catigury.title!));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                               Radius.circular(14)),
                          child: Image.network(
                            catigury.icon ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          catigury.title?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
