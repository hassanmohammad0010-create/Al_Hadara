import 'package:al_hadara/Constant/Const.dart';
import 'package:get/get.dart';

void customAlert(String alert) {
  Get.defaultDialog(
    title: "Alert",
    // titleStyle: TextStyle(color: Colors.red, fontSize: 30),
    buttonColor: mainColor,
    middleText: alert,
    textConfirm: "OK",
    // middleTextStyle: TextStyle( ),
    cancelTextColor: mainColor,
    onConfirm: () {
      Get.back();
    },
  );
}
