import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<int> addDoctorToClinic(int doctorId, int clinicId) async {
  final url = Uri.parse(
    'https://medicore-production.up.railway.app/api/doctors/add-to-clinic?doctor_id=$doctorId&clinic_id=$clinicId',
  );

  try {
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer ${tokenSharedPreferences!.getString('token')}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Doctor assigned to clinic successfully');
      print('Response body: ${response.body}');
      return 1;
    } else {
      print('Failed to assign doctor. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      return -1;
    }
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}
