import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 185, // زيادة بسيطة لمكان دائرة الكاميرا
      child: Stack(
        alignment: Alignment.center, // يجعل كل العناصر في منتصف الـ Stack
        children: [
          // ------------------ الصورة الدائرية الأساسية ------------------
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
                   color: const Color.fromARGB(255, 235, 232, 232),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(ImageAssets.ammar),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ------------------ دائرة الكاميرا أسفل منتصف الدائرة ------------------
          Positioned(
           right:100,
            bottom: 0, // تلامس الدائرة الكبيرة
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 232, 232),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 24,
                color: Color.fromARGB(255, 78, 75, 75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
