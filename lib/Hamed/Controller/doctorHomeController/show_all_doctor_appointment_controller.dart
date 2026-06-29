import 'package:al_hadara/Hamed/Function/doctor/get_appointment_by_date.dart';
import 'package:al_hadara/Hamed/model/SharedModel/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAllDoctorAppointmentController extends GetxController {
  List<AppointmentModel>? appointmentModel;
  final ScrollController scrollController = ScrollController();

  scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  getAllAppointment(int doctorId) async {
    appointmentModel = await getAppointmentsByDoctor(
      doctorId: doctorId,
      date: '${DateTime.now()}',
    );
    update();
  }
}
