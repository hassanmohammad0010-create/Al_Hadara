import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<bool> deleteDoctor(int id) async {
  final url = Uri.parse(
    'https://medicore-production.up.railway.app/api/doctors/$id',
  );

  try {
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer ${tokenSharedPreferences!.getString('token')}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print('Doctor deleted successfully');
      return true;
    } else {
      print('Failed to delete doctor. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return false;
}
