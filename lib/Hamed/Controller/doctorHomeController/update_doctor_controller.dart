import 'package:al_hadara/Hamed/Function/doctor/update_docotr.dart';
import 'package:al_hadara/Model/Doctor_Model.dart';
import 'package:get/get.dart';

class UpdateDoctorInfoController extends GetxController {
  int id;
  String name;
  String specialty;
  String startDay;
  String endDay;
  String startTime;
  String endTime;

  UpdateDoctorInfoController({required DoctorModel doctorModel})
      : name = doctorModel.name,
        specialty = doctorModel.specialty,
        id = doctorModel.id,
        startDay = doctorModel.startDay,
        endDay = doctorModel.endDay,
        startTime = doctorModel.startTime,
        endTime = doctorModel.endTime;
  changeName(String name) {
    this.name = name;
  }

  changeSpecialty(String specialty) {
    this.specialty = specialty;
    update();
  }

  changeStartDay(String startDay) {
    this.startDay = startDay;
    update();
  }

  changeEndtDay(String endDay) {
    this.endDay = endDay;
    update();
  }

  changeStartTime(String startTime) {
    this.startTime = startTime;
    update();
  }

  changeEndTime(String endTime) {
    this.endTime = endTime;
    update();
  }

  Future<int> updateDoctorInfo() async {
    int success = await updateDoctor(
      id: id,
      name: name,
      startDay: startDay,
      endDay: endDay,
      startTime: startTime,
      endTime: endTime,
      specialty: specialty,
    );
    return success;
  }

  test() {
    print(id);
    print(name);
    print(specialty);
    print(startDay);
    print(endDay);
    print(startTime);
    print(endTime);
  }
}
