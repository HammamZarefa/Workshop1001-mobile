import 'package:coda_workshop/api/api.dart';
import 'package:dio/dio.dart';

class SignUpServive {
  Future<dynamic> postSignUpData(
    String email,
    String password,
    String passwordconfirmation,
    String firstName,
    String lastName,
    String phone,
    String address,
  ) async {
    try {
      var res = await Api().dio.post(
        'api/v1/register',
        data: {
          "email": email,
          "password": password,
          "password_confirmation": password,
          "first_name": firstName,
          "last_name": lastName,
          "phone": phone,
          "address": address,
        },
      );

      print("REQUEST BODY:");
      print({
        "email": email,
        "password": password,
        "password_confirmation": passwordconfirmation,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
      });
      return res.data;
    } catch (e) {
      print("Sign up error: $e");
    }
  }
}
