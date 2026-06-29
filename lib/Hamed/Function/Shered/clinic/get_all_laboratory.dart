import 'dart:convert';
import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/model/SharedModel/laboratory_model.dart';
import 'package:http/http.dart' as http;

Future<List<LaboratoryModel>> getAllLaboratories() async {
  final url = Uri.parse(
    "https://medicore-production.up.railway.app/api/laboratories",
  );

  try {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> data = jsonDecode(response.body);
      List<LaboratoryModel> labsModel =
          data.map((json) => LaboratoryModel.fromJson(json)).toList();
      return labsModel;
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      return [];
    }
  } catch (e) {
    print("Exception: $e");
    return [];
  }
}
