import 'package:al_hadara/Model/Servece_Model.dart';

class DoctorModel {
  String name;
  String imageUrl;
  int id;
  int? clinicId;
  String specialty;
  List<dynamic>? certificates;
  List<ServiceModel>? services;
  String startTime;
  String endTime;
  String startDay;
  String endDay;

  DoctorModel({
    required this.name,
    required this.id,
    required this.clinicId,
    required this.imageUrl,
    required this.specialty,
    required this.certificates,
    required this.services,
    required this.startTime,
    required this.endTime,
    required this.startDay,
    required this.endDay,
  });
  factory DoctorModel.fromJson(jsonData) {
    return DoctorModel(
      name: jsonData['name'],
      id: jsonData['id'],
      clinicId: jsonData['clinic_id'],
      imageUrl: jsonData['image_url'],
      specialty: jsonData['specialty'],
      certificates: jsonData['certificates'],
      services: jsonData['services'],
      startDay: jsonData['start_day'],
      endDay: jsonData['end_day'],
      startTime: jsonData['start_time'],
      endTime: jsonData['end_time'],
    );
  }
  factory DoctorModel.fromJson1(jsonData, ser) {
    return DoctorModel(
      name: jsonData['name'],
      id: jsonData['id'],
      clinicId: jsonData['clinic_id'],
      imageUrl: jsonData['image_url'],
      specialty: jsonData['specialty'],
      certificates: jsonData['certificates'],
      services: ser,
      startDay: jsonData['start_day'],
      endDay: jsonData['end_day'],
      startTime: jsonData['start_time'],
      endTime: jsonData['end_time'],
    );
  }
}
