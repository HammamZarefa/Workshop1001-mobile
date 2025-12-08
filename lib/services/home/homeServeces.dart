import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/models/categoryModel.dart';

class homeServices {
  Future<BannerModel> getbanner() async {
    try {
      var res = await Api().dio.get(
            'api/v1/getActiveBanners',
          );
      print("API Response: ${res.data}");
      return BannerModel.fromJson(res.data);
    } catch (e) {
      print("Error in getbanner: $e");
    }
    return BannerModel(data: []);
  }
   Future<CategoryModel> getcategories() async {
    try {
      var res = await Api().dio.get(
            'api/v1/categories',
          );
      print("API Response: ${res.data}");
      return CategoryModel.fromJson(res.data);
    } catch (e) {
      print("Error in getbanner: $e");
    }
    return CategoryModel(data: []);
  }
}
