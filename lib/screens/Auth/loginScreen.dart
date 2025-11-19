import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/screens/ForgetPassword/forgetPassword.dart';
import 'package:coda_workshop/screens/Signup/signup.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        leading: backWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in with your email and password or continue with social media',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            AuthTextFeild(
              labelText: 'Email',
              hintText: "Email",
              obscureText: false,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 10),
            AuthTextFeild(
              labelText: 'Password',
              hintText: "Password",
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                checkbox(),
                Text("Remember me"),
                Container(
                    padding: EdgeInsets.only(left: 100),
                    child: InkWell(
                      onTap: () {
                        Get.to(Forgetpassword());
                      },
                      child: Text(
                        'Forget Password',
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.primary,
                ),
                onPressed: () {},
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?  '),
                InkWell(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: appColors.primary,
                    ),
                  ),
                  onTap: () {
                    Get.to(SignupScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
