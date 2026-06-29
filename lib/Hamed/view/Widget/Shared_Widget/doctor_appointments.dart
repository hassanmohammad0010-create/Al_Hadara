import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class DoctorAppointments extends StatelessWidget {
  const DoctorAppointments({
    super.key,
    required this.clinicName,
    required this.patientName,
    required this.date,
    required this.time,
  });
  final String clinicName;
  final String patientName;
  final String date;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 5, bottom: 10, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 2,
                  // color: mainColor,
                  color: Color.fromARGB(64, 0, 0, 0),
                  blurRadius: 10,
                ),
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 1.5,
                  color: mainColor,
                  // color: Color.fromARGB(64, 0, 0, 0),
                  blurRadius: 8,
                ),
              ],
            ),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clinicName,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  patientName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: secondaryTextColor,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: secondaryTextColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        // Text(
                        //   date,
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //     color: secondaryTextColor,
                        //   ),
                        // ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.auto_delete_outlined, color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
