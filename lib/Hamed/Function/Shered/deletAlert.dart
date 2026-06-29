import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/delet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void deleteAlert(String type, int id, VoidCallback? onDeleteSuccess) {
  Get.defaultDialog(
    title: "Delete",
    // titleStyle: TextStyle(color: Colors.red, fontSize: 30),
    buttonColor: mainColor,
    middleText: "Are you sure you want to delete this $type from your center",
    textConfirm: "OK",
    // middleTextStyle: TextStyle( ),
    cancelTextColor: mainColor,
    textCancel: "Cancel",
    onConfirm: () async {
      Get.back();
      Get.defaultDialog(
        title: "Please wait",
        barrierDismissible: false,
        content: const Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text("Deleting..."),
          ],
        ),
      );

      final success = await deleteFun(
        id: id,
        type: type == laboratory
            ? 'L'
            : type == clinic
                ? 'C'
                : 'D',
      );

      Get.back();

      Get.defaultDialog(
        title: success ? "Success" : "Failed",
        middleText: success ? "Deleted successfully." : "Could not delete.",
        textConfirm: "OK",
        onConfirm: () {
          Get.back();
          if (success && onDeleteSuccess != null) {
            onDeleteSuccess();
          }
        },
      );
    },

    onCancel: () {},
  );
}
