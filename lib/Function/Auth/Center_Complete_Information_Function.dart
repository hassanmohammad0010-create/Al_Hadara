import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Check_Internet.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Service/Auth/Center_Complete_Information_Service.dart';
import 'package:al_hadara/View/OnBording/Doctor_OnBording/On_Bording_Doctor_View.dart';
import 'package:get/get.dart';

Future<String> centerCompleteInformationFunction({
  required String name,
  required String location,
  required String startDay,
  required String endDay,
  required String startHour,
  required String endHour,
}) async {
  if (await checkInternet()) {
    String response = await CenterCompleteInformationService()
        .completeCenterInformation(
            location: location,
            statDay: startDay,
            endDay: endDay,
            startTime: startHour,
            endTime: endHour,
            name: name);

    if (response == success) {
      customSnackBar(
          title: 'Success',
          message: "The information has been filled in successfully");
      Get.offAllNamed(OnBordingDoctorViewPage().pageName);
    } else {
      customSnackBar(title: warning, message: "Something's wrong");
    }
  } else {
    customSnackBar(title: warning, message: "please check the internet");
  }
  return '';
}
