import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/doctorModel/doctor_model.dart';

Future<List<DoctorModel>> getAllDoctors() async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/doctors",
  );

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      List<DoctorModel> doctorModel = data
          .map((json) => DoctorModel.fromJson(json))
          .toList();

      return doctorModel;
    }
  } catch (e) {
    print("Error: $e");
  }

  return []; // fallback
}
