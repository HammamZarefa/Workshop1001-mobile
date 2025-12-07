import 'package:coda_workshop/api/database/sqlite.dart';
import 'package:coda_workshop/models/cart_model.dart';
import 'package:coda_workshop/services/home/cartServeces.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  // local
  List<Model> localCart = [];

  // server
  CartData? serverCart;

  CartServeces cartServices = CartServeces();
  double discountValue = 0.0;
  String voucherCode = "";
  GetStorage box = GetStorage();
  bool? offer;

  // Local functions
  Future<void> getLocalCart() async {
    final data = await DBHelper.instance.getAll();
    localCart = data.map((e) => Model.fromJson(e)).toList();
    update();
  }

  Future<void> addToLocalCart({
    required String name,
    required String image,
    required int count,
    required double price,
    int? productId,
  }) async {
    Model localItem = Model(
      name: name,
      image: image,
      count: count,
      price: price,
    );

    await DBHelper.instance.insert(localItem.toJson());
    await getLocalCart();

    if (productId != null) {
      await addToServerCart(productId, price, count);
    }

    update();
  }

  Future<void> deleteLocalItem(int id) async {
    await DBHelper.instance.delete(id);
    await getLocalCart();
  }

  // Server functions
  Future<void> getServerCart() async {
    try {
      var res = await cartServices.GetCart();
      serverCart = res.data;
      update();
    } catch (e) {
      print("Error fetching server cart: $e");
    }
  }

  Future<void> addToServerCart(
      int productId, double price, int quantity) async {
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

  // merge
  List<Items> get mergedCart {
    List<Items> merged = [];

    for (var item in localCart) {
      merged.add(Items(
        id: item.id,
        product: Product(
          id: item.id ?? 0,
          title: item.name,
          image: item.image,
        ),
        quantity: item.count.toString(),
        price: item.price.toString(),
        subtotal: (item.price * item.count).toInt(),
      ));
    }

    if (serverCart?.items != null) {
      merged.addAll(serverCart!.items!);
    }

    return merged;
  }

  // total price
  double get totalPrice {
    double total = 0.0;
    for (var item in mergedCart) {
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

  @override
  void onInit() {
    super.onInit();
    getLocalCart();
    getServerCart();
  }
}
