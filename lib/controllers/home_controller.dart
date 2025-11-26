import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/models/popularProdutsModel.dart';
import 'package:coda_workshop/models/specialModel.dart';
import 'package:coda_workshop/services/home/bannerServices.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class HomeController extends GetxController {
  List<Data> pannerData = [];
  List<CategoryModel> catigures = [
    CategoryModel(image: ImageAssets.facebook, name: "facebook"),
    CategoryModel(image: ImageAssets.twitter, name: "twitter"),
    CategoryModel(image: ImageAssets.facebook, name: "facebook"),
    CategoryModel(image: ImageAssets.twitter, name: "twitter"),
    CategoryModel(image: ImageAssets.facebook, name: "facebook"),
    CategoryModel(image: ImageAssets.twitter, name: "twitter"),
    CategoryModel(image: ImageAssets.facebook, name: "facebook"),
    CategoryModel(image: ImageAssets.twitter, name: "twitter"),
  ];
  List<SpecialModel> special = [
    SpecialModel(
        image: ImageAssets.logo, title: "Smartphone", subtitle: "18 Brands"),
    SpecialModel(
        image: ImageAssets.facebook,
        title: "Smartphone",
        subtitle: "18 Brands"),
    SpecialModel(
        image: ImageAssets.facebook,
        title: "Smartphone",
        subtitle: "18 Brands"),
    SpecialModel(
        image: ImageAssets.twitter, title: "Smartphone", subtitle: "18 Brands"),
    SpecialModel(
        image: ImageAssets.google, title: "Smartphone", subtitle: "18 Brands"),
  ];
  List<PopulerModel> popular = [
    PopulerModel(image: ImageAssets.logo, name: "Wireless Controller"),
    PopulerModel(
        image: ImageAssets.facebook, name: "Nike Sport White- man pant"),
    PopulerModel(image: ImageAssets.facebook, name: "Gloves "),
    PopulerModel(
        image: ImageAssets.twitter, name: "Nike Sport White- man pant"),
    PopulerModel(image: ImageAssets.google, name: "Wireless Controller"),
  ];
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
      var response = await homeServices().getbanner();
      pannerData = response.data ?? [];
      update();
    } catch (e) {
      print("Error in getPanner: $e");
    }
  }

  @override
  void onInit() {
  
    getPanner();
    print("onInit called");
    // TODO: implement onInit
    super.onInit();
  }
}
