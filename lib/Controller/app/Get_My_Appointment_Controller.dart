import 'package:al_hadara/Model/Appointments_Model.dart';
import 'package:al_hadara/Service/App/Get_My_All_Appointment_Service.dart';
import 'package:get/get.dart';

class GetMyAppointmentController extends GetxController {
  List<AppointmentModel>? appointments;

  refresh() async {
    appointments = await GetMyAllAppointmentService().getMyAllAppointment();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    appointments = await GetMyAllAppointmentService().getMyAllAppointment();
    update();
  }
}
