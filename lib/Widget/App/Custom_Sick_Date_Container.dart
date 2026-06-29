import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class CustomSickDateContainer extends StatelessWidget {
  const CustomSickDateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Clinic : Clinic name ',
                style: TextStyle(fontSize: 24, fontFamily: gabriela),
              ),
              Text(
                'Doctor : Doctor name ',
                style: TextStyle(fontSize: 24, fontFamily: gabriela),
              ),
              Text(
                'Date : Date ',
                style: TextStyle(fontSize: 24, fontFamily: gabriela),
              ),
              Text(
                'Type : type',
                style: TextStyle(fontSize: 24, fontFamily: gabriela),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
