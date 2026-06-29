import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Service/App/Delete_Appointment_Service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

deletAppointment({required String id}) {
  Get.dialog(AlertDialog(
      content: SizedBox(
    height: 180,
    child: Column(children: [
      const Text(
        'Warning',
        style:
            TextStyle(color: Colors.red, fontFamily: abhayaLibre, fontSize: 24),
      ),
      const SizedBox(
        height: 16,
      ),
      const Text(
        'You are about to delete the scheduled appointment.',
        style: TextStyle(fontFamily: abhayaLibre, fontSize: 20),
      ),
      const SizedBox(
        height: 32,
      ),
      GestureDetector(
        onTap: () async {
          Get.back();
          String response =
              await DeleteAppointmantService().deleteMyAppointmant(id: id);
          if (response == success) {
            customSnackBar(
                title: 'Success', message: 'The appointment has been deleted');
          } else {
            customSnackBar(title: warning, message: 'Something went wrong');
          }
        },
        child: Container(
          width: 180,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.red),
          child: const Text(
            'Agree',
            style: TextStyle(fontFamily: abhayaLibre, color: Colors.white),
          ),
        ),
      )
    ]),
  )));
}
