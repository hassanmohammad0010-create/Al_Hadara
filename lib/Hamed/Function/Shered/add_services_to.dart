import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:http/http.dart' as http;

Future<int> addServicesTo({
  required List<int> serviceIds,
  required int targetId,
  required String type,
}) async {
  final String baseUrl = "https://medicore-production.up.railway.app/api";

  final String url = type == clinic
      ? "$baseUrl/clinics/$targetId/addServices"
      : "$baseUrl/doctors/$targetId/addService";

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"services": serviceIds}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('service add to the target ✅✅✅✅');
      return 1;
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return -1;
    }
  } catch (e) {
    print("Exception: $e");
    return -1;
  }
}
