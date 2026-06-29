import 'package:al_hadara/View/OnBording/Widget/Custom_View_Component.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomSickPageView extends StatelessWidget {
  CustomSickPageView({super.key, @required this.pageController});
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
            imagePath: 'assets/Image/Auth_Image/Sick_2.png',
            title: "Your Partner".tr,
            text: 'reaching the clinic you need and booking an appointmant'.tr),
        CustomViewComponent(
            imagePath: 'assets/Image/Auth_Image/Sick_3.png',
            title: 'Simplifying Processes'.tr,
            text: 'enhancing patient experience'.tr),
      ],
    );
  }
}
