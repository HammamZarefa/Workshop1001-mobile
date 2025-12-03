// import 'package:coda_workshop/constant/colors.dart';
// import 'package:coda_workshop/controllers/Auth/signUp_controller.dart';
// import 'package:coda_workshop/functions/validInput.dart';
// import 'package:coda_workshop/widgets/Auth/appBarTitle.dart';
// import 'package:coda_workshop/widgets/Auth/authMaterialButton.dart';
// import 'package:coda_workshop/widgets/Auth/authSubTitle.dart';
// import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
// import 'package:coda_workshop/widgets/Auth/authTitle.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CompleteSignup extends StatelessWidget {
//   CompleteSignup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SignUpController>(
//         builder: (controller) => Form(
//               key: controller.completeForm,
//               child: Scaffold(
//                 backgroundColor: AppColors.background,
//                 body: ListView(
//                   physics: NeverScrollableScrollPhysics(),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 50.0),
//                       child: AppParTilte(
//                         appbarTilte: 'Sign Up',
//                       ),
//                     ),
//                     AuthTitle(title: "Complete Profile"),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 5,
//                         bottom: 10,
//                       ),
//                       child: AuthSubTitle(
//                         subtitle:
//                             'Complete your details or continue\n with social media',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 15.0, left: 10, right: 10, bottom: 10),
//                       child: Authtextfeild(
//                         hintText: "Enter your first name",
//                         labelText: "First Name",
//                         icon: Icons.person_outlined,
//                         obscureText: false,
//                         mycontroller: controller.firstName,
//                         validator: (Value) {
//                           return validInput(Value!, 3, 10, "username");
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 15.0, left: 10, right: 10, bottom: 10),
//                       child: Authtextfeild(
//                         hintText: "Enter your last name",
//                         labelText: "Last Name",
//                         icon: Icons.person_outlined,
//                         obscureText: false,
//                         mycontroller: controller.lastName,
//                         validator: (Value) {
//                           return validInput(Value!, 3, 10, "username");
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 15.0, left: 10, right: 10, bottom: 10),
//                       child: Authtextfeild(
//                         hintText: "Enter your phone number",
//                         labelText: "Phone Number",
//                         icon: Icons.phone_android,
//                         obscureText: false,
//                         keyboardType: TextInputType.phone,
//                         mycontroller: controller.phone,
//                         validator: (Value) {
//                           return validInput(Value!, 9, 20, "phone");
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 15.0, left: 10, right: 10, bottom: 10),
//                       child: Authtextfeild(
//                         hintText: "Enter your address",
//                         labelText: "Adrress",
//                         icon: Icons.location_history,
//                         obscureText: false,
//                         mycontroller: controller.address,
//                         validator: (Value) {
//                           return validInput(Value!, 5, 20, "location");
//                         },
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: AuthGradientButton(
//                           title: "Continue",
//                           onPressed: () {
//                             // print("Button clicked!");
//                             controller.signup();
//                           },
//                         )),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 10, left: 18, right: 18),
//                       child: Text(
//                         "By continuing your confirm that you agree\n with our Term and Condition",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
