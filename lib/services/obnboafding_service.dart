import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/onboardingModel.dart';

class ObnboardingService {
  Future<OnBoardingModel> getOnboarging() async {
    try {
      var res = await Api().dio?.get('v1/onboarding');
      return OnBoardingModel.fromJson(res!.data);
    } catch (e) {
      print(e);
    }
    return OnBoardingModel();
  }
}
