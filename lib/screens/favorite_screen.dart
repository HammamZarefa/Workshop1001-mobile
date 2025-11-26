import 'package:coda_workshop/controllers/Favorite_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(FavoriteController());

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
          centerTitle: true,
        ),

        body: controller.favorites.isEmpty
            ? Center(
                child: Text(
                  "No products in favorites",
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  final item = controller.favorites[index];

                  return ListTile(
                    leading: Image.network(
                      item["image"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),

                    title: Text(item["title"]),
                    subtitle: Text("${item["price"]} \$"),

                    trailing: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        controller.toggleFavorite(item);
                      },
                    ),
                  );
                },
              ),
      );
    });
  }
}