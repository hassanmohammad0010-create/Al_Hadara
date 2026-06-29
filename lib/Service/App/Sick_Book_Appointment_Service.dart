import 'dart:convert';

import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';

import 'package:http/http.dart' as http;

class SickBookAppointmentService {
  Future<String> bookAppointmentService({
    required String doctorId,
    required String patientId,
    required String clinicId,
    required String date,
  }) async {
    http.Response response = await http.post(
        Uri.parse(
            'https://medicore-production.up.railway.app/api/appointments/'),
        body: {
          "doctor_id": doctorId,
          "patient_id": patientId,
          "clinic_id": clinicId,
          "date": date,
          "status": 'booked'
        },
        headers: {
          'Authorization':
              'bearer ${tokenSharedPreferences!.getString('token')}',
          // 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTcxNTE5NTIsImV4cCI6MTc1NzE1NTU1MiwibmJmIjoxNzU3MTUxOTUyLCJqdGkiOiJCUFJnMXRIdTVuNkN4SWZXIiwic3ViIjoiNzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4KMLEqWZGjNXOzrUslHtdjumevtuSG--YBnlVX6imQE',
          "Accept": 'application/json'
        });

    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 201) {
      String result = data['time'];
      return result;
    } else if (response.statusCode == 400) {
      String result = data['message'];
      if (result == 'No available slots, clinic is closed at this time.') {
        return 'no available';
      }
      return 'worng date';
    } else if (response.statusCode == 429) {
      return 'to many requests';
    } else {
      return fail;
    }
  }
}
