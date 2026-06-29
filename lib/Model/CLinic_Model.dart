import 'package:al_hadara/Model/Servece_Model.dart';

class ClinicModel {
  String name;
  int id;
  String startTime;
  String endTime;
  String startDay;
  String endDay;
  String clinicType;
  List<ServiceModel>? services;

  ClinicModel({
    this.services,
    required this.id,
    required this.clinicType,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.startDay,
    required this.endDay,
  });

  factory ClinicModel.fromJson(jsonData) {
    print(jsonData);

    return ClinicModel(
      name: jsonData['title'],
      id: jsonData['id'],
      startDay: jsonData['start_day'],
      endTime: jsonData['end_time'],
      startTime: jsonData['start_time'],
      endDay: jsonData['end_day'],
      clinicType: jsonData['clinic_type'],
      // services: jsonData['services'],
    );
  }
  factory ClinicModel.fromJson1(jsonData, List<ServiceModel> ser) {
    // print(jsonData);

    return ClinicModel(
      name: jsonData['title'],
      id: jsonData['id'],
      startDay: jsonData['start_day'],
      endTime: jsonData['end_time'],
      startTime: jsonData['start_time'],
      endDay: jsonData['end_day'],
      clinicType: jsonData['clinic_type'],
      services: ser,
    );
  }
}
