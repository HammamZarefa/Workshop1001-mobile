
import 'package:coda_workshop/utiles/constant/imagasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [

Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [


Container(

child: 
Image.asset(AppImageAsset.logo,height: Get.height*0.4,width: Get.width*0.4,)

),
  
SizedBox(height: 20,),

Container(
  

  child: Text(
  
  
  "CODA",style: TextStyle(color: const Color.fromARGB(255, 241, 81, 18),
  
fontSize: 40,
fontWeight: FontWeight.bold,
  
  ),)

,)





  
],


),




    

]);

  }
}