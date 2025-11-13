import 'package:coda_workshop/models/onboarding.dart';
import 'package:coda_workshop/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OnboardingController extends GetxController {
  final box = GetStorage();
  var pageIndex = 0.obs;

  final pages = [
    OnboardingPageModel(
      image: 'assets/logo/logo.png',
      title: 'CODA',
      description: 'Welcome to CODA app Let Shop',
    ),
    OnboardingPageModel(
      image: 'assets/logo/logo.png',
      title: 'CODA',
      description: 'We Halp Paople Conect with store around United State Of American',
    ),
        OnboardingPageModel(
      image: 'assets/logo/logo.png',
      title: 'CODA',
      description: 'We Halp Paople Conect with store around United State Of American',
    ),
  ];

  void nextPage() {
    if (pageIndex.value == pages.length - 1) {
      finishOnboarding();
    } else {
      pageIndex.value++;
    }
  }

  void skip() => finishOnboarding();

  void finishOnboarding() {
    box.write('seenOnboarding', true);
    Get.off(() => HomeScreen());
  }
}
