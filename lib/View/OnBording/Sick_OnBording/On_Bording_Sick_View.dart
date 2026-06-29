import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/View/OnBording/Sick_OnBording/Custom_Sick_Page_View.dart';

import 'package:al_hadara/View/OnBording/Widget/Custom_Dots_Indicator.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OnBordingSickViewPage extends StatefulWidget {
  OnBordingSickViewPage({
    super.key,
  });
  String pageName = '/OnBordingSickView';
  @override
  State<OnBordingSickViewPage> createState() => _OnBordingSickViewPageState();
}

class _OnBordingSickViewPageState extends State<OnBordingSickViewPage> {
  PageController? pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constGreyColor,
      body: Stack(
        children: [
          CustomSickPageView(pageController: pageController),
          Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomDotsIndicator(
                dotsIndex:
                    pageController!.hasClients ? pageController?.page : 0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomColoredButtom(
                  text: pageController!.hasClients
                      ? (pageController?.page == 2
                          ? 'Get Started'.tr
                          : 'Next'.tr)
                      : 'Next'.tr,
                  ontap: () {
                    pageController!.page != 2
                        ? pageController!.nextPage(
                            duration: const Duration(
                              microseconds: 500,
                            ),
                            curve: Curves.linear)
                        : {
                            // onBordingPreferences!.setBool('1', true),
                            Get.offAllNamed('/SickApp')
                          };
                  },
                )),
          ),
          Visibility(
            visible: pageController!.hasClients
                ? (pageController?.page == 2 ? false : true)
                : true,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 32, top: 48),
                child: GestureDetector(
                  onTap: () {
                    // onBordingPreferences!.setBool('1', true);
                    // Get.toNamed(
                    //   '/Presentation',
                    // );
                  },
                  child: Text(
                    'Skip'.tr,
                    style: const TextStyle(
                        fontFamily: abhayaLibre,
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
