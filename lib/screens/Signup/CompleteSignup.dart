import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/widgets/Auth/authTextFeild.dart';
import 'package:coda_workshop/widgets/custom_widget.dart';
import 'package:flutter/material.dart';

class Completesignup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  'Complete Profile',
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
              labelText: 'First Name',
              hintText: "Enter your first name",
              obscureText: false,
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 10),
            AuthTextFeild(
              labelText: 'Last Name',
              hintText: "Enter your last name",
              obscureText: false,
              prefixIcon: Icons.person,
            ),
                        const SizedBox(height: 10),
            AuthTextFeild(
              labelText: 'Phone Number',
              hintText: "Enter your phone number",
              obscureText: false,
              prefixIcon: Icons.phone_android,
            ),
            const SizedBox(height: 10),
            AuthTextFeild(
              labelText: 'Address',
              hintText: "Enter your address",
              obscureText: false,
              prefixIcon: Icons.location_pin,
              
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 30,
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
              height: 10,
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
                Text('Login',style: TextStyle(color: appColors.primary),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
