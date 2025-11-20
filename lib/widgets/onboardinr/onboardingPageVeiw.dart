import 'package:coda_workshop/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coda_workshop/controllers/onboarding_controller.dart';

class OnboardingPageView extends StatelessWidget {
  final OnboardingController controller = Get.find<OnboardingController>();
  void Function(int)? onPageChanged;
    OnboardingPageView({super.key, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: onPageChanged,
      itemCount: controller.pageCount,
      itemBuilder: (context, index) {
        final page = controller.pages[index];

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 10),
                    child: Text(
                      page.title!,
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
                        page.subtitle!,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    height: Get.height * 0.3,
                    width: Get.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        page.images!.first.url!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 40),
                    child: Text(
                      page.description!,
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
