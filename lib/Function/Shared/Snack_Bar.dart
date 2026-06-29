import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar(
    {required String title, required String message, int? duration}) {
  Get.snackbar(title, message,
      duration: Duration(seconds: duration ?? 3),
      backgroundColor: title == 'Warning'.tr ? Colors.red : consttwisColor,
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      messageText: Text(
        message.tr,
        style: const TextStyle(
            fontFamily: abhayaLibre, fontSize: 20, color: Colors.white),
      ));
}
