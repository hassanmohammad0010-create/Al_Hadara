import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Auth/Splash_View_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashViewPage extends StatelessWidget {
  SplashViewPage({super.key});
  SplashViewController controller = Get.put(SplashViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<SplashViewController>(builder: (controller) {
      return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              constColor,
              consttwisColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Image/Logo.png',
                height: 250,
              ),
            ],
          ));
    }));
  }
}
