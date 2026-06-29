import 'package:al_hadara/View/OnBording/Widget/Custom_View_Component.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDoctorPageView extends StatelessWidget {
  CustomDoctorPageView({super.key, @required this.pageController});
  PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomViewComponent(
            imagePath: 'assets/Image/Auth_Image/Pre_both.png',
            title: 'Welcome'.tr,
            text: 'To Al Hadara Application'.tr),
        CustomViewComponent(
            imagePath: 'assets/Image/Auth_Image/Doctor_2.png',
            title: "We're here".tr,
            text: 'to simplify your business.'.tr),
        CustomViewComponent(
            imagePath: 'assets/Image/Auth_Image/Doctor_3.png',
            title: 'We enable you to'.tr,
            text: 'manage appointments, records, tests, and even supplies.'.tr),
      ],
    );
  }
}
