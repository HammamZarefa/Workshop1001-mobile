import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/signupmodel.dart';

class SignUpservices {
  Future<SignUpModel> signup({required String email,required String password,required String confirmPassword,required String firstname,required String secondname,required String phone,required String address}) async {
    try{
     var response=await Api().dio.get('/v1/signup');
      if(response.statusCode==200){
        var data=response.data;
        return SignUpModel(
          email: data['email'],
          password: data['password'],
          confirmPassword: data['confirmpassword'],
          firstName: data['firstName'],
          lastName: data['lastName'],
          phone: data['phone'],
          address: data['address'],
        );
      }
    }catch(e){
      print("Error fetching Sign Up data: $e");
    }
    return SignUpModel(email: '', password: '',confirmPassword: '', firstName: '', lastName: '', phone: '', address: '');
  }
}
