import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomColoredButtom extends StatelessWidget {
  String text;
  VoidCallback? ontap;
  CustomColoredButtom({super.key, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 250,
        alignment: Alignment.center,
        height: 54,
        decoration: const BoxDecoration(
            color: constColor,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24, fontFamily: abhayaLibre, color: Colors.white),
        ),
      ),
    );
  }
}
