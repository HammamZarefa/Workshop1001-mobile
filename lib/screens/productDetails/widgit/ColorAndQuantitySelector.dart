


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorAndQuantitySelector extends StatelessWidget {
  final List<String> colors;
  final Map<String, Color> colorMap;
  final RxString selectedColor;
  final RxInt quantity;
  ColorAndQuantitySelector({
    required this.colors,
    required this.colorMap,
    required this.selectedColor,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: colors.map((colorString) {
            Color color = colorMap[colorString.toLowerCase()] ?? Colors.grey;
            return GestureDetector(
              onTap: () => selectedColor.value = colorString,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor.value == colorString
                        ? Colors.orange
                        : Colors.grey.shade300,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: color,
                ),
              ),
            );
          }).toList(),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (quantity.value > 1) quantity.value--;
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Icon(Icons.remove),
              ),
            ),
            SizedBox(width: 10),
            Obx(() => Text(
                  quantity.value.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => quantity.value++,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}