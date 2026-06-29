import 'package:al_hadara/Model/CLinic_Model.dart';

class CenterModel {
  String name;
  String location;
  String? image;
  String startTime;
  String endTime;
  String startDay;
  String endDay;
  List<ClinicModel> clinics;

  CenterModel(
      {required this.location,
      required this.name,
      required this.image,
      required this.startTime,
      required this.endTime,
      required this.startDay,
      required this.endDay,
      required this.clinics});
  factory CenterModel.fromJson(jsonData, List<ClinicModel> clinic) {
    return CenterModel(
      location: jsonData['location'],
      name: jsonData['name'],
      image: jsonData['logo_url'],
      clinics: clinic,
      startDay: jsonData['start_day'],
      endTime: jsonData['end_time'],
      startTime: jsonData['start_time'],
      endDay: jsonData['end_day'],
    );
  }
}
