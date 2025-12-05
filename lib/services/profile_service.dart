import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/MyAccount_Model.dart';

class ProfileService {
  Future<ModelMyAccount> getmyaccount() async {
    try {
      var res = await Api().dio!.get('api/v1/profile');
      return ModelMyAccount.fromJson(res.data);
    } catch (e) {
      print("myaccount Service Error: $e");
      return ModelMyAccount();
    }
  }

  Future<bool> updateAccount(
      String firstName,
      String lastName,
      String email,
      String phone,
      String address) async {
    try {
      var res = await Api().dio!.put(
        'api/v1/profile',
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone": phone,
          "address": address,
        },
      );

      return true;
    } catch (e) {
      print("Update Error: $e");
      return false;
    }
  }
}