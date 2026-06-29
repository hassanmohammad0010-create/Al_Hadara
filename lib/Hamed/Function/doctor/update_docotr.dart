import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<int> updateDoctor({
  required int id,
  required String name,
  required String startDay,
  required String endDay,
  required String startTime,
  required String endTime,
  required String specialty,
}) async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/doctors/$id",
  );

  final body = {
    "name": name,
    "start_day": startDay,
    "end_day": endDay,
    "start_time": startTime,
    "end_time": endTime,
    "specialty": specialty,
  };

  try {
    final response = await http.put(
      url,
      headers: {
        'Accept': 'application/json',
        "Authorization": "Bearer ${tokenSharedPreferences!.getString(token)}"
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print("Doctor updated successfully!");
      return 1;
    } else {
      print("Failed to update doctor. Status: ${response.statusCode}");
      print("Response: ${response.body}");
      return -1;
    }
  } catch (e) {
    print("Error: $e");
    return -1;
  }
}
