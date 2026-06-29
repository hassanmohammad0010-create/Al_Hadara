import 'dart:io';
import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';
import 'package:http/http.dart' as http;

Future<bool> deleteFun({
  required int id,
  required String type,
  String baseUrl = 'https://medicore-production.up.railway.app/api',
}) async {
  final map = {'C': 'clinics', 'D': 'doctors', 'L': 'laboratories'};

  final segment = map[type.toUpperCase()];
  if (segment == null) {
    throw ArgumentError("type must be one of: 'C', 'D', 'L'");
  }

  final uri = Uri.parse('$baseUrl/$segment/$id');

  final response = await http.delete(
    uri,
    headers: {
      HttpHeaders.authorizationHeader:
          'Bearer ${tokenSharedPreferences!.getString('token')}',
      HttpHeaders.acceptHeader: 'application/json',
    },
  );

  return response.statusCode == 204 ||
      response.statusCode == 200 ||
      response.statusCode == 202;
}
