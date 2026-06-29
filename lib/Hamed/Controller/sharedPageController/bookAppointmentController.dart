import 'package:al_hadara/Hamed/Function/Shered/book_appointment.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/get_doctors_in_clinic.dart';
import 'package:al_hadara/Hamed/Function/Shered/get_all_Clinic.dart';
import 'package:al_hadara/Hamed/model/SharedModel/clinic_Model.dart';
import 'package:al_hadara/Hamed/model/centerModel/drop_down_model.dart';
import 'package:al_hadara/Hamed/model/doctorModel/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookAppointmentController extends GetxController {
  DropDownModel? clinic;
  DropDownModel? doctor;
  String? date;
  String? day;
  String? userName;
  DateTime fullDate = DateTime.now();
  List<DropDownModel> clinics = [];
  List<DropDownModel> doctors = [];

  getClinic() async {
    List<ClinicModel> list = await getAllClinic();
    clinics = list
        .map((clinicModel) => DropDownModel(clinicModel.name!, clinicModel.id!))
        .toList();
    update();
  }

  getDoctors(int id) async {
    List<DoctorModel> list = await fetchClinicDoctors(clinicId: id);
    for (int i = 0; i < list.length; i++) {
      print('dddd$i');
      print(list[i].id);
      print(list[i].name);
    }
    doctors = list
        .map((docModel) => DropDownModel(docModel.name, docModel.id))
        .toList();
    update();
  }

  changeDate(DateTime date) {
    this.date = DateFormat('d/M/yyyy').format(date);
    fullDate = date;
    day = DateFormat('EEEE').format(date);
    update();
  }

  changeClinic(DropDownModel model) {
    clinic = model;
    update();
  }

  changeDoctor(DropDownModel model) {
    doctor = model;
    update();
  }

  changeUserName(String? userName) {
    userName == null ? null : this.userName = userName;
    update();
  }

  autoSelect() {
    date = DateFormat('d/M/yyyy').format(DateTime.now());
    fullDate = DateTime.now();
    day = DateFormat('EEEE').format(DateTime.now());

    update();
  }

  bool checkData() {
    if (clinic != null &&
        doctor != null &&
        userName != null &&
        date != null &&
        day != null) {
      return true;
    }
    return false;
  }

  Future<void> bookAppointment() async {
    if (checkData()) {
      Get.dialog(
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Booking..."),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );
      bool success = await bookAppointmentFun(
        doctorId: doctor!.id,
        patientId: 1,
        clinicId: clinic!.id,
        date: date!.split('/').reversed.join('-'),
        time: '11:00',
      );
      Get.back();
      Get.dialog(
        AlertDialog(
          title: Text("Result"),
          content: Text(success ? "Booked ✅" : "Didn't book ❌"),
          actions: [TextButton(onPressed: () => Get.back(), child: Text("OK"))],
        ),
      );
    } else {
      Get.dialog(
        AlertDialog(
          title: Text("Notice"),
          content: Text("There is some missing data"),
          actions: [TextButton(onPressed: () => Get.back(), child: Text("OK"))],
        ),
      );
    }
  }

  test() {
    print('clinic ${clinic == null ? '' : clinic!.id}');
    print('doc ${doctor == null ? '' : doctor!.id}');
    print('date ${date == null ? '' : date!.split('/').reversed.join('-')}');
    print('patient ${userName == null ? '' : userName!}');
    print('user ${userName == null ? '' : userName!}');
  }
}
