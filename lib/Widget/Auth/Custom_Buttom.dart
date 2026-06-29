import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  String text;
  VoidCallback ontap;
  CustomButtom({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 320,
        alignment: Alignment.center,
        height: 40,
        decoration: const BoxDecoration(
            color: constWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24, fontFamily: abhayaLibre, color: Colors.black),
        ),
      ),
    );
  }
}
