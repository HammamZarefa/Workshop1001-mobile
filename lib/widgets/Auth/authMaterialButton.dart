// import 'package:coda_workshop/constant/colors.dart';
// import 'package:coda_workshop/widgets/Auth/RaisedGradientButton.dart';
// import 'package:flutter/material.dart';

// class authMaterialButton extends StatelessWidget {
//   final void Function()? onPressed;

//   authMaterialButton({super.key, required this.onPressed});
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//         borderRadius: BorderRadiusGeometry.circular(17),
//         child: RaisedGradientButton(
//           onPressed: onPressed,
//           child: Text(
//             "Continue",
//             style: TextStyle(fontSize: 20, color: appColors.background),
//           ),
//           // color: appColors.primary,
//           // minWidth: 300,
//           height: 50,
//         ));
//   }
// }
import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final void Function()? onPressed;

  const AuthGradientButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              appColors.primary,
            ],
          ),
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: appColors.background,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
