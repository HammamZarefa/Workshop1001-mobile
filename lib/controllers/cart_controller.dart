import 'package:coda_workshop/api/database/sqlite.dart';
import 'package:coda_workshop/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  List<CartModel> localProducts = [];
    List<CartModel> serverProducts = [];

  double total = 0;
  double discountValue = 0.0;
  String voucherCode = "";
  GetStorage box = GetStorage();
  bool? offer;
  Future getCartProducts() async {
    final data = await DBHelper.instance.getAll();

    localProducts = data.map((e) => CartModel.fromJson(e)).toList();

    update();
    return localProducts;
  }

  void applyVoucher(String code) {
    offer = box.read("offer");
    if (offer == false || offer == null) {
      if (code == "Off10") {
        box.write("offer", true);

        discountValue = totalPrice * 0.10;
        total = total - discountValue;
        update();
        voucherCode = code;
        Get.snackbar("Success", "Voucher applied: \$10 discount");
      } else if (code == "Off20") {
        box.write("offer", true);

        discountValue = totalPrice * 0.20;
        total = total - discountValue;
        update();
        voucherCode = code;
        Get.snackbar("Success", "20% discount applied");
      } else {
        discountValue = 0;
        voucherCode = "";
        Get.snackbar("Error", "Invalid voucher code");
      }
    } else {
      Get.snackbar("Error", "you inpute already");
    }
    update();
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in localProducts) {
      total += item.price * item.count;
    }
    return total - discountValue;
  }

Future addProductToCart({
  required String name,
  required String image,
  required int count,
  required double price,
}) async {
  await DBHelper.instance.insert({
    "name": name,
    "image": image,
    "count": count,
    "price": price,
  });
}

  Future deleteProduct(int id) async {
    await DBHelper.instance.delete(id);
    getCartProducts();
  }

  @override
  void onInit() {
    totalPrice;
    getCartProducts();
    // TODO: implement onInit
    super.onInit();
  }
}
