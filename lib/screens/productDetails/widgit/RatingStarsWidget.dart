import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingStarsWidget extends StatefulWidget {
  final double averageRating;
  final int totalRatings;

  const RatingStarsWidget({
    super.key,
    required this.averageRating,
    required this.totalRatings,
  });

  @override
  State<RatingStarsWidget> createState() => _RatingStarsWidgetState();
}

class _RatingStarsWidgetState extends State<RatingStarsWidget> {
  int selectedRating = 0;

  void showRatingDialog() {
    Get.defaultDialog(
      title: "اختر التقييم",
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          int rating = index + 1;

          return IconButton(
            icon: Icon(
              rating <= selectedRating ? Icons.star : Icons.star_border,
              color: Colors.orange,
              size: 35,
            ),
            onPressed: () {
              setState(() {
                selectedRating = rating;
              });

              Get.back();

              Get.snackbar(
                "تم التقييم",
                "لقد قيمت المنتج بـ $rating نجمة",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showRatingDialog,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,       // خلفية رمادية فاتحة
          borderRadius: BorderRadius.circular(30), // إطار دائري
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [


 Text(
              widget.averageRating.toString(),
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
           
          ],
        ),
      ),
    );
  }
}