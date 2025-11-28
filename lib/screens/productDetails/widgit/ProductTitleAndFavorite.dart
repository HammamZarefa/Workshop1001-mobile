
import 'package:coda_workshop/controllers/Favorite_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductTitleAndFavorite extends StatelessWidget {
  final Map<String, dynamic> data;
  final FavoriteController favController;
  ProductTitleAndFavorite({required this.data, required this.favController, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["title"] ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        Obx(() {
          bool isFav = favController.favoriteIds.contains(data["id"]);
          return GestureDetector(
            onTap: () {
              favController.toggleFavorite({
                "id": data["id"],
                "title": data["title"],
                "price": data["price"],
                "image": data["image"],
              });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
