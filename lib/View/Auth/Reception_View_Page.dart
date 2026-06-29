import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/View/Auth/Sign_in_View_Page.dart';
import 'package:al_hadara/View/Auth/Sign_up_View_Page.dart';
import 'package:al_hadara/Widget/Auth/Custom_Buttom.dart';
import 'package:al_hadara/Widget/Auth/Custom_Circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ReceptionPage extends StatelessWidget {
  ReceptionPage({super.key});
  String pageName = '/Reception';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constGreyColor,
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: -120,
              top: -270,
              child: Container(
                width: 500,
                height: 600,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 340, left: 50),
                  child: Column(
                    children: [
                      Text(
                        "Welcome".tr,
                        style: const TextStyle(
                          fontSize: 46,

                          fontFamily: madimiOne,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "To Al hadara application".tr,
                        style: const TextStyle(
                            fontSize: 26, fontFamily: abhayaLibre
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                width: 700,
                left: -140,
                bottom: -180,
                child: CircleAvatar(
                  radius: 300,
                  child: CustomCircle(
                    height: 700,
                    width: 700,
                    columnChild: Padding(
                      padding: const EdgeInsets.only(top: 60, left: 20),
                      child: Column(
                        children: [
                          Text(
                            "Get Started".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 46,
                              fontFamily: abhayaLibre,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "with sign in or sign up".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: abhayaLibre
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Positioned(
                width: 800,
                left: -180,
                bottom: -350,
                child: CircleAvatar(
                  radius: 300,
                  child: CustomCircle(
                    height: 800,
                    width: 800,
                    columnChild: Padding(
                      padding: const EdgeInsets.only(
                        top: 100,
                      ),
                      child: Column(
                        children: [
                          CustomButtom(
                              text: "Sign up".tr,
                              ontap: () {
                                Get.toNamed(SignupPage().pageName);
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomButtom(
                              text: "Sign in".tr,
                              ontap: () {
                                Get.toNamed(SigninPage().pageName);
                              }),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
