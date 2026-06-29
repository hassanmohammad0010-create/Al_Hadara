import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/doctorHomeController/personalDoctorPAgecontroller.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/pages/doctorPage.dart/update_doctor_page.dart';
import 'package:al_hadara/Widget/App/Custom_Row.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DoctorInfoPage extends StatelessWidget {
  DoctorInfoPage({
    super.key,
  });
  String pageName = "SickDoctorInformationDisplay";
  GetDoctorPersonalController getMyAppointmentController =
      Get.put(GetDoctorPersonalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<GetDoctorPersonalController>(
        builder: (getMyAppointmentController) {
      return getMyAppointmentController.doctorModel == null
          ? CustomLoading(load: true)
          : Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 32, left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/Image/defult.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    color: constColor,
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getMyAppointmentController
                                          .doctorModel!.name,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: gabriela,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      getMyAppointmentController
                                          .doctorModel!.specialty,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: constColor,
                                          fontSize: 22,
                                          fontFamily: abhayaLibre,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomRow(
                            icons: Icons.schedule_sharp,
                            text:
                                "From ${getMyAppointmentController.doctorModel!.startTime.substring(0, 5)} to ${getMyAppointmentController.doctorModel!.endTime.substring(0, 5)} ",
                          ),
                          CustomRow(
                            icons: Icons.calendar_month_sharp,
                            text:
                                "From ${getMyAppointmentController.doctorModel!.startDay} to ${getMyAppointmentController.doctorModel!.endDay}",
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
                      padding: const EdgeInsets.only(left: 32, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cretificates".tr,
                            style: const TextStyle(
                              fontSize: 28,
                              // color: constColor,
                              fontFamily: gabriela,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          getMyAppointmentController
                                  .doctorModel!.certificates!.isEmpty
                              ? const Text(
                                  'There are no certificates',
                                  style: TextStyle(
                                      color: constWhiteGreyColor,
                                      fontSize: 18,
                                      fontFamily: abhayaLibre),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    itemCount: getMyAppointmentController
                                        .doctorModel!.certificates!.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          getMyAppointmentController
                                              .doctorModel!
                                              .certificates![index],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: gabriela,
                                          ));
                                    },
                                  ),
                                )
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
                      padding: const EdgeInsets.only(left: 32, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Services".tr,
                            style: const TextStyle(
                              fontSize: 28,
                              // color: constColor,
                              fontFamily: gabriela,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          getMyAppointmentController.doctorModel!.services ==
                                  null
                              ? const Text(
                                  'There are no Service',
                                  style: TextStyle(
                                      color: constWhiteGreyColor,
                                      fontSize: 18,
                                      fontFamily: abhayaLibre),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    itemCount: getMyAppointmentController
                                        .doctorModel!.services!.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          getMyAppointmentController
                                              .doctorModel!
                                              .services![index]
                                              .name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: gabriela,
                                          ));
                                    },
                                  ),
                                )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                      endIndent: 32,
                      indent: 32,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FunctionalButton(
                    text: 'edit info',
                    onTap: () {
                      Get.to(UpdateDoctorInfo(
                          doctorModel:
                              getMyAppointmentController.doctorModel!));
                    },
                  ),
                )
              ],
            );
    }));
  }
}
