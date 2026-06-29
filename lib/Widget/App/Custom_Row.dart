import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  CustomRow({super.key, required this.icons, required this.text});
  IconData icons;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            icons,
            color: constColor,
            size: 32,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontFamily: abhayaLibre, fontSize: 24),
          )
        ],
      ),
    );
  }
}
