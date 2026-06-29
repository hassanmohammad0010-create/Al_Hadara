import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Check_Internet.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Service/Auth/Signup_Service.dart';
import 'package:al_hadara/View/Auth/Center_Complete_Information_Page.dart';
import 'package:al_hadara/View/Auth/Doctor_Complete_Information_Page.dart';
import 'package:al_hadara/View/Auth/Sick_Complete_information_Page.dart';
import 'package:al_hadara/main.dart';
import 'package:get/get.dart';

Future<String> signupFunction(
    {required String userName,
    required String email,
    required String password,
    required String role}) async {
  if (await checkInternet()) {
    String response = await SignupService()
        .signup(name: userName, email: email, password: password, role: role);

    if (response == success) {
      customSnackBar(
          title: "Sign in success", message: "Welcome to our application ");
      if (identitySharedPreferences!.getString('identity') == 'center') {
        Get.toNamed(CenterCompleteInformationPage(
          name: userName,
        ).pageName);
      } else if (identitySharedPreferences!.getString('identity') == 'doctor') {
        Get.to(() => DoctorCompleteInformationPage(
              name: userName,
            ));
      } else if (identitySharedPreferences!.getString('identity') ==
          'patient') {
        Get.to(() => SickCompleteInformationPage(
              name: userName,
            ));
      }
    } else if (response == fail) {
      customSnackBar(title: warning, message: "The email already exists.");
    }
  } else {
    customSnackBar(title: warning, message: "Please check internet");
  }
  return '';
}
