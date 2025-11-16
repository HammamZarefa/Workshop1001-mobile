import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Textformfiled extends StatelessWidget {
  const Textformfiled({
    super.key,
    this.iconData,
    required this.hintText,
    required this.leabeltext,
    required this.valid,
    this.mycontrller,
  });

  final String hintText;
  final String leabeltext;
  final IconData? iconData;
  final TextEditingController? mycontrller;
  final String? Function(String?) valid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: valid,
        controller: mycontrller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          label: Text(
            leabeltext,
            style: TextStyle(
              color: const Color.fromARGB(255, 90, 76, 76),
              fontWeight: FontWeight.bold,
            ),
          ),
          suffixIcon: InkWell(
            child: Icon(iconData),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}



