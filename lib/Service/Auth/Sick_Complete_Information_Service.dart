import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

class SickCompleteInformationService {
  Future<String> completeSickInformation({
    required String name,
    required String phone,
    required String gender,
    required String birthDate,
    required String bloodType,
  }) async {
    http.Response response = await http.post(
        Uri.parse('https://medicore-production.up.railway.app/api/patients/'),
        body: {
          "name": name,
          "phone": phone,
          "gender": gender,
          "date_of_birth": birthDate,
          "blood_type": bloodType
        },
        headers: {
          'Authorization':
              // 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTY5MzI0ODQsImV4cCI6MTc1NjkzNjA4NCwibmJmIjoxNzU2OTMyNDg0LCJqdGkiOiJqUXNoWEJXZmpiQVBER1IwIiwic3ViIjoiNzMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.SBKYwwHcqHGRr9oHj3nZmDd3n2pkslECK26xhiMdVm0'
              'bearer ${tokenSharedPreferences!.getString('token')}'
        });

    if (response.statusCode == 201) {
      return success;
    } else {
      return fail;
    }
  }
}
