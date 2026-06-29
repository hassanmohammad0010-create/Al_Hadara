import 'dart:convert';
import 'package:al_hadara/Hamed/model/SharedModel/appointment_model.dart';
import 'package:http/http.dart' as http;

Future<List<AppointmentModel>?> getAppointmentsByDoctor(int doctorId) async {
  final String url =
      'https://medicore-production.up.railway.app/api/appointments/getByDoctor/$doctorId';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<AppointmentModel> appointments =
          data.map((json) => AppointmentModel.fromJson(json)).toList();

      return appointments;
    } else {
      throw Exception(
        'Failed to load appointments. Status: ${response.statusCode}',
      );
    }
  } catch (e) {
    print('Error fetching appointments: $e');
    return null;
  }
}
