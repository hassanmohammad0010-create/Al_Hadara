import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Check_Internet.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Service/Auth/Sick_Complete_Information_Service.dart';
import 'package:al_hadara/View/OnBording/Sick_OnBording/On_Bording_Sick_View.dart';
import 'package:get/get.dart';

Future<String> sickCompleteInformationFunction({
  required String name,
  required String gender,
  required String birthDay,
  required String bloodType,
  required String phoneNum,
}) async {
  if (await checkInternet()) {
    String response =
        await SickCompleteInformationService().completeSickInformation(
      name: name,
      phone: phoneNum,
      gender: gender,
      birthDate: birthDay,
      bloodType: bloodType,
    );
    if (response == success) {
      customSnackBar(
          title: 'Success', message: 'Welcome to al hadara application');
      Get.offAllNamed(OnBordingSickViewPage().pageName);
    } else {
      customSnackBar(title: warning, message: 'Something went wrong');
    }
  } else {
    customSnackBar(title: warning, message: 'Please check internet');
  }
  return '';
}
