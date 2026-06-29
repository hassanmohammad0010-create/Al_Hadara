import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackContainer extends StatelessWidget {
  const CustomBackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: const Icon(
          Icons.arrow_back_sharp,
          size: 40,
          color: constColor,
        ),
      ),
    );
  }
}
