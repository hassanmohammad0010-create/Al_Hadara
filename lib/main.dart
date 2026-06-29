// import 'package:al_hadara/Locale/Locale_Conroller.dart';
// import 'package:al_hadara/Locale/local.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/CenterHomePage.dart';
import 'package:al_hadara/Hamed/view/pages/doctorPage.dart/doctor_home_page.dart';
import 'package:al_hadara/View/App/CenterApp.dart';
import 'package:al_hadara/View/App/Doctor_App.dart';
import 'package:al_hadara/View/App/Sick_Analysis_Information_Display_Page.dart';
import 'package:al_hadara/View/App/Sick_App.dart';
import 'package:al_hadara/View/App/Sick_Center_Information_Display_Page.dart';
import 'package:al_hadara/View/App/Sick_Clinic_Information_Dispaly_Page.dart';
import 'package:al_hadara/View/App/Sick_Doctor_Information_Display_Page.dart';
import 'package:al_hadara/View/App/Sick_Laboratory_Information_Dispaly_Page.dart';
import 'package:al_hadara/View/App/Sick_Personal_Page.dart';
import 'package:al_hadara/View/Auth/Center_Complete_Information_Page.dart';
import 'package:al_hadara/View/Auth/Change_Password_Page.dart';
import 'package:al_hadara/View/Auth/Doctor_Complete_Information_Page.dart';
import 'package:al_hadara/View/Auth/Enter_Code_Page.dart';
import 'package:al_hadara/View/Auth/Enter_Email_View_Page.dart';
import 'package:al_hadara/View/Auth/Reception_View_Page.dart';
import 'package:al_hadara/View/Auth/Sick_Complete_information_Page.dart';
import 'package:al_hadara/View/Auth/Sign_in_View_Page.dart';
import 'package:al_hadara/View/Auth/Sign_up_View_Page.dart';
import 'package:al_hadara/View/Auth/Splash_View_Page.dart';
import 'package:al_hadara/View/OnBording/Doctor_OnBording/On_Bording_Doctor_View.dart';
import 'package:al_hadara/View/OnBording/Sick_OnBording/On_Bording_Sick_View.dart';
import 'package:al_hadara/View/App/Sick_Chat_Page.dart';
import 'package:al_hadara/View/Setting/Report_Page.dart';
import 'package:al_hadara/View/Setting/Suggestion_Page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? tokenSharedPreferences;
SharedPreferences? identitySharedPreferences;
SharedPreferences? languageSharedPreferences;
SharedPreferences? idSharedPreferences;

void main() async {
  WidgetsFlutterBinding();
  tokenSharedPreferences = await SharedPreferences.getInstance();
  identitySharedPreferences = await SharedPreferences.getInstance();
  languageSharedPreferences = await SharedPreferences.getInstance();
  idSharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocaleController localeController = Get.put(LocaleController());

    return GetMaterialApp(
      // translations: MyLocale(),
      // theme: Themes.customdark,
      // locale: localeController.intialLang,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/Splash',
          page: () => SplashViewPage(),
        ),
        GetPage(
          name: '/centerHome',
          page: () => CenterHomePage(),
        ),
        GetPage(
          name: '/Reception',
          page: () => ReceptionPage(),
          // middlewares: [AuthMaddleware()],
        ),
        GetPage(
          name: '/Signin',
          page: () => SigninPage(),
        ),
        GetPage(
          name: '/Signup',
          page: () => SignupPage(),
        ),
        GetPage(
          name: '/EnterEmail',
          page: () => EnterEmailPage(),
        ),
        GetPage(
          name: '/EnterCode',
          page: () => EnterCodePage(),
        ),
        GetPage(
          name: '/ChangePassword',
          page: () => ChangePasswordPage(),
        ),
        GetPage(
          name: '/OnBordingDoctorView',
          page: () => OnBordingDoctorViewPage(),
        ),
        GetPage(
          name: '/OnBordingSickView',
          page: () => OnBordingSickViewPage(),
        ),
        GetPage(
          name: '/DoctorCompleteInformation',
          page: () => DoctorCompleteInformationPage(),
        ),
        GetPage(
          name: '/CenterCompleteInformation',
          page: () => CenterCompleteInformationPage(),
        ),
        GetPage(
          name: '/SickPersonal',
          page: () => SickPersonalPage(),
        ),
        GetPage(
          name: '/SickCenterInformationDispaly',
          page: () => SickCenterInformationDispalyPage(),
        ),
        GetPage(
          name: '/SickLaboratoryInformationDispaly',
          page: () => SickLaboratoryInformationDispalyPage(),
        ),
        GetPage(
          name: '/SickAnalysisInformationDisplay',
          page: () => SickAnalysisInformationDisplayPage(),
        ),
        GetPage(
          name: '/SickClinicInformationDisplay',
          page: () => SickClinicInformationDisplayPage(),
        ),
        GetPage(
          name: '/SickDoctorInformationDisplay',
          page: () => SickDoctorInformationDisplayPage(),
        ),
        GetPage(
          name: '/SickChat',
          page: () => SickChatPage(),
        ),
        GetPage(
          name: '/SickApp',
          page: () => SickApp(),
        ),
        GetPage(
          name: '/SuggestionPage',
          page: () => SuggestionPage(),
        ),
        GetPage(
          name: '/ReportPage',
          page: () => ReportPage(),
        ),
        GetPage(
          name: '/SickCompleteInformationPage',
          page: () => SickCompleteInformationPage(),
        ),
        GetPage(
          name: '/DoctorApp',
          page: () => DoctorApp(),
        ),
        GetPage(
          name: '/CenterApp',
          page: () => CenterApp(),
        ),
        GetPage(
          name: '/centerHome',
          page: () => CenterHomePage(),
        ),
        GetPage(
          name: '/DoctorHome',
          page: () => DoctorHomePage(),
        ),
      ],
      initialRoute: '/Splash',
    );
  }
}
