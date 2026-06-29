import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Validation.dart';
import 'package:al_hadara/View/Auth/Change_Password_Page.dart';
import 'package:al_hadara/Widget/Auth/Custom_Buttom.dart';
import 'package:al_hadara/Widget/Auth/Custom_Circle.dart';

import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EnterEmailPage extends StatelessWidget {
  EnterEmailPage({super.key});
  String pageName = '/EnterEmail';
  GlobalKey<FormState> enterEmailKey = GlobalKey();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: constGreyColor,
        body: Form(
          key: enterEmailKey,
          child: Center(
              child: Stack(
            children: [
              SizedBox(
                width: 450,
                height: 850,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/Image/Auth_Image/Check_Email.png',
                        width: 420,
                        height: 380,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Enter Your Email:".tr,
                          style: const TextStyle(
                              fontSize: 24, fontFamily: gabriela),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          "to send a verification code".tr,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 22,
                              fontFamily: abhayaLibre,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9e9e9e)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormFaild(
                        maxLine: 1,
                        icon: const Icon(
                          Icons.email,
                          color: constColor,
                        ),
                        labelText: "Email".tr,
                        onChange: (data) {},
                        validator: (data) {
                          email = data;
                          return Validarot().emailValidate(email!);
                        }),
                  ],
                ),
              ),
              Positioned(
                  width: 700,
                  left: -150,
                  bottom: -420,
                  child: CustomCircle(
                    height: 700,
                    width: 700,
                    columnChild: Padding(
                      padding: const EdgeInsets.only(top: 90, left: 16),
                      child: Column(
                        children: [
                          CustomButtom(
                              text: "Next".tr,
                              ontap: () {
                                if (enterEmailKey.currentState!.validate()) {
                                  Get.toNamed(ChangePasswordPage().pageName);
                                }
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          )),
        ));
  }
}
