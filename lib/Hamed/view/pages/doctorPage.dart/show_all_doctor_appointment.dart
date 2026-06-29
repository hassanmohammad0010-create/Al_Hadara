import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/doctorHomeController/show_all_doctor_appointment_controller.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/doctor_appointments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllDoctorAppointment extends StatelessWidget {
  ShowAllDoctorAppointment({super.key, required this.doctorId});
  final int doctorId;
  final ShowAllDoctorAppointmentController showAllDoctorAppointmentController =
      Get.put(ShowAllDoctorAppointmentController());
  @override
  Widget build(BuildContext context) {
    showAllDoctorAppointmentController.getAllAppointment(44);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: showAllDoctorAppointmentController.scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Container(
                child: GetBuilder<ShowAllDoctorAppointmentController>(
                  builder: (showAllDoctorAppointmentController) =>
                      showAllDoctorAppointmentController.appointmentModel ==
                              null
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Your appointments',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'PlayfairDisplay',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: secondaryTextColor,
                                      ),
                                      children: [
                                        const TextSpan(text: 'You have   '),
                                        TextSpan(
                                          text:
                                              '${showAllDoctorAppointmentController.appointmentModel!.length}',
                                          style: const TextStyle(
                                            fontSize: 30,
                                            color: mainColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const TextSpan(
                                          text:
                                              '  appointments from today to the next en days',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                ...showAllDoctorAppointmentController
                                    .appointmentModel!
                                    .map(
                                  (model) => DoctorAppointments(
                                    clinicName: model.clinicName,
                                    patientName: model.patientName,
                                    date: model.date,
                                    time: model.time,
                                  ),
                                ),
                              ],
                            ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: mainColor,
              onPressed: showAllDoctorAppointmentController.scrollToTop,
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        ],
      ),
    );
  }
}
