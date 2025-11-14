import 'package:flutter/material.dart';

class onboardingTextFeild extends StatelessWidget {
    String? hintText;
String? labelText;
   onboardingTextFeild({super.key,required this.hintText,required this.labelText});

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),//تغير الارتفاع
                  isDense: true,
                  suffixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  hintText:hintText ,
                  labelText:labelText,

                  floatingLabelBehavior: FloatingLabelBehavior.always,

                  labelStyle:
                      TextStyle(color: Colors.grey.shade700, fontSize: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  //border in normal
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  //focus
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                ),
              );
  }
}