
import 'package:flutter/material.dart';

class CustomButtionProfail extends StatelessWidget {
  final String text;
  final dynamic icon1;
  final dynamic icon2;
  final void Function()? onPressed;

  const CustomButtionProfail({
    super.key,
    required this.text,
    this.onPressed,
    this.icon1, this.icon2,

  });

  @override
  Widget build(BuildContext context) {
   return Container(
  height: 60,
  margin: EdgeInsets.symmetric(horizontal: 3),
  padding: EdgeInsets.symmetric(horizontal: 10),

  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 235, 232, 232),
    borderRadius: BorderRadius.circular(15), // 🔥 التدوير البسيط هنا
  ),

  child: MaterialButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
    onPressed: onPressed,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon1, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                
                  fontSize: 15),
            ),
          ],
        ),
        Icon(
          icon2,
          color: Colors.black,
          size: 30,
        ),
      ],
    ),
  ),
);
  }
}
