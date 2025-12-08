// import 'package:coda_workshop/routes/routes.dart';
// import 'package:coda_workshop/services/Sinup_Service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class SinUpController extends GetxController {
//   bool isShow = false;
//   TextEditingController? email;
//   TextEditingController? password;
//   TextEditingController? password_confirmation;
//   TextEditingController? firstName;
//   TextEditingController? lastName;
//   TextEditingController? phonenumper;
//   TextEditingController? locition;

//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//   GlobalKey<FormState> completeForm = GlobalKey<FormState>();

//   GetStorage box = GetStorage();

//   validateSignup() {
//     var formdata = formstate.currentState;
//     if (formdata!.validate()) {
//       Get.toNamed(AppRoutes.Complet_profile);
//     }
//   }

//   validateSignupComplete() {
//     var formdata = completeForm.currentState;
//     if (formdata!.validate()) {
//       signup();
//     }
//   }

//   Future signup() async {
//     try {
//       var response = await signUpServive().postSignUpData(
//         email!.text,
//         password!.text,
//         password_confirmation!.text,
//         firstName!.text,
//         lastName!.text,
//         phonenumper!.text,
//         locition!.text,
//       );
//       if (response != null) {
//         if ((response["token"] != null)) {
//           Get.offAllNamed(AppRoutes.HomeScreen);
//         } else {
//           Get.snackbar("Error", response["message"] ?? "Unknown error");
//         }
//       } else {
//         Get.snackbar("Error", "Server error");
//       }
//     } catch (e) {}
//   }

//   showPassword() {
//     if (isShow == false) {
//       isShow = true;
//       update();
//     } else if (isShow == true) {
//       isShow = false;
//       update();
//     }

//     update();
//   }

//   @override
//   void onInit() {
//     email = TextEditingController();
//     password = TextEditingController();
//     password_confirmation = TextEditingController();
//     firstName = TextEditingController();
//     lastName = TextEditingController();
//     phonenumper = TextEditingController();
//     locition = TextEditingController();
//     isShow;
//     // TODO: implement onInit
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     email!.dispose();
//     password!.dispose();
//     password_confirmation!.dispose();
//     firstName!.dispose();
//     lastName!.dispose();
//     phonenumper!.dispose();
//     locition!.dispose();

//     super.dispose();
//   }
// }
