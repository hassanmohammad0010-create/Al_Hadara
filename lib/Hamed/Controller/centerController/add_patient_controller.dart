import 'package:al_hadara/Hamed/model/centerModel/drop_down_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPatientController extends GetxController {
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDay;
  String? info;
  int age = 0;
  List<DropDownModel> genderList = [
    DropDownModel('Male', 1),
    DropDownModel('Female', 2)
  ];

  changeBirthDay(DateTime birthDay) {
    this.birthDay = DateFormat('d/M/yyyy').format(birthDay);
    age = int.parse(DateFormat('yyyy').format(DateTime.now())) -
        int.parse(DateFormat('yyyy').format(birthDay));
    update();
  }

  changeFirstName(String? fName) {
    firstName = fName;
  }

  changeLastName(String? lName) {
    lastName = lName;
  }

  changeGender(String? gender) {
    this.gender = gender;
  }

  changeAdditionalInfo(String? info) {
    this.info = info;
  }

  test() {
    print(firstName);
    print(lastName);
    print(age);
    print(birthDay);
    print(gender);
  }
}
