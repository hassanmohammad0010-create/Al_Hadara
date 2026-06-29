import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDoctorContainer extends StatelessWidget {
  CustomDoctorContainer(
      {super.key,
      required this.doctorName,
      required this.specialty,
      this.height,
      this.width,
      required this.onTap});
  String specialty, doctorName;
  VoidCallback onTap;
  double? width, height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width ?? 70,
                  height: height ?? 70,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/Image/defult.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: constColor,
                      borderRadius: BorderRadius.circular(16)),
                ),
                const SizedBox(
                  width: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: gabriela,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        specialty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: constColor,
                            fontSize: 22,
                            fontFamily: abhayaLibre,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
