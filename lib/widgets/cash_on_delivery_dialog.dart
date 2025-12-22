import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/cart_controller.dart';

class CashOnDeliveryDialog extends StatelessWidget {
  CashOnDeliveryDialog({Key? key}) : super(key: key);
  final TextEditingController addressController = TextEditingController();
  final CartController controller = Get.find<CartController>();

  @override


  Widget build(BuildContext context) {
    return AlertDialog( 
      title: Text("Enter Your Address"),
      content: TextField(
        controller: addressController,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: "street, city ,building num.",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            String address = addressController.text.trim();
            if (address.isEmpty) {
              Get.snackbar("Error", "Please enter your address");
              return;
            }

            await controller.placeOrderCOD();
            Get.back();
          },
          child: Text("Confirm"),
        ),
      ],
    );
  }
}