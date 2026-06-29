import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Swap_Buttom_Controller.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Locale/Locale_Conroller.dart';
import 'package:al_hadara/View/Auth/Reception_View_Page.dart';
import 'package:al_hadara/View/Setting/Report_Page.dart';
import 'package:al_hadara/View/Setting/Suggestion_Page.dart';
import 'package:al_hadara/Widget/Shared_Widget/Swap_Buttom.dart';
import 'package:al_hadara/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

SwapButtomController swapButtomController = Get.put(SwapButtomController());

List<String> language = ["Arabic".tr, "English".tr];
String dropdownvalue = 'Languauge'.tr;
LocaleController localeController = Get.find();

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 290,
            color: constColor,
            child: Column(
              children: [
                Image.asset('assets/Image/app/drawe.png', height: 250),
                Text(
                  'Al Hadara'.tr,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: abhayaLibre,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Dark Mode'.tr,
                    style: const TextStyle(
                      fontFamily: abhayaLibre,
                      fontSize: 22,
                    ),
                  ),
                  trailing: CustomSwapButtom(),
                ),
                ListTile(
                  title: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    hint: Text(
                      'Language'.tr,
                      style: const TextStyle(
                          fontFamily: abhayaLibre,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                    elevation: 10,
                    icon: const Icon(Icons.arrow_right),
                    items: language.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue == 'Arabic') {
                        localeController.arabicLanguage();
                      } else {
                        localeController.englishLanguage();
                      }
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  )),
                ),
                ListTile(
                    onTap: () {
                      Get.toNamed(SuggestionPage().pageName);
                    },
                    title: Text(
                      'Suggestion'.tr,
                      style: const TextStyle(
                        fontFamily: abhayaLibre,
                        fontSize: 22,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_right)),
                ListTile(
                    onTap: () {
                      Get.toNamed(ReportPage().pageName);
                    },
                    title: Text(
                      'Report'.tr,
                      style: const TextStyle(
                        fontFamily: abhayaLibre,
                        fontSize: 22,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_right)),
                ListTile(
                  title: Text(
                    'Delete my account'.tr,
                    style: const TextStyle(
                      fontFamily: abhayaLibre,
                      fontSize: 22,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.dialog(AlertDialog(
                      content: const Text(
                        'Are you sure you want to log out?',
                        style: TextStyle(fontFamily: abhayaLibre, fontSize: 22),
                      ),
                      actions: [
                        MaterialButton(
                          color: Colors.red,
                          onPressed: () {
                            tokenSharedPreferences!.clear();
                            identitySharedPreferences!.clear();
                            Get.offAllNamed(ReceptionPage().pageName);
                            customSnackBar(
                                title: 'ByeGood-bye',
                                message: 'I hope you have a nice day');
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: abhayaLibre,
                                fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Text(
                            'Cancle',
                            style: TextStyle(
                                color: constWhiteGreyColor,
                                fontFamily: abhayaLibre,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ));
                  },
                  title: Text(
                    'Log out'.tr,
                    style: const TextStyle(
                      fontFamily: abhayaLibre,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
