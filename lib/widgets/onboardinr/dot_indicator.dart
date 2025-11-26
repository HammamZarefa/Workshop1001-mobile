import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dotIndicator extends StatelessWidget {
   dotIndicator({super.key});
  OnboardingController controller = Get.put(OnboardingController());//*** */
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  controller.pages.length,///****** */
                  (index) => AnimatedContainer(
                    duration: Duration(
                      milliseconds: 350,
                    ),
                    margin: EdgeInsets.only(right: 5, bottom: 20),
                    height: 5,
                    width: controller.currentpage == index ? 15 : 5,
                    decoration: BoxDecoration(
                        color: controller.currentpage == index
                            ? appColors.primary
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(90)),
                  ),
                )
              ],
            ));
  }
}
