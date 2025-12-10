import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorAndQuantitySelector extends StatelessWidget {
  final List<String> colors;
  final RxString selectedColor;
  final RxInt quantity;

  ColorAndQuantitySelector({
    required this.colors,
    required this.selectedColor,
    required this.quantity,
    super.key,
  });

  Color hexToColor(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    return Color(int.parse("0x$hex"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 235, 235),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Row(
                children: colors.map((hexColor) {
                  Color color = hexToColor(hexColor);

                  return GestureDetector(
                    onTap: () => selectedColor.value = hexColor,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedColor.value == hexColor
                              ? Colors.orange
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: color,
                      ),
                    ),
                  );
                }).toList(),
              )),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (quantity.value > 1) quantity.value--;
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              const SizedBox(width: 10),
              Obx(() => Text(
                    quantity.value.toString(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => quantity.value++,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
