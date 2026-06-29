import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:http/http.dart' as http;

Future<int> addService({
  required int clinicId,
  required String name,
  required String description,
}) async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/services",
  );

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"name": name, "description": description}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print(" Service added successfully: $data");
      return data['id'];
    } else {
      print(
        " Failed to add service: ${response.statusCode} - ${response.body}",
      );
      return -1;
    }
  } catch (e) {
    print(" Exception occurred: $e");
    return -1;
  }
}
