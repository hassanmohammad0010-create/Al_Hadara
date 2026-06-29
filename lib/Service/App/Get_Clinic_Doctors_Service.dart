import 'dart:convert';

import 'package:al_hadara/Model/Doctor_Model.dart';
import 'package:al_hadara/Model/Servece_Model.dart';

import 'package:http/http.dart' as http;

class GetClinicDoctorsService {
  Future<List<DoctorModel>> getClinicDoctorsService() async {
    http.Response response = await http.get(
      Uri.parse('https://medicore-production.up.railway.app/api/doctors'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<DoctorModel> doctors = [];
      for (int i = 0; i < data.length; i++) {
        doctors.add(DoctorModel.fromJson(data[i]));
      }
      return doctors;
    } else {
      throw Exception();
    }
  }

  Future<List<DoctorModel>> getClinicDoctorsServic({required int id}) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://medicore-production.up.railway.app/api/clinics/$id/doctors'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<DoctorModel> doctors = [];
      List<ServiceModel> service = [];
      for (int i = 0; i < data.length; i++) {
        List<dynamic> serviceDate = data[i]['services'];
        for (int j = 0; j < serviceDate.length; j++) {
          service.add(ServiceModel.fromJson(serviceDate[j]));
        }
        doctors.add(DoctorModel.fromJson1(data[i], service));
      }
      return doctors;
    } else {
      throw Exception();
    }
  }
}
