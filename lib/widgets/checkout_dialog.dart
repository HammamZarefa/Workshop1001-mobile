import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/order_controller.dart';
import 'package:coda_workshop/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutDialog extends StatelessWidget {
  final List<Items> items;

  CheckoutDialog({super.key, required this.items});

  final OrderController controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Checkout"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Shipping Address"),
          const SizedBox(height: 5),
          TextField(
            cursorColor: AppColors.primary,
            controller: controller.addressController,
            decoration: InputDecoration(
              hintText: "Enter your address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text("Currency"),
          const SizedBox(height: 5),
          TextField(
            cursorColor: AppColors.primary,
            controller: controller.currencyController,
            decoration: InputDecoration(
              hintText: "SAR",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: Text(
            "Cancel",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (controller.addressController.text.trim().isEmpty) {
              Get.snackbar("Error", "Please enter address");
              return;
            }

            final message = await controller.sendOrder(
              orderItems: items,
            );

            if (message != null) {
              Get.back();
              Get.snackbar("Success", message);
            } else {
              Get.snackbar("Error", "Order failed ");
            }
          },
          child: Text(
            "Confirm",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
