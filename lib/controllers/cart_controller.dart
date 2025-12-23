import 'package:coda_workshop/models/cart_model.dart';
import 'package:coda_workshop/services/home/cartServeces.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  CartData? serverCart;

  CartServeces cartServices = CartServeces();
  double discountValue = 0.0;
  String voucherCode = "";
  GetStorage box = GetStorage();
  bool? offer;
  bool isLoading = true;

  // Server functions
  Future<void> getServerCart() async {
    try {
      isLoading=false;
      var res = await cartServices.GetCart();

      serverCart = res.data;
      update();
    } catch (e) {
      print("Error fetching server cart: $e");
    }
  }

  Future<void> addToCart(int productId, double price, int quantity) async {
    try {
      var response = await cartServices.postCart(productId, price, quantity);

      if (response != null) {
      } else {
        Get.snackbar("Error", "Server error");
      }
      await getServerCart();
    } catch (e) {
      print("Error adding to server cart: $e");
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await cartServices.deleteFromCart(id);
      await getServerCart();
    } catch (e) {
      print("Delete item failed: $e");
    }
    update();
  }

  Future<void> clearCart() async {
    if (serverCart?.items == null) return;

    try {
      for (var item in serverCart!.items!) {
        await cartServices.deleteFromCart(item.id!);
        await getServerCart();
      }

      serverCart!.items!.clear();
      update();
    } catch (e) {
      print("Error clearing cart items: $e");
    }
  }

  // total price
  double get totalPrice {
    double total = 0.0;
    for (var item in serverCart!.items!) {
      total += item.subtotal ?? 0;
    }
    return total - discountValue;
  }

  // voucher code
  void applyVoucher(String code) {
    offer = box.read("offer");
    if (offer == false || offer == null) {
      if (code == "Off10") {
        box.write("offer", true);
        discountValue = totalPrice * 0.10;
        voucherCode = code;
        Get.snackbar("Success", "Voucher applied: \$10 discount");
      } else if (code == "Off20") {
        box.write("offer", true);
        discountValue = totalPrice * 0.20;
        voucherCode = code;
        Get.snackbar("Success", "20% discount applied");
      } else {
        discountValue = 0.0;
        voucherCode = "";
        Get.snackbar("Error", "Invalid voucher code");
      }
    } else {
      Get.snackbar("Error", "You have already used a voucher");
    }
    update();
  }

  Future<void> placeOrderCOD() async {
    try {
      if ((serverCart?.items ?? []).isEmpty) {
        Get.snackbar("Error", "Your cart is empty");
        return;
      }

      var orderData = {
        "items": (serverCart?.items ?? [])
            .map((item) => {
                  "product_id": item.product?.id,
                  "quantity": int.parse(item.quantity ?? "1"),
                  "price": double.parse(item.price ?? "0"),
                })
            .toList(),
        "payment_method": "COD",
        "total": totalPrice,
      };

      print("Order Data: $orderData");

      Get.snackbar(
          "Success", "Order placed successfully with Cash on Delivery");

      serverCart?.items?.clear();
      discountValue = 0.0;
      voucherCode = "";
      update();
    } catch (e) {
      Get.snackbar("Error", "Failed to place order: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getServerCart();
  }
}
