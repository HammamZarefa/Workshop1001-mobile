import 'package:coda_workshop/controllers/onbordingcontroller/onbordingcontroller.dart';
import 'package:coda_workshop/models/onbording/onbordingstatic.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Onbordingdot extends StatelessWidget {
  const Onbordingdot({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnbordingcontrolerImp>(
        builder: (controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                  onbordinglist.length,
                  (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 10),
                        duration: const Duration(milliseconds: 900),
                        height: 6,
                        width: controller.currenpage == index ?  20: 5,
                        decoration: BoxDecoration(
                          color: controller.currenpage == index
                              ? Colors.deepOrange
                              : Colors.grey, 
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )),
            ]
            )
            );
  }
}