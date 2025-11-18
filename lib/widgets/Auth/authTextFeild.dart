import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class AuthTextFeild extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final String labelText;
  

  const AuthTextFeild({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.prefixIcon,
    required this.labelText,

    
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
         floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        suffixIcon: Icon(prefixIcon,size: 20,color: Colors.black.withOpacity(0.5),),        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}