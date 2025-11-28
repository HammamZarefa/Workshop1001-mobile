
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThumbnailImages extends StatelessWidget {
  final List<String> images;
  final RxString currentImage;
  ThumbnailImages({required this.images, required this.currentImage, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((img) {
            return GestureDetector(
              onTap: () => currentImage.value = img,
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(currentImage.value == img ? 4 : 2),
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
    );
  }
}