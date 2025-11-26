import 'package:coda_workshop/api/api.dart';
import 'package:dio/dio.dart';

class logInServive {
  Future<dynamic> postLogInData(
   String email,
    String password,
   
  ) async {
    try {
      var res = await Api().dio.post(
            'api/v1/login',
            data: {
              "email": email,
              "password": password,
              "password_confirmation": password,
              
            },
            
          );
     
      print("REQUEST BODY:");
      print({
        "email": email,
        "password": password,
       
      });
      return res.data;
    } catch (e) {
      print("Log In error: $e");
    }
  }
}
