import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/services/prodoct_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class ProductController extends GetxController {
  List<Data> products = [];
  List<Data> productsid = [];

  GetStorage box = GetStorage();

  int page = 1;
  bool isLoading = false;
  bool isMoreLoading = false;
  final int limit = 10;

  @override
  void onInit() {
    getproductsData();
    super.onInit();
  }

  Future<void> getProductsByCategory(int categoryId) async {
    try {
      isLoading = true;
      update();

      var response = await ProdoctService().getproducts();

      productsid = response.data
              ?.where((item) => item.categoryId == categoryId)
              .toList() ??
          [];

      isLoading = false;
      update();
    } catch (e) {
      print("Error getProductsByCategory: $e");
      isLoading = false;
      update();
    }
  }

  Future<ProductModel> getproductsData() async {
    try {
      isLoading = true;
      update();

      var token = box.read("token");
      print("Token: $token");

      var res = await ProdoctService().getproducts(page: page, limit: limit);

      products = res.data!;

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
      var res = await ProdoctService().getproducts(page: page, limit: limit);

      products.addAll(res.data!);

      isMoreLoading = false;
      update();
    } catch (e) {
      isMoreLoading = false;
      update();
    }
  }
}
