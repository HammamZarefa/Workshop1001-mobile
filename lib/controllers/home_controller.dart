import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/services/home/homeServeces.dart';
import 'package:coda_workshop/services/prodoct_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProductController productController = Get.put(ProductController());

  List<BanerData> pannerData = [];
  List<CategoryData> catigures = [];
  List<Data> special = [];
  List<Data> popular = [];
  List<Data> products = [];
  Future getPanner() async {
    try {
      var response = await homeServices().getbanner();
      pannerData = response.data ?? [];
      update();
    } catch (e) {
      print("Error in getPanner: $e");
    }
  }

  Future getcategories() async {
    try {
      var response = await homeServices().getcategories();
      catigures = response.data ?? [];
      update();
    } catch (e) {
      print("Error in getcategories: $e");
    }
  }

  Future getProducts() async {
    try {
      var res = await ProdoctService().getProducts();
      products = res.data ?? [];
      popular = products.where((item) => item.isFeatured == true).toList();
      special = products.where((item) => item.isSpecial == true).toList();
      update();
    } catch (e) {
      print("❌ Error in getProducts: $e");
    }
  }

  @override
  void onInit() {
    getProducts();
    getPanner();
    getcategories();
    print("onInit called");
    // TODO: implement onInit
    super.onInit();
  }
}
