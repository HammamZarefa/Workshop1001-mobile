import 'dart:developer';

import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/onboardingModel.dart';

class Onbordingservices {

Future<OnBoardingModel> onboardingModel()async{

 try {
  var reponse  = await Api().dio.get('v1/onbarding');
return OnBoardingModel.fromJson(reponse.data);
}
 catch (e) {
  log(e.toString());
  
}
return onboardingModel();

}


}