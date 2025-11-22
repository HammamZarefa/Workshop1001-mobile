import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/models/categoryModel.dart';
import 'package:coda_workshop/models/popularProdutsModel.dart';
import 'package:coda_workshop/models/specialModel.dart';
import 'package:coda_workshop/services/home/bannerServices.dart';
import 'package:coda_workshop/widgets/home/specialList.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class homeController extends GetxController {
  List<Data> pannerData = [];
  List<categoryModel> catigures = [
    categoryModel(image: imageAssets.facebook, name: "facebook"),
    categoryModel(image: imageAssets.twitter, name: "twitter"),
    categoryModel(image: imageAssets.facebook, name: "facebook"),
    categoryModel(image: imageAssets.twitter, name: "twitter"),
    categoryModel(image: imageAssets.facebook, name: "facebook"),
    categoryModel(image: imageAssets.twitter, name: "twitter"),
    categoryModel(image: imageAssets.facebook, name: "facebook"),
    categoryModel(image: imageAssets.twitter, name: "twitter"),
  ];
  List<specialModel> special = [
    specialModel(
        image: imageAssets.logo, title: "Smartphone", subtitle: "18 Brands"),
    specialModel(
        image: imageAssets.facebook,
        title: "Smartphone",
        subtitle: "18 Brands"),
    specialModel(
        image: imageAssets.facebook,
        title: "Smartphone",
        subtitle: "18 Brands"),
    specialModel(
        image: imageAssets.twitter, title: "Smartphone", subtitle: "18 Brands"),
    specialModel(
        image: imageAssets.google, title: "Smartphone", subtitle: "18 Brands"),
  ];
  List<populerModel> popular = [
    populerModel(
        image: imageAssets.logo,name: "Wireless Controller" ),
    populerModel(
        image: imageAssets.facebook,
        name: "Nike Sport White- man pant"
       ),
    populerModel(
        image: imageAssets.facebook,
        name: "Gloves "
       ),
    populerModel(
        image: imageAssets.twitter,        name: "Nike Sport White- man pant"
),
    populerModel(
        image: imageAssets.google, name: "Wireless Controller"),
  ];
  Future getPanner() async {
    final box = GetStorage();
    var token = box.read("token");

    if (token == null) {
      await Future.doWhile(() async {
        return token == null;
      });
    }

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
    //    Future.delayed(const Duration(milliseconds: 300), () {
    //   getPanner();
    // });
    getPanner();
    print("onInit called");
    // TODO: implement onInit
    super.onInit();
  }
}
