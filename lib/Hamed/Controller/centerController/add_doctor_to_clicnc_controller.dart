import 'package:al_hadara/Hamed/Function/Shered/get_all_doctors.dart';
import 'package:al_hadara/Hamed/model/doctorModel/doctor_model.dart';
import 'package:get/get.dart';

class AddDoctorToClinicController extends GetxController {
  String? serviceName;
  String? description;
  String? price;
  List<DoctorModel> doctors = [];
  List<int> doctorToAdd = [];
  changeDoctorName(serviceName) {
    this.serviceName = serviceName;
    update();
  }

  changeDescription(description) {
    this.description = description;
    update();
  }

  changePrice(price) {
    this.price = price;
    update();
  }

  getDoctor() async {
    doctors = await getAllDoctors();
    update();
  }
}
