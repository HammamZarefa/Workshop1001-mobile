import 'package:coda_workshop/controllers/onbordingcontroller/onbordingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class Onbordingbutton extends StatelessWidget {
  const Onbordingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
    
    GetBuilder<OnbordingcontrolerImp>(
      builder: (controller) => 
    Container(
      
      width: Get.width*0.9,
      height: Get.height*0.06,
      
      child:MaterialButton(
        
       // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color.fromARGB(255, 228, 112, 66),
      
      
        onPressed: (){
      
      controller.next();
     
        },
        
        child:Text(
      
      textAlign: TextAlign.center,



"${controller.title}"

        

  





        ,style: TextStyle(
      
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold
        ),
        
        
        ),
        
        
        
        )
      
        ,
      
      ),
    );
  }
}