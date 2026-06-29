import 'dart:convert';

import 'package:al_hadara/Model/CLinic_Model.dart';
import 'package:al_hadara/Model/Center_Model.dart';
import 'package:al_hadara/Model/Servece_Model.dart';

import 'package:http/http.dart' as http;

class GetCenterInformationService {
  Future<CenterModel> getCenterInformation() async {
    http.Response response = await http.get(
      Uri.parse('https://medicore-production.up.railway.app/api/centers/1'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> clinicsData = data['clinics'];
      List<dynamic> serviceData = [];
      List<ClinicModel> clinics = [];
      List<ServiceModel> clinicsService = [];

      for (int i = 0; i < clinicsData.length; i++) {
        serviceData = data['clinics'][i]['services'];
        for (int j = 0; j < serviceData.length; j++) {
          clinicsService.add(ServiceModel.fromJson(serviceData[j]));
        }

        clinics.add(ClinicModel.fromJson1(clinicsData[i], clinicsService));
      }

      return CenterModel.fromJson(data, clinics);
    } else {
      throw Exception();
    }
  }
}
