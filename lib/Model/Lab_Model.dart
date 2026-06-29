import 'package:al_hadara/Model/Servece_Model.dart';

class LabModel {
  String name;
  int id;
  String startTime;
  String endTime;
  String startDay;
  String endDay;

  List<ServiceModel>? services;

  LabModel({
    this.services,
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.startDay,
    required this.endDay,
  });

  factory LabModel.fromJson(jsonData) {
    return LabModel(
      name: jsonData['title'],
      id: jsonData['id'],
      startDay: jsonData['start_day'],
      endTime: jsonData['end_time'],
      startTime: jsonData['start_time'],
      endDay: jsonData['end_day'],

      // services: jsonData['services'],
    );
  }
  factory LabModel.fromJson1(jsonData, List<ServiceModel> ser) {
    return LabModel(
      name: jsonData['name'],
      id: jsonData['id'],
      startDay: jsonData['start_day'],
      endTime: jsonData['end_time'],
      startTime: jsonData['start_time'],
      endDay: jsonData['end_day'],
      services: ser,
    );
  }
}
