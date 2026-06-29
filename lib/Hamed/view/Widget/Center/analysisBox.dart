import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class AnalysisBox extends StatelessWidget {
  const AnalysisBox({
    super.key,
    required this.name,
    this.add = false,
  });
  final String name;
  final bool add;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 1,
                  color: add ? mainColor : Color.fromARGB(66, 0, 0, 0),
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
