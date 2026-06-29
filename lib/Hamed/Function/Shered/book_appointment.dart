import 'dart:convert';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<bool> bookAppointmentFun({
  required int doctorId,
  required int patientId,
  required int clinicId,
  required String date,
  required String time,
  String status = "wait",
}) async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/appointments/",
  );

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${tokenSharedPreferences!.getString('token')}",
      },
      body: jsonEncode({
        "doctor_id": doctorId,
        "patient_id": patientId,
        "clinic_id": clinicId,
        "date": date,
        "time": time,
        "status": status,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(" Appointment booked successfully: ${response.body}");
      return true;
    } else {
      print(" Failed to book appointment. Status: ${response.statusCode}");
      print("Response: ${response.body}");
      return false;
    }
  } catch (e) {
    print(" Error: $e");
    return false;
  }
}
