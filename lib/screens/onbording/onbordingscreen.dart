import 'package:coda_workshop/controllers/onbordingcontroller/onbordingcontroller.dart';
import 'package:coda_workshop/screens/onbording/widget/button.dart';
import 'package:coda_workshop/screens/onbording/widget/dotonbording.dart';
import 'package:coda_workshop/screens/onbording/widget/onbordingbody.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Onbordingscreen extends StatelessWidget {
  const Onbordingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnbordingcontrolerImp());
    return Scaffold(

backgroundColor: Colors.white,
body: SafeArea(child: 

Stack(children: [Column(


children: [


Expanded(
  flex: 3,
  
  child: 
Onbordingbody()
),

Expanded(
  
  flex: 1,
  
  child: 

Column(children: [


Onbordingdot(),

SizedBox(height: 130),

Onbordingbutton(),

],)





)









],











)],)


),









    );
    
    
    
    
    
    
  }
}