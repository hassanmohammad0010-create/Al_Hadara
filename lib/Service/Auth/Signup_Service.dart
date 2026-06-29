import 'dart:convert';

import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/main.dart';

import 'package:http/http.dart' as http;

class SignupService {
  Future<String> signup(
      {required String name,
      required String email,
      required String password,
      required String role}) async {
    print("before");
    http.Response response = await http.post(
      Uri.parse(
          "https://medicore-production.up.railway.app/api/users/register"),
      body: {
        'name': name,
        'email': email,
        'password': password,
        'role': role,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      tokenSharedPreferences!.setString('token', data['access_token']);
      idSharedPreferences!.setInt('id', data['user']['id']);

      return success;
    } else {
      return fail;
    }
  }
}
