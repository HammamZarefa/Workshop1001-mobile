import 'package:coda_workshop/api/api.dart';

class ForgotpasswordService {
  Future<dynamic> postForgotpasswordData(
    email,
  ) async {
    try {
      var res = await Api().dio.post(
        'api/v1/login',
        data: {
          "email": email,
        },
      );

      print("REQUEST BODY:");
      print({
        "email": email,
      });
      return res.data;
    } catch (e) {
      print("Forgotpassword error: $e");
    }
  }
}
