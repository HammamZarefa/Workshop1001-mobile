import 'dart:io';

import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/MyAccount_Model.dart';
import 'package:dio/dio.dart';

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

  Future<bool> updateAccount(String firstName, String lastName, String email,
      String phone, String address) async {
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

  Future<dynamic> postImageProfileData(File imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      var res = await Api().dio!.post(
            'api/v1/profile/upload-image',
            data: formData,
            options: Options(
              headers: {
                "Content-Type": "multipart/form-data",
              },
            ),
          );

      print("Image upload request sent successfully");
      return res.data;
    } catch (e) {
      print("ImageProfile error: $e");
      return null;
    }
  }

  Future<dynamic> PostlogoutData() async {
    try {
      var res = await Api().dio!.post('api/v1/logout');

      return res.data;
    } catch (e) {
      print("Logout error: $e");
    }
  }
}
