import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/onboardingModel.dart';

class OnBoardingservices {
  Future <OnboardingModel> getOnboardingDate() async {
    try{
     var response=await Api().dio.get('/v1/onboarding');
     return OnboardingModel.fromJson(response.data);
    }catch(e){
      print("Error fetching onboarding data: $e");
    }
    return OnboardingModel();
  }
}
