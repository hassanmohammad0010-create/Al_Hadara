import 'package:al_hadara/Hamed/Function/doctor/get_appointment_by_date.dart';
import 'package:al_hadara/Hamed/model/SharedModel/appointment_model.dart';
import 'package:al_hadara/Hamed/model/SharedModel/clinic_Model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorHomeController extends GetxController {
  String today = DateFormat(
    'd/M/yyyy',
  ).format(DateTime.now()).split('/').reversed.join('-');

  List<ClinicModel> clinics = [
    ClinicModel(name: 'Dental', id: 1, image: 'lib/assets/pngegg.png'),
  ];
  List<AppointmentModel> appointments = [];

  test() {
    print('ttt');
    print(today);
  }

  getAppointment() async {
    appointments = await getAppointmentsByDoctor(
      doctorId: 44,
      date: '2025-9-9',
    );
    update();
  }
}
