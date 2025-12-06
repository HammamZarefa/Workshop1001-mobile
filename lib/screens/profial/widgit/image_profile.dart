import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profail_controlier.dart';

class ImageProfile extends StatelessWidget {
  final ProfileController controller;

  const ImageProfile({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: 170,
        height: 185,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // الصورة الدائرية بدون Asset
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300], // لون الخلفية فقط
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: controller.profileImageUrl.value.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(controller.profileImageUrl.value),
                        fit: BoxFit.cover,
                      )
                    : null, // بدون صورة افتراضية
              ),
            ),

            // زر الكاميرا
            Positioned(
              right: 90,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  controller.pickAndUploadImage();
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 24,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
