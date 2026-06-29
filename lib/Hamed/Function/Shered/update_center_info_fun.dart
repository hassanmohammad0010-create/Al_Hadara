import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<int> updateCenter({
  required String name,
  required String location,
  required String startDay,
  required String endDay,
  required String startTime,
  required String endTime,
}) async {
  final String url = 'https://medicore-production.up.railway.app/api/centers/1';
  final Map<String, dynamic> body = {
    "name": name,
    "logo_url": null,
    "location": location,
    "start_day": startDay,
    "end_day": endDay,
    "start_time": startTime,
    "end_time": endTime,
  };

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${tokenSharedPreferences!.getString(token)}',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('done: ');
      return 1;
    } else {
      print('Failed to update center. Status: ${response.statusCode}');
      return -1;
    }
  } catch (e) {
    print('Error updating center: $e');
    return -1;
  }
}
