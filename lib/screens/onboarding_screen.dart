import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/widgets/onboardinr/dot_indicator.dart';
import 'package:coda_workshop/widgets/onboardinr/onBoardingBotton.dart';
import 'package:coda_workshop/widgets/onboardinr/onboardingPageVeiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onpoardingScreen extends StatelessWidget {
  const onpoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.put(OnboardingController());
    return Stack(
      children: [
        OnboardingPageView(),
        Column(
          children: [
            SizedBox(
              height: 570,
            ),
            dotIndicator(),
            SizedBox(
              height: 100,
            ),
            ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Obx(() => onBoardingBotton(
                          onPressed: () {
                            controller.next();
                          },
                          bottomTitle: "${controller.button_title}",
                        )
                  
                    )),
          ],
        ),
      ],
    );
  }
}
