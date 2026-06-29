import 'dart:convert';
import 'package:al_hadara/Hamed/model/SharedModel/appointment_model.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<List<AppointmentModel>> getAppointmentsByDoctor({
  required int doctorId,
  required String date,
}) async {
  final url = Uri.parse(
    'https://medicore-production.up.railway.app/api/appointments/getByDate/$doctorId?date=$date',
  );

  try {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${tokenSharedPreferences!.getString('token')}",
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(" ${response.statusCode} ${response.body}");
      return data.map((e) => AppointmentModel.fromJson(e)).toList();
    } else {
      print("Failed to fetch appointments: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print("Exception occurred: $e");
    return [];
  }
}
