import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/models/categoryModel.dart' ;
import 'package:coda_workshop/models/products_model.dart';
import 'package:coda_workshop/services/home/homeServeces.dart';
import 'package:coda_workshop/services/prodoct_service.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  List<BanerData> pannerData = [];
  List<CategoryData> catigures = [];
  List<Data> special = [
    // SpecialModel(
    //     image: ImageAssets.logo, title: "Smartphone", subtitle: "18 Brands"),
    // SpecialModel(
    //     image: ImageAssets.facebook,
    //     title: "Smartphone",
    //     subtitle: "18 Brands"),
    // SpecialModel(
    //     image: ImageAssets.facebook,
    //     title: "Smartphone",
    //     subtitle: "18 Brands"),
    // SpecialModel(
    //     image: ImageAssets.twitter, title: "Smartphone", subtitle: "18 Brands"),
    // SpecialModel(
    //     image: ImageAssets.google, title: "Smartphone", subtitle: "18 Brands"),
  ];
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
      var response = await ProdoctService().getproducts();
      popular =
          response.data?.where((item) => item.isFeatured == true).toList() ??
              [];
      update();
    } catch (e) {
      print("❌ Error in getPopular: $e");
    }
  }

  Future getSpecial() async {
    try {
      var response = await ProdoctService().getproducts();
      special =
          response.data?.where((item) => item.isSpecial == true).toList() ??
              [];
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
