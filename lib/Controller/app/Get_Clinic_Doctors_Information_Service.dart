import 'package:al_hadara/Model/Doctor_Model.dart';
import 'package:al_hadara/Service/App/Get_Clinic_Doctors_Service.dart';
import 'package:get/get.dart';

class GetClinicDoctorController extends GetxController {
  int? id;
  List<DoctorModel>? doctorsModel;
  void set({required int id}) async {
    doctorsModel =
        await GetClinicDoctorsService().getClinicDoctorsServic(id: id);
    update();
  }
}
