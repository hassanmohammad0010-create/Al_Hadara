import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
    required this.blue,
  });
  final bool blue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: blue ? mainColor : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: blue ? Colors.white : mainColor,
          )),
    );
  }
}
