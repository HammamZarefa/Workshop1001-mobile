import 'dart:ffi';

import 'package:coda_workshop/models/onbording/onbordingstatic.dart';
import 'package:coda_workshop/routes/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class Onbordingcontroller extends GetxController{

next();
onbordingchange(int index);

changebutton();

}

class OnbordingcontrolerImp extends Onbordingcontroller{

  late PageController pageController;
   int currenpage = 0;
  
   
String title="next";

  next() {
   



currenpage++;

   changebutton();

if(currenpage>onbordinglist.length-1){

Get.toNamed(AppRoutes.homescreen);


}
else{

  pageController.animateToPage(currenpage,
          duration: const Duration(microseconds: 900), curve: Curves.easeInOut);



}

  }

  @override

  
  onbordingchange(int index) {

currenpage=index;

update();
  }

@override
  void onInit() {
   

   pageController=PageController();
    super.onInit();

  }
  
  
 @override
  void changebutton() {
   
if(currenpage<onbordinglist.length-1){

title="next";

update();

}else if(currenpage==onbordinglist.length-1){


title="countinue";

  update();
}




  }}
 














