import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/bannerModel.dart';


class homeServices {
 Future<bannerModel> getbanner() async {
  try {
   var res = await Api().dio.get(
  'api/v1/getActiveBanners',
  
);
    print("API Response: ${res.data}");
    return bannerModel.fromJson(res.data);
  } catch (e) {
    print("Error in getbanner: $e");
  }
  return bannerModel(data: []);
}
}