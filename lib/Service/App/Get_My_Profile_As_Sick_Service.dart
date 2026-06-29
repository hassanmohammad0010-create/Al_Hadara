import 'dart:convert';

import 'package:al_hadara/Model/Sick_Model.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

class GetMyProfileAsSickService {
  Future<SickModel> getMyProfile() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://medicore-production.up.railway.app/api/patients/myProfile'),
      headers: {
        'Authorization': 'bearer ${tokenSharedPreferences!.getString('token')}',
        // 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTcxNTE5NTIsImV4cCI6MTc1NzE1NTU1MiwibmJmIjoxNzU3MTUxOTUyLCJqdGkiOiJCUFJnMXRIdTVuNkN4SWZXIiwic3ViIjoiNzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4KMLEqWZGjNXOzrUslHtdjumevtuSG--YBnlVX6imQE'

        // 'Authorization':
        // 'bearer ${tokenSharedPreferences!.getString('token')}'
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      SickModel sickModel = SickModel.fromJson(data);
      return sickModel;
    } else {
      throw Exception();
    }
  }
}
