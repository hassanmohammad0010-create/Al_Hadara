import 'package:al_hadara/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale intialLang = languageSharedPreferences!.getString("language") == null
      ? const Locale('en')
      : Locale(languageSharedPreferences!.getString("language").toString());

  void arabicLanguage() {
    Locale locale = const Locale('ar');
    languageSharedPreferences!.setString('language', 'ar');
    Get.updateLocale(locale);
  }

  void englishLanguage() {
    Locale locale = const Locale('en');
    languageSharedPreferences!.setString('language', 'en');
    Get.updateLocale(locale);
  }
}
