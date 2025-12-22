import 'package:coda_workshop/controllers/cart_controller.dart';
import 'package:coda_workshop/models/cart_model.dart';
import 'package:coda_workshop/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  String? shippingAddress;
  String? currency;
  List<Items> orderItems = [];
  late TextEditingController addressController;
  late TextEditingController currencyController;

  OrderService orderService = OrderService();
  Future<String?> sendOrder({
    required List<Items> orderItems,
  }) async {
    try {
      final order = await orderService.postOrder(
        addressController.text.trim(),
        currencyController.text.trim(),
        orderItems,
      );

      if (order != null) {
        Get.find<CartController>().clearCart();
        Get.find<CartController>().getServerCart();

        return order.message;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  void onInit() {
    addressController = TextEditingController();
    currencyController = TextEditingController(text: "SYR");
    // TODO: implement onInit
    super.onInit();
  }
}
