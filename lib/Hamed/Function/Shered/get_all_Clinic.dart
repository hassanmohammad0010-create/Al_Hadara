import 'dart:convert';
import 'package:al_hadara/Hamed/model/SharedModel/clinic_Model.dart';
import 'package:http/http.dart' as http;

Future<List<ClinicModel>> getAllClinic() async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/clinics",
  );

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      List<ClinicModel> clinicsModel =
          data.map((json) => ClinicModel.fromJson(json)).toList();
      return clinicsModel;
    }
  } catch (e) {
    print("Error: $e");
  }

  return [];
}
