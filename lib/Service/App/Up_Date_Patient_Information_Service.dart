import 'dart:convert';

import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Model/Sick_Model.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

class UpDateSickInformation {
  Future<dynamic> upDateSickInformation({
    required String name,
    required String phone,
    required String gender,
    required String birthDate,
  }) async {
    http.Response response = await http.put(
        Uri.parse('https://medicore-production.up.railway.app/api/patients'),
        body: {
          "name": name,
          "phone": phone,
          "gender": gender,
          "date_of_birth": birthDate
        },
        headers: {
          'Authorization':
              'bearer ${tokenSharedPreferences!.getString('token')}',
          // 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTY5OTA1NjYsImV4cCI6MTc1Njk5NDE2NiwibmJmIjoxNzU2OTkwNTY2LCJqdGkiOiI0YkVNSXpmajlRcmJVYkNUIiwic3ViIjoiNzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yKNBKy04o2645sgyCZtaUE93t6hoGGKV3Z-zlxEyZZs'
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      SickModel sickModel = SickModel.fromJson(data);
      return sickModel;
    } else if (response.statusCode == 429) {
      customSnackBar(
          title: warning,
          message: 'To many requests Please try after 10 minute');
      return fail;
    }
    return fail;
  }
}
