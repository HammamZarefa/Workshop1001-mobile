import 'package:coda_workshop/api/api.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future<dynamic> postLoginData(
           email,
    String password,
  



  ) async {
    try {
      var res = await Api().dio.post(
            'api/v1/login',
            data: {
              "email": email,
              "password": password,
             
            },
            
          );
     
      print("REQUEST BODY:");
      print({
        "email": email,
        "password": password,
     
      });
      return res.data;
    } catch (e) {
      print("Login error: $e");
    }
  }
}
