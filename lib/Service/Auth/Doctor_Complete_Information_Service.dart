import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

class DoctorCompleteInformationService {
  Future<String> completeDoctorInformation({
    required String specialization,
    required String statDay,
    required String endDay,
    required String startTime,
    required String endTime,
    required String name,
  }) async {
    http.Response response = await http.post(
        Uri.parse('https://medicore-production.up.railway.app/api/doctors'),
        body: {
          "name": name,
          //"image_url": null,
          //"clinic_id": 1,
          "start_day": statDay,
          "end_day": endDay,
          "start_time": startTime,
          "end_time": endTime,
          "specialty": specialization
        },
        headers: {
          // 'Authorization':
          //     'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTY2MzAzOTIsImV4cCI6MTc1NjYzMzk5MiwibmJmIjoxNzU2NjMwMzkyLCJqdGkiOiJCY0RwT0JCN3p2ZFFad094Iiwic3ViIjoiNDgiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.f13uCx5ltlUOLGNb3XaRW5Z3snmIsiH2dRRG5jW_6EA'
          'Authorization':
              'bearer ${tokenSharedPreferences!.getString('token')}'
        });

    if (response.statusCode == 201) {
      return success;
    } else {
      return fail;
    }
  }
}
