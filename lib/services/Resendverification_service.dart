import 'package:coda_workshop/api/api.dart';
import 'package:dio/dio.dart';

class ResendverificationService {
  Future<dynamic> postResendverificationData(
    email,
   

      

  ) async {
    try {
      var res = await Api().dio.post(
            'api/v1/register',
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

