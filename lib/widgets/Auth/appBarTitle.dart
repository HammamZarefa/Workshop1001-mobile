import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class appParTilte extends StatelessWidget {
  appParTilte({super.key, required this.appbarTilte});
  String? appbarTilte;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      backgroundColor: appColors.background,
      title: Center(
        child: Text(
          appbarTilte!,
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
