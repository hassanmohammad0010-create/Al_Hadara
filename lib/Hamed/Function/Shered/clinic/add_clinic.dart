import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<int> addClinic({
  required String name,
  required String specialty,
  required int id,
  required String startDay,
  required String endDay,
  required String startTime,
  required String endTime,
}) async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/clinics",
  );

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${tokenSharedPreferences!.getString('token')}",
      "Accept": "application/json",
    },
    body: jsonEncode({
      'center_id': 1.toString(),
      "title": name,
      "clinic_type": specialty,
      "start_day": startDay,
      "end_day": endDay,
      "start_time": startTime,
      "end_time": endTime,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print("Clinic added successfully: ${response.body}");
    final data = jsonDecode(response.body);
    return data['id'];
  } else {
    print("Failed to add clinic. Status: ${response.statusCode}");
    print("Response: ${response.body}");
    return -1;
  }
}
