import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/product_controller.dart';

class RatingStarsWidget extends StatelessWidget {
  final int productId;
  final RxDouble averageRating; 

  RatingStarsWidget({
    super.key,
    required this.productId,
    required this.averageRating,
  });

  final ProductControllera controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final RxInt selectedRating = 0.obs;

    void showRatingDialog() {
      Get.defaultDialog(
        title: "Select Evaluation",
        content: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              int rating = index + 1;
              return IconButton(
                icon: Icon(
                  rating <= selectedRating.value
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.orange,
                  size: 35,
                ),
                onPressed: () {
                  selectedRating.value = rating;

                  controller.productId = productId;
                  controller.rating = rating;
                  controller.sendRating();

                  averageRating.value = rating.toDouble();

                  Get.back();
                },
              );
            }),
          );
        }),
      );
    }

    return Obx(() {
      return GestureDetector(
        onTap: showRatingDialog,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                averageRating.value.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 22,
              ),
            ],
          ),
        ),
      );
    });
  }
}
