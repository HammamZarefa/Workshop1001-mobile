import 'package:coda_workshop/controllers/preoducts_controller.dart';
import 'package:coda_workshop/controllers/product_controller.dart';
import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/services/home/homeServeces.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
   ProductController  productController =Get.put(ProductController());

  List<BanerData> pannerData = [];
  List<CategoryData> catigures = [];
  List<Data> special = [];
  List<Data> popular = [];
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

  Future getPopular() async {
    try {
      popular =
          productController.products.where((item) => item.isFeatured == true).toList() ??
              [];
      update();
    } catch (e) {
      print("❌ Error in getPopular: $e");
    }
  }

  Future getSpecial() async {
    try {
      special =
          productController.products.where((item) => item.isSpecial == true).toList() ?? [];
      update();
    } catch (e) {
      print(" Error in getSpecial***************************: $e");
    }
  }

  @override
  void onInit() {
    getSpecial();
    getPanner();
    getcategories();
    getPopular();
    print("onInit called");
    // TODO: implement onInit
    super.onInit();
  }
}
