import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/app/Get_Center_Information_Controller.dart';
import 'package:al_hadara/Controller/app/Get_Lab_Controller.dart';

import 'package:al_hadara/View/App/Sick_Clinic_Information_Dispaly_Page.dart';
import 'package:al_hadara/View/App/Sick_Laboratory_Information_Dispaly_Page.dart';
import 'package:al_hadara/Widget/App/Custom_Container.dart';
import 'package:al_hadara/Widget/App/Custom_Row.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SickCenterInformationDispalyPage extends StatelessWidget {
  SickCenterInformationDispalyPage({super.key});
  String pageName = '/SickCenterInformationDispaly';
  GetCenterInformationController getCenterInformationController =
      Get.put(GetCenterInformationController(), permanent: true);
  GetLabController getLabController = Get.put(GetLabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<GetCenterInformationController>(builder: (controller) {
      return (getCenterInformationController.centerModel == null ||
              getLabController.labModel == null)
          ? CustomLoading(load: true)
          : SingleChildScrollView(
              // Wrap the content in SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: constColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(logoImage, scale: 1),
                            ),
                            const SizedBox(width: 56),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  getCenterInformationController
                                      .centerModel!.name,
                                  style: const TextStyle(
                                      fontSize: 32, fontFamily: gabriela),
                                ),
                                Text(
                                  "Center".tr,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontFamily: gabriela,
                                      color: constColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomRow(
                          icons: Icons.location_on,
                          text: getCenterInformationController
                              .centerModel!.location,
                        ),
                        CustomRow(
                          icons: Icons.schedule_sharp,
                          text:
                              "From ${getCenterInformationController.centerModel!.startTime.substring(0, 5)} to ${getCenterInformationController.centerModel!.endTime.substring(0, 5)} ",
                        ),
                        CustomRow(
                          icons: Icons.calendar_month_sharp,
                          text:
                              "From ${getCenterInformationController.centerModel!.startDay} to ${getCenterInformationController.centerModel!.endDay} ",
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 32,
                    indent: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomContainer(
                      startDay: getLabController.labModel!.startDay,
                      startTime:
                          getLabController.labModel!.startTime.substring(0, 5),
                      endDay: getLabController.labModel!.endDay,
                      endTime:
                          getLabController.labModel!.endTime.substring(0, 5),
                      onTap: () {
                        Get.to(() => SickLaboratoryInformationDispalyPage(
                              labModel: getLabController.labModel,
                            ));
                      },
                      title: 'Laboratory'.tr,
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 32,
                    indent: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Clinics".tr,
                      style:
                          const TextStyle(fontSize: 36, fontFamily: gabriela),
                    ),
                  ),
                  // Removed Expanded from ListView.builder
                  ListView.builder(
                    itemCount: getCenterInformationController
                        .centerModel!.clinics.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling for ListView
                    itemBuilder: (context, index) {
                      return CustomContainer(
                        startDay: getCenterInformationController
                            .centerModel!.clinics[index].startDay,
                        endDay: getCenterInformationController
                            .centerModel!.clinics[index].endDay,
                        startTime: getCenterInformationController
                            .centerModel!.clinics[index].startTime
                            .substring(0, 5),
                        endTime: getCenterInformationController
                            .centerModel!.clinics[index].endTime
                            .substring(0, 5),
                        onTap: () {
                          Get.to(
                            () => SickClinicInformationDisplayPage(
                              clinicModel: getCenterInformationController
                                  .centerModel!.clinics[index],
                            ),
                          );
                        },
                        title: 'Beauty Clinic',
                      );
                    },
                  ),
                ],
              ),
            );
    }));
  }
}
