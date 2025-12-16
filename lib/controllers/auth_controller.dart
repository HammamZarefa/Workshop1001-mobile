import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhoto = ''.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> initGoogle() async {
    // لازم تنفذ مرة واحدة قبل الاستخدام
    await _googleSignIn.initialize();
  }

  Future<void> googleLogin() async {
    try {
      // authenticate هو method الجديد بدل signIn()
      final googleUser = await _googleSignIn.authenticate();
      if (googleUser != null) {
        userName.value = googleUser.displayName ?? '';
        userEmail.value = googleUser.email;
        userPhoto.value = googleUser.photoUrl ?? '';
      }
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    userName.value = '';
    userEmail.value = '';
    userPhoto.value = '';
  }
}
