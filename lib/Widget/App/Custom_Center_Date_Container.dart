import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/app/Get_My_Appointment_Controller.dart';
import 'package:al_hadara/Function/app/Delete_Appointmnet_Function.dart';
import 'package:al_hadara/Model/Appointments_Model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAppointmentContainer extends StatelessWidget {
  CustomAppointmentContainer({super.key, required this.appointmentModel});
  AppointmentModel appointmentModel;
  GetMyAppointmentController getMyAppointmentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Al Hadara',
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: abhayaLibre,
                        color: constColor),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clinic name : ',
                        style: TextStyle(fontSize: 24, fontFamily: gabriela),
                      ),
                      Text(
                        appointmentModel.clinicName!.substring(0, 10),
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: gabriela,
                            color: constWhiteGreyColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Doctor name : ',
                        style: TextStyle(fontSize: 24, fontFamily: gabriela),
                      ),
                      Text(
                        appointmentModel.doctorName!,
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: gabriela,
                            color: constWhiteGreyColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Date : ',
                        style: TextStyle(fontSize: 24, fontFamily: gabriela),
                      ),
                      Text(
                        appointmentModel.date,
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: gabriela,
                            color: constWhiteGreyColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Hour : ',
                        style: TextStyle(fontSize: 24, fontFamily: gabriela),
                      ),
                      Text(
                        appointmentModel.time,
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: gabriela,
                            color: constWhiteGreyColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Status : ',
                        style: TextStyle(fontSize: 24, fontFamily: gabriela),
                      ),
                      Text(
                        appointmentModel.status,
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: gabriela,
                            color: constWhiteGreyColor),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await deletAppointment(
                              id: '${appointmentModel.appointmantId}');
                          getMyAppointmentController.refresh();
                        },
                        child: Container(
                          width: 80,
                          height: 50,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: abhayaLibre),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
