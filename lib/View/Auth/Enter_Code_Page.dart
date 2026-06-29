import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/View/App/Sick_Personal_Page.dart';

import 'package:al_hadara/Widget/Auth/Custom_Otb.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EnterCodePage extends StatelessWidget {
  EnterCodePage({super.key});
  String pageName = '/EnterCode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: constGreyColor,
        body: Center(
            child: Stack(
          children: [
            SizedBox(
              width: 450,
              height: 850,
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/Image/Auth_Image/Code.png',
                      width: 420,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Please check your email.".tr,
                        style:
                            const TextStyle(fontSize: 24, fontFamily: gabriela),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "We have send the verification code to the email.".tr,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 22,
                            fontFamily: abhayaLibre,
                            fontWeight: FontWeight.bold,
                            color: constWhiteGreyColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomOtb(onSubmit: (data) {
                    Get.toNamed(SickPersonalPage().pageName);
                  })
                ],
              ),
            ),
          ],
        )));
  }
}
