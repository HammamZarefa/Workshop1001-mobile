import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Favorite_Controller.dart';

class ProductDetails extends StatelessWidget {
  final FavoriteController favController = Get.put(FavoriteController());
  final data = Get.arguments;

  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    
    final RxString currentImage = (data["image"] ?? "").toString().obs;

    
    final List<String> images =
        (data["images"] ?? [data["image"]]).cast<String>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    
                    boxShadow: [
                      
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.network(
                    currentImage.value,
                    key: ValueKey(currentImage.value),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            
            SingleChildScrollView(
              
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((img) {
                  return GestureDetector(
                    onTap: () => currentImage.value = img,
                    child: Obx(
                      () => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(
                          currentImage.value == img ? 4 : 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: currentImage.value == img
                                ? Colors.orange
                                : const Color.fromARGB(255, 218, 211, 211),
                            width: 2,
                          ),
                          boxShadow: [
                            
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          img,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            
            Row(
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
                      // Text(
                      //   "${data["price"]} \$",
                      //   style: const TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.orange,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Obx(() {
                  bool isFav = favController.favoriteIds.contains(data["id"]);
                  return GestureDetector(
                      onTap: () {
                        if (data["id"] != null) {
                          favController.toggleFavorite({
                            "id": data["id"],
                            "title": data["title"],
                            "price": data["price"],
                            "image": data["image"],
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color:
                              Colors.white, 
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
                      ));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
