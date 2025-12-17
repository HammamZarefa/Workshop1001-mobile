import 'package:coda_workshop/api/api.dart';

class OtpVierificationService {
  Future<dynamic> postOtpvierificaionData(
    email,
    String otp,

      

  ) async {
    try {
      var res = await Api().dio.post(
            'api/v1/register',
            data: {
              "email": email,
                "otp": otp,
            },
            
          );
     
      print("REQUEST BODY:");
      print({
        "email": email,
         "otp": otp,
       
      });
      return res.data;
    } catch (e) {
      print("otp vierification error: $e");
    }
  }
}


