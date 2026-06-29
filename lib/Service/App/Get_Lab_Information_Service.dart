import 'dart:convert';

import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Model/Lab_Model.dart';
import 'package:al_hadara/Model/Servece_Model.dart';

import 'package:http/http.dart' as http;

class GetLabInformationService {
  Future<dynamic> getLabInformation() async {
    http.Response response = await http.get(
      Uri.parse('https://medicore-production.up.railway.app/api/laboratories'),
    );
    List<dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> serviceData = data[1]['services'];
      List<ServiceModel> service = [];

      for (int i = 0; i < serviceData.length; i++) {
        service.add(ServiceModel.fromJson(serviceData[i]));
      }
      LabModel lab = LabModel.fromJson1(data[1], service);
      return lab;
    } else {
      customSnackBar(title: warning, message: 'Please check your internet');
      return fail;
    }
  }
}
