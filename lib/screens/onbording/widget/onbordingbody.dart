
import 'package:coda_workshop/controllers/onbordingcontroller/onbordingcontroller.dart';
import 'package:coda_workshop/models/onbording/onbordingstatic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Onbordingbody extends GetView<OnbordingcontrolerImp> {
  const Onbordingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      
     controller: controller.pageController, 
      
      onPageChanged: (value) {
        controller.onbordingchange(value);
      },
      
      itemCount:onbordinglist.length ,
      itemBuilder: (context, i) => Column(

children: [

SizedBox(height: 50),


Text(onbordinglist[i].title!,style: TextStyle(


color: const Color.fromARGB(255, 241, 81, 18),
fontSize: 40,
fontWeight: FontWeight.bold,
  

),),


SizedBox(height: 5),


Container(
  
height: Get.height*0.2,width: Get.width*1,

 padding:  EdgeInsets.symmetric(horizontal: 10),
  child: 



Text(onbordinglist[i].body!,

textAlign: TextAlign.center,

style: TextStyle(

fontSize: 20,


fontWeight:FontWeight.w500,

),


),
),


Image.asset(onbordinglist[i].image!,height: Get.height*0.3,width: Get.width*0.9,)



],




      ),);




  }


}




