import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> handleWithLoading(
  Future<int> Function() action,
  VoidCallback onSuccess,
) async {
  Get.defaultDialog(
    title: "Please wait",
    barrierDismissible: false,
    content: const Column(
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 16),
        // Text("Deleting..."),
      ],
    ),
  );

  try {
    final result = await action();
    Get.back();

    if (result >= 0) {
      onSuccess();
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Try again, something went wrong",
        textConfirm: "OK",
        onConfirm: () => Get.back(),
      );
    }
  } catch (e) {
    Get.back();
    Get.defaultDialog(
      title: "Error",
      middleText: "Try again, something went wrong",
      textConfirm: "OK",
      onConfirm: () => Get.back(),
    );
    print("Error: $e");
  }
}
