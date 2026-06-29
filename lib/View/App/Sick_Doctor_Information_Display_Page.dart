import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/app/Get_My_Appointment_Controller.dart';
import 'package:al_hadara/Model/Doctor_Model.dart';
import 'package:al_hadara/Widget/App/Custom_Appointmant_AlertDialog.dart';
import 'package:al_hadara/Widget/App/Custom_Back_Contaner.dart';
import 'package:al_hadara/Widget/App/Custom_Row.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SickDoctorInformationDisplayPage extends StatelessWidget {
  SickDoctorInformationDisplayPage(
      {super.key, this.doctorModel, this.clinicname});
  String? clinicname;
  String pageName = "SickDoctorInformationDisplay";
  DoctorModel? doctorModel;
  GetMyAppointmentController getMyAppointmentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constColor,
        body: Stack(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: CustomBackContainer()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                color: Colors.white,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 120,
                  minWidth: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 24, right: 24),
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
                                  image: AssetImage('assets/Image/defult.jpg'),
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
                                  doctorModel!.name,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontFamily: gabriela,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  doctorModel!.specialty,
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
                            "From ${doctorModel!.startTime.substring(0, 5)} to ${doctorModel!.endTime.substring(0, 5)} ",
                      ),
                      CustomRow(
                        icons: Icons.calendar_month_sharp,
                        text:
                            "From ${doctorModel!.startDay} to ${doctorModel!.endDay}",
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
                      doctorModel!.certificates!.isEmpty
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
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: doctorModel!.certificates!.length,
                                itemBuilder: (context, index) {
                                  return Text(doctorModel!.certificates![index],
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
                      doctorModel!.services!.isEmpty
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
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(0),
                                itemCount: doctorModel!.services!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                      doctorModel!.services![index].name,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Get.dialog(CustomAppointmantAlertDialog(
                    clinicName: clinicname!,
                    clinicId: '${doctorModel!.clinicId!}',
                    doctorId: '${doctorModel!.id}',
                    doctorName: doctorModel!.name,
                  ));
                  getMyAppointmentController.refresh();
                },
                child: Container(
                  alignment: Alignment.center,
                  color: constColor,
                  height: 70,
                  width: double.infinity,
                  child: Text(
                    'Book an appointmant'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: abhayaLibre),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
