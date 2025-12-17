import 'package:coda_workshop/api/api.dart';

class ResendVerificationService {
  Future<dynamic> postResendverificationData(
    email,
  ) async {
    try {
      var res = await Api().dio.post(
        'api/v1/reset-password',
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
      print("Resendverification error: $e");
    }
  }
}
