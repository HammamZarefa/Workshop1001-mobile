import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/services/prodoct_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class ProductController extends GetxController {
  List<Data> products = [];
  List<Data> productsid = [];
  String? searchWord; //+
  GetStorage box = GetStorage(); //+
  List<Data> searchResult = []; //** */
  int page = 1;
  bool isLoading = false;
  bool isMoreLoading = false;
  final int limit = 10;

  ////
  Data productById = Data();

  int productId = 0;
  int rating = 0;
  String comment = "";
  RxDouble averageRating = 0.0.obs;

  ///

  @override
  void onInit() {
    getproductData();
    super.onInit();
  }

  void searchCompare() {
    if (searchWord == null || searchWord!.isEmpty) {
      searchResult = [];
    } else {
      searchResult = products
          .where((p) =>
              (p.title ?? "").toLowerCase().contains(searchWord!.toLowerCase()))
          .toList();
    }
    update();
  }

  Future<void> getProductsByCategory(int categoryId) async {
    try {
      isLoading = true;
      update();
      var res = await ProdoctService().getProducts(page: page, limit: limit);

      productsid =
          res.data!.where((item) => item.categoryId == categoryId).toList();

      isLoading = false;
      update();
    } catch (e) {
      print("Error getProductsByCategory: $e");
      isLoading = false;
      update();
    }
  }

  Future<ProductModel> getproductData() async {
    try {
      isLoading = true;
      update();

      var token = box.read("token") ?? "";
      print("Token: $token");

      var res = await ProdoctService().getProducts(page: page, limit: limit);
      products = res.data ?? [];

      isLoading = false;
      update();
      return res;
    } catch (e) {
      isLoading = false;
      update();
      return ProductModel();
    }
  }

  Future<void> loadMore() async {
    if (isMoreLoading) return;

    isMoreLoading = true;
    page++;
    update();

    try {
      var res = await ProdoctService().getProducts(page: page, limit: limit);
      products.addAll(res.data ?? []);

      isMoreLoading = false;
      update();
    } catch (e) {
      isMoreLoading = false;
      update();
    }
  }

  Future<void> showProduct(int id) async {
    try {
      isLoading = true;
      productById = Data();
      update();

      var res = await ProdoctService().getProductShow(id);
      productById = res;

      averageRating.value = res.averageRating?.toDouble() ?? 0.0;

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print("showProduct error: $e");
    }
  }

  Future<void> sendRating() async {
    try {
      var response = await ProdoctService().postRatingData(
        productId,
        rating,
        comment,
      );

      if (response != null) {
        await showProduct(productId);

        averageRating.value = productById.averageRating?.toDouble() ?? 0.0;

        Get.snackbar(
          "Success",
          "Rating sent successfully",
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to send rating",
        );
      }
    } catch (e) {
      print("Controller sendRating Error: $e");
    }
  }
}