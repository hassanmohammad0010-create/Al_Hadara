import 'dart:convert';
import 'package:al_hadara/Hamed/model/centerModel/cente_model.dart';
import 'package:http/http.dart' as http;

Future<CenterModel?> getCenter() async {
  final String url = 'https://medicore-production.up.railway.app/api/centers/1';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CenterModel.fromJson(data);
    } else {
      throw Exception('Failed to load center. Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching center: $e');
    return null;
  }
}
