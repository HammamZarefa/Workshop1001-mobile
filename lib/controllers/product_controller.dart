import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/services/prodoct_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class ProductController extends GetxController {
  List<Data> products = [];
  Data productById = Data();
  final GetStorage box = GetStorage();

  int page = 1;
  bool isLoading = false;
  bool isMoreLoading = false;
  final int limit = 10;

  int productId = 0;
  int rating = 0;
  String comment = "";

  RxDouble averageRating = 0.0.obs;

  @override
  void onInit() {
    getProductData();

    super.onInit();
  }

  Future<ProductModel> getProductData() async {
    try {
      isLoading = true;
      update();

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

      double backendRating = res.averageRating?.toDouble() ?? 0.0;

      box.write('averageRating_${id}', backendRating);

      averageRating.value = box.read('averageRating_${id}') ?? backendRating;

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

        double newRating = productById.averageRating?.toDouble() ?? 0.0;
        box.write('averageRating_${productId}', newRating);
        averageRating.value = newRating;

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
