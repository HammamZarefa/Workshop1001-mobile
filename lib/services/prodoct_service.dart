// import 'package:coda_workshop/api/api.dart';

// import 'package:coda_workshop/models/products_model.dart';

// class ProdoctService {
//   Future<ProductModel> getproducts() async {
//     try {
//       var res = await Api().dio?.get('v1/products');
//       return ProductModel.fromJson(res!.data);
//     } catch (e) {
//       print(e);
//     }
//     return ProductModel();
//   }
// }



import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/products_model.dart';

class ProdoctService {
  Future<ProductModel> getproducts({int page = 1, int limit = 10}) async {
    try {
      var res = await Api().dio?.get(
        'v1/products',
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


  Future<Data> getProductShow(int id
   
  ) async {
    try {
      var res = await Api().dio.get('api/v1/products/$id');
      return Data.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return Data();
  }



















}