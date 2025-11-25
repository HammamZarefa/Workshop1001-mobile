import 'package:coda_workshop/api/database/sqlite.dart';
import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/product_model.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  List<CartModel> products = [];

  Future getCartProducts() async {
    final data = await DBHelper.instance.getAll();

    products = data.map((e) => CartModel.fromJson(e)).toList();

    update();
    return products;
  }

  Future addProductToCart(
      // String name, String image, int price, int count
      ) async {
    await DBHelper.instance.insert({
      "name": "Wireless Controller for PS4",
      "image": imageAssets.google,
      "count": 2,
      "price": 64.99,
    });
    await DBHelper.instance.insert({
      "name": "tablo",
      "image": imageAssets.facebook,
      "count": 4,
      "price": 25.10,
    });
  }

 Future deleteProduct(int id) async {
    await DBHelper.instance.delete(id);
    getCartProducts();
  }

  @override
  void onInit() {
    getCartProducts();
    // TODO: implement onInit
    super.onInit();
  }
}
