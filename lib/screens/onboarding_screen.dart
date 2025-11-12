import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/onboarding_controller.dart';
import 'package:coda_workshop/widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class onpoardingScreen extends StatelessWidget {
  const onpoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.put(OnboardingController());
    return Stack(
      children: [
        PageView.builder(
          // physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.currentpage = value;
            controller.textbutton();
            controller.update();
            print("${controller.currentpage}");
          },
          itemCount: controller.pageCount,
          itemBuilder: (context, index) {
            return Scaffold(
              // backgroundColor: appColors.background,

              body: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(
                          "CODA",
                          style: TextStyle(
                              color: appColors.primary,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "${controller.pages[index].title}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Image.asset(
                        "${controller.pages[index].image}",
                        // height: Get.height * 0.7,
                        width: Get.width * 0.7,
                      ),
                      SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Column(
          children: [
            SizedBox(
              height: 550,
            ),
            dotIndicator(),
            SizedBox(
              height: 100,
            ),
            ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Obx(
                  () => MaterialButton(
                    onPressed: () {
                      controller.next();
                      //  index++;
                    },
                    child: Text(
                      "${controller.button_title}",
                      style:
                          TextStyle(fontSize: 20, color: appColors.background),
                    ),
                    color: appColors.primary,
                    minWidth: 300,
                    height: 50,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
