import 'package:coda_workshop/models/bannerModel.dart';
import 'package:coda_workshop/services/home/bannerServices.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart' hide Data;

class homeController extends GetxController {
  List<Data> pannerData = [];

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
