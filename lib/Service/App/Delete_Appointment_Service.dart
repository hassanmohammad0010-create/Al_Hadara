import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

class DeleteAppointmantService {
  Future<String> deleteMyAppointmant({required String id}) async {
    http.Response response = await http.delete(
      Uri.parse(
          'https://medicore-production.up.railway.app/api/appointments/$id'),
      headers: {
        'Authorization': 'bearer ${tokenSharedPreferences!.getString('token')}',
        // 'Authorization':
        //     'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbWVkaWNvcmUtcHJvZHVjdGlvbi51cC5yYWlsd2F5LmFwcC9hcGkvdXNlcnMvbG9naW4iLCJpYXQiOjE3NTcxNTE5NTIsImV4cCI6MTc1NzE1NTU1MiwibmJmIjoxNzU3MTUxOTUyLCJqdGkiOiJCUFJnMXRIdTVuNkN4SWZXIiwic3ViIjoiNzUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4KMLEqWZGjNXOzrUslHtdjumevtuSG--YBnlVX6imQE',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return success;
    } else {
      return fail;
    }
  }
}
