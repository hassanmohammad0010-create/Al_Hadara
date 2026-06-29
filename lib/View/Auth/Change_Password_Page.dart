import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Function/Shared/Validation.dart';
import 'package:al_hadara/View/Auth/Sign_in_View_Page.dart';
import 'package:al_hadara/Widget/Auth/Custom_Buttom.dart';
import 'package:al_hadara/Widget/Auth/Custom_Circle.dart';

import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  GlobalKey<FormState> changePasswordKey = GlobalKey();
  String pageName = '/ChangePassword';
  String? firstPassword, secondPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: constGreyColor,
        body: Form(
          key: changePasswordKey,
          child: Center(
              child: Stack(
            children: [
              SizedBox(
                width: 450,
                height: 850,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/Image/Auth_Image/Reset_password-.png',
                        width: 420,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Enter new password:".tr,
                          style: const TextStyle(
                              fontSize: 24, fontFamily: gabriela),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormFaild(
                        maxLine: 1,
                        icon: const Icon(
                          Icons.password,
                          color: constColor,
                        ),
                        labelText: "Password".tr,
                        onChange: (data) {},
                        validator: (data) {
                          firstPassword = data;
                          return Validarot().passwordValidator(firstPassword!);
                        }),
                    CustomTextFormFaild(
                        maxLine: 1,
                        icon: const Icon(
                          Icons.password,
                          color: constColor,
                        ),
                        labelText: "Confirm Password".tr,
                        onChange: (data) {},
                        validator: (data) {
                          secondPassword = data;
                          return Validarot().passwordValidator(secondPassword!);
                        }),
                  ],
                ),
              ),
              Positioned(
                width: 600,
                left: -120,
                bottom: -440,
                child: CustomCircle(
                  height: 600,
                  width: 600,
                  columnChild: Padding(
                    padding: const EdgeInsets.only(top: 70, left: 30),
                    child: Column(
                      children: [
                        CustomButtom(
                            text: "Complete".tr,
                            ontap: () {
                              if (firstPassword != null &&
                                  secondPassword != null) {
                                if (firstPassword != secondPassword) {
                                  customSnackBar(
                                      title: "Worning".tr,
                                      message: "Passwords do not match".tr);
                                }
                              }
                              if (changePasswordKey.currentState!.validate()) {
                                Get.offNamed(SigninPage().pageName);
                                customSnackBar(
                                    title: "Success".tr,
                                    message: "Password has been changed".tr);
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
