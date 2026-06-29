import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Check_Internet.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Service/Auth/Signin_Service.dart';
import 'package:al_hadara/View/App/CenterApp.dart';
import 'package:al_hadara/View/App/Doctor_App.dart';
import 'package:al_hadara/View/App/Sick_App.dart';
import 'package:al_hadara/main.dart';

import 'package:get/get.dart';

Future<String> signinFunction({
  required String email,
  required String password,
}) async {
  if (await checkInternet()) {
    String respose =
        await SigninService().signin(email: email, password: password);
    if (respose == success) {
      customSnackBar(title: "Success", message: "Welcome back");
      if (identitySharedPreferences!.getString("identity") == 'center') {
        Get.toNamed(CenterApp().pageName);
      } else if (identitySharedPreferences!.getString("identity") == 'doctor') {
        Get.toNamed(DoctorApp().pageName);
      } else if (identitySharedPreferences!.getString("identity") ==
          'patient') {
        Get.offAllNamed(SickApp().pageName);
      }
    } else if (respose == fail) {
      customSnackBar(
          title: warning,
          message: "Please make sure the information is correct.");
    }
  } else {
    customSnackBar(title: warning, message: "Please check internet");
  }
  return '';
}
