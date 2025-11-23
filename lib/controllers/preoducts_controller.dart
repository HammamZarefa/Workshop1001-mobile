import 'package:coda_workshop/constant/imageAssets.dart';
import 'package:coda_workshop/models/products_model.dart';
import 'package:get/get.dart';


class ProductController extends GetxController {


  //  bool favorite=true;

  List<ProductModel> products = [];

  @override
  void onInit() {
    super.onInit();
    loadProducts();
// favorite;
  }

  void loadProducts() {
    products = [
      ProductModel(image: imageAssets.shin, name: "Nike sport white _man part", price: 20),
      ProductModel(image: imageAssets.shin, name: "Nike sport white _man part", price: 35),
      ProductModel(image: imageAssets.shin, name: "Nike sport white _man part", price: 50),
      ProductModel(image: imageAssets.shin, name: "Nike sport white _man part", price: 15),
    ];

    update(); // تحديث الواجهة
  }


     changeFavorite(index){

 products[index].favorite = !products[index].favorite;
  update();



     }


}