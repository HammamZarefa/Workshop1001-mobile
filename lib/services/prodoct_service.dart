import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/products_model.dart';

class ProdoctService {
  Future<ProductModel> getProducts({int page = 1, int limit = 10}) async {
    try {
      var res = await Api().dio?.get(
        'api/v1/products',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      return ProductModel.fromJson(res!.data);
    } catch (e) {
      print("Product Service Error: $e");
      return ProductModel();
    }
  }

  // Future<Data> getProductShow(int id

  // ) async {
  //   try {
  //     var res = await Api().dio.get('api/v1/products/$id');
  //     return Data.fromJson(res.data);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return Data();
  // }

  Future<Data> getProductShow(int id) async {
    try {
      var res = await Api().dio.get('api/v1/products/$id');

      return Data.fromJson(res.data["data"]["product"]);
    } catch (e) {
      print("Get product error: $e");
      return Data();
    }
  }

  Future<dynamic> postRatingData(
  int product_id, // ← استخدم int بدل double
  int rating,     // ← استخدم int بدل double
  String comment,
) async {
  try {
    var res = await Api().dio.post(
      'api/v1/ratings',
      data: {
        "product_id": product_id.toString(),
        "rating": rating.toString(),
        "comment": comment,
      },
    );

    print("REQUEST BODY:");
    print({
      "product_id": product_id.toString(),
      "rating": rating.toString(),
      "comment": comment,
    });

    return res.data;
  } catch (e) {
    print("Rating error: $e");
    return null;
  }
}
}
