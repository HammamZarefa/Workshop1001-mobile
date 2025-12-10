import 'package:coda_workshop/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductTitleAndFavorite extends StatelessWidget {
  final Map<String, dynamic> data;
  final FavoriteController favController;
  final RxString currentImage;

  ProductTitleAndFavorite({
    required this.data,
    required this.favController,
    required this.currentImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Positioned.fill(
            left: 0,
            right: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data["title"] ?? "",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Obx(() {
              bool isFav = favController.favoriteIds.contains(data["id"]);

              return GestureDetector(
                onTap: () {
                  favController.toggleFavorite({
                    "id": data["id"],
                    "title": data["title"],
                    "price": data["price"],
                    "image": currentImage.value,
                  });
                },
                child: Container(
                  height: 50,
                  width: 55,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 235, 235),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
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
                      size: 25,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
