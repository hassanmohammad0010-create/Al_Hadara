import 'dart:convert';
import 'dart:io';
import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/model/doctorModel/doctor_model.dart';
import 'package:http/http.dart' as http;

Future<List<DoctorModel>> fetchClinicDoctors({
  required int clinicId,
  String baseUrl = 'https://medicore-production.up.railway.app/api',
}) async {
  try {
    final uri = Uri.parse('$baseUrl/clinics/$clinicId/doctors');

    final resp = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    if (resp.statusCode == 200) {
      final List<dynamic> data = jsonDecode(resp.body);
      List<DoctorModel> doctors =
          data.map((json) => DoctorModel.fromJson(json)).toList();
      return doctors;
    } else {
      print("Failed to load doctors: ${resp.statusCode}");
      return [];
    }
  } catch (e) {
    print("Error fetching doctors: $e");
    return [];
  }
}
