import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Function/Auth/Doctor_Complete_Information_Function.dart';

import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DoctorCompleteInformationPage extends StatelessWidget {
  DoctorCompleteInformationPage({super.key, this.name});
  String? sepcialization, startDay, endDay, startHour, endHour, name;
  GlobalKey<FormState> doctorInformationKey = GlobalKey();
  String pageName = '/DoctorCompleteInformation';
  LoadingIndcatorController loadingIndcatorController =
      Get.put(LoadingIndcatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constGreyColor,
        body: GetBuilder<LoadingIndcatorController>(builder: (controller) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: doctorInformationKey,
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
                            itemList: specializationList,
                            hintText: "Sepcialization".tr,
                            icon: const Icon(
                              Icons.star_outlined,
                              color: constColor,
                            ),
                            onChanched: (data) {
                              sepcialization = data;
                            }),
                        CustomDropDown(
                            itemList: weekDay,
                            hintText: "Start Day".tr,
                            icon: const Icon(
                              Icons.calendar_month_rounded,
                              color: constColor,
                            ),
                            onChanched: (data) {
                              startDay = data;
                            }),
                        CustomDropDown(
                            itemList: weekDay,
                            hintText: "End Day".tr,
                            icon: const Icon(
                              Icons.calendar_month_rounded,
                              color: constColor,
                            ),
                            onChanched: (data) {
                              endDay = data;
                            }),
                        CustomDropDown(
                            itemList: hourDay,
                            hintText: "Start Hour".tr,
                            icon: const Icon(
                              Icons.access_time_filled_sharp,
                              color: constColor,
                            ),
                            onChanched: (data) {
                              startHour = data;
                            }),
                        CustomDropDown(
                            itemList: hourDay,
                            hintText: "End Hour".tr,
                            icon: const Icon(
                              Icons.access_time_filled_sharp,
                              color: constColor,
                            ),
                            onChanched: (data) {
                              endHour = data;
                            }),
                        const SizedBox(
                          height: 32,
                        ),
                        CustomColoredButtom(
                          text: "Complete".tr,
                          ontap: () async {
                            if (doctorInformationKey.currentState!.validate()) {
                              loadingIndcatorController.isLoading();
                              await doctorCompleteInformationFunction(
                                  name: name!,
                                  sepcialization: sepcialization!,
                                  startDay: startDay!,
                                  endDay: endDay!,
                                  startHour: startHour!,
                                  endHour: endHour!);
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
