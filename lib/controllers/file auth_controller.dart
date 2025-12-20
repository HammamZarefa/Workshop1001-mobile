import 'package:coda_workshop/routes/routes.dart';
import 'package:coda_workshop/services/Auth/login_service.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        String? firebaseIdToken = await user.getIdToken();
        print("🔥 /////////Firebase ID Token:");
        print(firebaseIdToken);
        Get.offNamed(AppRoutes.mainScreen);

      }
      final box = GetStorage();

      await LogInServive().loginFirebase();
      final res = await LogInServive().loginFirebase();

      if (res != null && res['token'] != null) {
        box.write('token', res['token']);
      }
    } catch (e) {
      Get.snackbar("Error::", e.toString());
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}