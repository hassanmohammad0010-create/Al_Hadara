import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class ClinicAndLabIcon extends StatelessWidget {
  const ClinicAndLabIcon(
      {super.key,
      required this.text,
      required this.hight,
      this.width,
      this.add = false});
  final String text;
  final double hight;
  final double? width;
  final bool add;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
        width: width,
        height: hight,
        decoration: BoxDecoration(
          color: add ? Colors.white : mainColor,
          // border: Border.all(color: Color.fromARGB(255, 4, 241, 201), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(hight / 4)),
          boxShadow: [
            BoxShadow(
                blurStyle: BlurStyle.outer,
                spreadRadius: 2,
                color: Color.fromARGB(66, 0, 0, 0),
                blurRadius: 12)
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: add ? mainColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
