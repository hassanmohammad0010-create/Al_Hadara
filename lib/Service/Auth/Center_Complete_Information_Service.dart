import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';

import 'package:http/http.dart' as http;

class CenterCompleteInformationService {
  Future<String> completeCenterInformation({
    required String name,
    required String location,
    required String statDay,
    required String endDay,
    required String startTime,
    required String endTime,
  }) async {
    http.Response response = await http.post(
        Uri.parse('https://medicore-production.up.railway.app/api/centers'),
        body: {
          // "name": name,
          // //"image_url": null,
          // "start_day": '2025-08-05',
          // "end_day": '2025-08-05',
          // //  "start_day": statDay,
          // // "end_day": endDay,
          // "start_time": startTime,
          // "end_time": endTime,
          // "location": location,

          "name": 'mycenter1',
          //"image_url": null,
          "start_day": '2025-08-05',
          "end_day": '2025-08-05',
          //  "start_day": statDay,
          // "end_day": endDay,
          "start_time": '14:30',
          "end_time": '14:30',
          "location": 'Damascus',
        },
        headers: {
          'Authorization':
              'bearer ${tokenSharedPreferences!.getString('token')}'
          // 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTY0NzExOTEsImV4cCI6MTc1NjQ3NDc5MSwibmJmIjoxNzU2NDcxMTkxLCJqdGkiOiJFVFRpU2g2Nm1nN3JnTmxiIiwic3ViIjoiMzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.KR9x0A3cSnDee4dVcpZ3KJgYoke3XkMwleD9ixNtyQI'
        });

    if (response.statusCode == 201) {
      return success;
    } else {
      return fail;
    }
  }
}
