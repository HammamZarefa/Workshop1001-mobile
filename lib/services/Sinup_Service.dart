import 'package:coda_workshop/api/api.dart';

class SinupService {
  Future<dynamic> postSignUpData(
    email,
    String password,
    String password_confirmation,
    String firstName,
    String lastName,
    String phonenumper,
    String locition,
  ) async {
    try {
      var res = await Api().dio.post(
        'api/v1/register',
        data: {
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
          "first_name": firstName,
          "last_name": lastName,
          "phone": phonenumper,
          "address": locition,
        },
      );

      print("REQUEST BODY:");
      print({
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phonenumper,
        "address": locition,
      });
      return res.data;
    } catch (e) {
      print("Sign up error: $e");
    }
  }
}
