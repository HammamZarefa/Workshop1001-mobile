import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingStarsWidget extends StatelessWidget {
  final double averageRating;
  // final int totalRatings;
  final int productId;

  RatingStarsWidget({
    super.key,
    required this.averageRating,
    required this.productId,
  });

  final ProductController controller = Get.find();

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

                  Get.back();
                  Get.snackbar(
                    "Evaiuation",
                    "Evaluated The Product $rating ",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );

                  controller.sendRating();
                },
              );
            }),
          );
        }),
      );
    }

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
              averageRating.toStringAsFixed(1),
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
            const SizedBox(width: 4),
            // Text(
            //   "($totalRatings)",
            //   style: const TextStyle(fontSize: 12, color: Colors.grey),
            // ),
          ],
        ),
      ),
    );
  }
}
