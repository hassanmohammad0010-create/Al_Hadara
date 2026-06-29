import 'dart:convert';

import 'package:al_hadara/Model/Appointments_Model.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

class GetMyAllAppointmentService {
  Future<List<AppointmentModel>> getMyAllAppointment() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://medicore-production.up.railway.app/api/appointments/myAppointments'),
        headers: {
          'Authorization':
              'bearer ${tokenSharedPreferences!.getString('token')}',
          // 'Authorization':
          //     'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTcxNTE5NTIsImV4cCI6MTc1NzE1NTU1MiwibmJmIjoxNzU3MTUxOTUyLCJqdGkiOiJCUFJnMXRIdTVuNkN4SWZXIiwic3ViIjoiNzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4KMLEqWZGjNXOzrUslHtdjumevtuSG--YBnlVX6imQE',
          'Accept': 'application/json'
        });
    List<AppointmentModel> appointments = [];
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      for (int i = 0; i < data.length; i++) {
        appointments.add(AppointmentModel.fromJson1(data[i]));
      }
      return appointments;
    } else {
      return appointments;
    }
  }
}
