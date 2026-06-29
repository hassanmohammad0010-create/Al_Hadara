import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomServiceInformationDisplayContainer extends StatelessWidget {
  CustomServiceInformationDisplayContainer(
      {super.key, required this.title, required this.information});
  String title, information;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontFamily: gabriela),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            information,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 20, fontFamily: gabriela),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
            endIndent: 8,
            indent: 8,
          ),
          const SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
