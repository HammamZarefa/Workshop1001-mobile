import 'dart:developer';

import 'package:coda_workshop/api/api.dart';
import 'package:coda_workshop/models/onboardingModel.dart';

class Onbordingservices {

Future<OnBordingModel> onboardingModel()async{

 try {
  var reponse  = await Api().dio?.get('gj,gjgjdgjdgj');
return OnBordingModel.fromJson(reponse!.data);
}
 catch (e) {
  log(e.toString());
  
}
return onboardingModel();

}


}