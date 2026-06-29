import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomViewComponent extends StatelessWidget {
  String imagePath;
  String title;
  String text;
  CustomViewComponent(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        color: constGreyColor,
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Image.asset(
              imagePath,
              width: 420,
              height: 400,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 36, fontFamily: abhayaLibre, color: constColor),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: abhayaLibre,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
