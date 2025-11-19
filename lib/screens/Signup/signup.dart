import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/screens/Auth/loginScreen.dart';
import 'package:coda_workshop/screens/Signup/CompleteSignup.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),centerTitle: true,
        leading: backWidget(),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Register Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 8),
                Text(
                  'Complete your details or continue with social media',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            AuthTextFeild(
              labelText: 'Email',
              hintText: "Enter your email",
              obscureText: false,
              prefixIcon: Icons.email_outlined,

            ),
            const SizedBox(height: 20),
            AuthTextFeild(
              labelText: 'Password',
              hintText: "Enter your password",
              obscureText: true,
              prefixIcon: Icons.lock_outlined,
            ),
            const SizedBox(height: 20),
            AuthTextFeild(
              labelText: 'Confirm Password',
              hintText: "Confirm password",
              obscureText: true,
              prefixIcon: Icons.lock_outlined,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColors.primary,
                  ),
                  onPressed: () {
                    Get.to(Completesignup());
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.facebook, size: 40)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.facebook, size: 40)),
              ],

            ),
            InkWell(
                  onTap: () {
                    Get.to(loginscreen());
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: appColors.primary,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
