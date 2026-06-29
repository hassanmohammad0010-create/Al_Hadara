import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Function/Auth/Center_Complete_Information_Function.dart';

import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CenterCompleteInformationPage extends StatelessWidget {
  CenterCompleteInformationPage({super.key, this.name});
  GlobalKey<FormState> centerInformationKey = GlobalKey();
  String pageName = '/CenterCompleteInformation';
  LoadingIndcatorController loadingIndcatorController =
      Get.put(LoadingIndcatorController());
  String? location, startDay, endDay, startHour, endHour, name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constGreyColor,
        body: GetBuilder<LoadingIndcatorController>(builder: (controller) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: centerInformationKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Complete".tr,
                          style: const TextStyle(
                              fontFamily: pacifico,
                              fontSize: 40,
                              color: constColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const CircleAvatar(radius: 100),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomDropDown(
                            itemList: ["Damascuse"],
                            hintText: "Location".tr,
                            icon: const Icon(Icons.location_on),
                            onChanched: (data) {
                              location = data;
                            }),
                        CustomDropDown(
                            itemList: weekDay,
                            hintText: "Start Day".tr,
                            icon: const Icon(Icons.calendar_month_rounded),
                            onChanched: (data) {
                              startDay = data;
                            }),
                        CustomDropDown(
                            itemList: weekDay,
                            hintText: "End Day".tr,
                            icon: const Icon(Icons.calendar_month_rounded),
                            onChanched: (data) {
                              endDay = data;
                            }),
                        CustomDropDown(
                            itemList: hourDay,
                            hintText: "Start Hour".tr,
                            icon: const Icon(Icons.access_time_filled_sharp),
                            onChanched: (data) {
                              startHour = data;
                            }),
                        CustomDropDown(
                            itemList: hourDay,
                            hintText: "End Hour".tr,
                            icon: const Icon(Icons.access_time_filled_sharp),
                            onChanched: (data) {
                              endHour = data;
                            }),
                        const SizedBox(
                          height: 32,
                        ),
                        CustomColoredButtom(
                          text: "Complete".tr,
                          ontap: () async {
                            if (centerInformationKey.currentState!.validate()) {
                              loadingIndcatorController.isLoading();
                              await centerCompleteInformationFunction(
                                  name: 'name'!,
                                  location: 'Damascus'!,
                                  startDay: '2025-08-05'!,
                                  endDay: '2025-08-05'!,
                                  startHour: '14:30'!,
                                  endHour: '14:30'!);
                              loadingIndcatorController.isntLoading();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              CustomLoading(load: controller.load)
            ],
          );
        }));
  }
}
