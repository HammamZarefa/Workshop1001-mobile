import 'package:coda_workshop/api/api.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInServive {

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
        },
      );

      return res.data;
    } catch (e) {
      print("Log In error: $e");
    }
  }

  Future<dynamic> loginFirebase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("User not logged in with Firebase");
      }

      final idToken = await user.getIdToken();

      var res = await Api().dio.post(
        'api/auth/firebase',
        options: Options(
          headers: {
            // 'Authorization': 'Bearer $idToken',
            // 'Accept': 'application/json',
          },
        ),
      );

      return res.data;
    } catch (e) {
      print("Firebase Login error: $e");
    }
  }
}
