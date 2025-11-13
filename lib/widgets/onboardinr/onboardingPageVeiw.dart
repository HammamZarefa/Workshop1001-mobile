import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/onboarding_controller.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingController controller = OnboardingController();

  OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.currentpage = value;
        controller.textbutton();
       controller.update();
        print("Current page: ${controller.currentpage}");
      },
      itemCount: controller.pageCount,
      itemBuilder: (context, index) {
        final page = controller.pages[index];

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10), // 👈 استخدم const EdgeInsets.all بدل EdgeInsetsGeometry
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 10),
                    child: Text(
                      page.title,
                      style: TextStyle(
                        color: appColors.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: Get.height * 0.05,
                      child: Text(
                        page.subtitle,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.asset(
                      page.image,
                      width: Get.width * 0.7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
