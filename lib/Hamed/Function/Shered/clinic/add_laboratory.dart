import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:http/http.dart' as http;

Future<int> addLaboratoryFun({
  required String type,
  required String startDay,
  required String endDay,
  required String startTime,
  required String endTime,
}) async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/laboratories",
  );

  try {
    final body = jsonEncode({
      "name": type,
      "start_day": startDay,
      "end_day": endDay,
      "start_time": startTime,
      "end_time": endTime,
      'center_id': '1',
    });

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return 1;
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return -1;
    }
  } catch (e) {
    print("Exception: $e");
    return -1;
  }
}
