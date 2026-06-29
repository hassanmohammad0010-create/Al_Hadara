import 'package:al_hadara/Hamed/Function/Shered/clinic/add_clinic.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/add_laboratory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClinicLabController extends GetxController {
  String? specialty;
  String? summary;
  String? dayFrom;
  String? dayTo;
  String? hourFrom;
  String? hourTo;
  int? id;

  List<Widget> services = [];
  List<Widget> doctors = [];

  test() {
    print('sp');
    print(specialty);
    print('su');

    print(summary);
    print('df');

    print(dayFrom);
    print('dt');

    print(dayTo);
    print('hf');

    print(hourFrom);
    print('ht');

    print(hourTo);
    print('ser');

    print(services);
    print('doc');

    print(doctors);
  }

  changeSpecialty(String? specialty) {
    specialty == null ? null : this.specialty = specialty;
    update();
  }

  changeSummary(String? summary) {
    summary == null ? null : this.summary = summary;
    update();
  }

  changeHourFrom(String? time) {
    time == null ? null : hourFrom = time.split(' ')[0];
    update();
  }

  changeHourTo(String? time) {
    time == null ? null : hourTo = time.split(' ')[0];
    update();
  }

  changeDayFrom(String? day) {
    day == null ? null : dayFrom = day;
    update();
  }

  changeDayTo(String? day) {
    day == null ? null : dayTo = day;
    update();
  }

  bool check() {
    print(specialty);
    print(summary);
    print(dayFrom);
    print(dayFrom);
    print(hourFrom);
    print(hourTo);
    return specialty != null &&
        summary != null &&
        dayFrom != null &&
        dayTo != null &&
        hourFrom != null &&
        hourTo != null;
  }

  bool checkLab() {
    return specialty != null &&
        dayFrom != null &&
        dayTo != null &&
        hourFrom != null &&
        hourTo != null;
  }

  clearController() {
    specialty = null;
    summary = null;
    dayFrom = null;
    dayTo = null;
    hourFrom = null;
    hourTo = null;
    update();
  }

  Future<int> add() async {
    int done = await addClinic(
      name: summary!,
      specialty: specialty!,
      id: 1,
      startDay: dayFrom!,
      endDay: dayTo!,
      startTime: hourFrom!,
      endTime: hourTo!,
    );
    if (done >= 0) {
      id = done;
    }
    ;
    return done;
  }

  Future<int> addLaboratory() async {
    int done = await addLaboratoryFun(
      type: specialty!,
      startDay: dayFrom!,
      endDay: dayTo!,
      startTime: hourFrom!,
      endTime: hourTo!,
    );
    return done;
  }
}
