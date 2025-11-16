import 'package:flutter/material.dart';

class Donthave_anacount extends StatelessWidget {
  const Donthave_anacount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account ?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: const Color.fromARGB(255, 228, 112, 66),
                  fontSize: 15,
                ),
              ))
        ],
      ),
    );
  }
}
