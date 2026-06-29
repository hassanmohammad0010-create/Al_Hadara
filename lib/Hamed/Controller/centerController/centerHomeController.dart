import 'package:al_hadara/Hamed/Function/Shered/clinic/delet.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/get_all_laboratory.dart';
import 'package:al_hadara/Hamed/Function/Shered/get_all_Clinic.dart';
import 'package:al_hadara/Hamed/Function/Shered/get_all_doctors.dart';
import 'package:al_hadara/Hamed/model/SharedModel/clinic_Model.dart';
import 'package:al_hadara/Hamed/model/SharedModel/laboratory_model.dart';
import 'package:al_hadara/Hamed/model/doctorModel/doctor_model.dart';
import 'package:get/get.dart';

class CenterHomeController extends GetxController {
  List<ClinicModel>? clinic;
  List<LaboratoryModel>? laboratory;
  List<DoctorModel>? doctor;

  getClinics() async {
    clinic = await getAllClinic();
    update();
  }

  getLabs() async {
    laboratory = await getAllLaboratories();
    update();
  }

  getDoctors() async {
    doctor = await getAllDoctors();
    update();
  }

  delete(String type, int id) {
    deleteFun(type: type, id: id);
  }
}
