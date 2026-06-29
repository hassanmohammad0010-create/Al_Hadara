import 'package:al_hadara/View/App/CenterApp.dart';
import 'package:al_hadara/View/App/Doctor_App.dart';
import 'package:al_hadara/View/App/Sick_App.dart';
import 'package:al_hadara/View/Auth/Reception_View_Page.dart';
import 'package:al_hadara/main.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class AuthMaddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return tokenSharedPreferences!.getString('token')!.isEmpty
        ? RouteSettings(name: ReceptionPage().pageName)
        : idSharedPreferences!.getString('identity') == 'center'
            ? RouteSettings(name: CenterApp().pageName)
            : idSharedPreferences!.getString('identity') == 'doctor'
                ? RouteSettings(name: DoctorApp().pageName)
                : RouteSettings(name: SickApp().pageName);
  }
}
