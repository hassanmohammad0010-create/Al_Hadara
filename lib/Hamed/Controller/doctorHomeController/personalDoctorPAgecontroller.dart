import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Model/Doctor_Model.dart';
import 'package:al_hadara/main.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetDoctorPersonalController extends GetxController {
  DoctorModel? doctorModel;

  getInfo() async {
    final url = Uri.parse(
        'https://medicore-production.up.railway.app/api/doctors/myProfile');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer ${tokenSharedPreferences!.getString('token')}',
          'Content-Type': 'application/json',
        },
      );
      var data = json.decode(response.body) as Map<String, dynamic>;

      print('ddddddddddddddddddddddddddddddddddddddddddddddddd');
      print(doctorModel);
      print(response.statusCode);

      if (response.statusCode == 200) {
        doctorModel = DoctorModel.fromJson(data);
      } else {
        print('Failed to load profile. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching profile: $e');
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfo();
  }
}
