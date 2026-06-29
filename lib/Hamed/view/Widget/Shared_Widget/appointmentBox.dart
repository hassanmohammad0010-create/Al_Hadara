import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class AppointmentBox extends StatelessWidget {
  const AppointmentBox(
      {super.key,
      required this.clinicName,
      required this.doctorName,
      required this.day,
      required this.date});
  final String clinicName;
  final String doctorName;
  final String day;
  final String date;
  // final BookAppointmentController bookController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
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
                blurRadius: 10),
            BoxShadow(
                blurStyle: BlurStyle.inner,
                spreadRadius: 1.5,
                color: mainColor,
                // color: Color.fromARGB(64, 0, 0, 0),
                blurRadius: 8)
          ],
        ),
        // color: Colors.red,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clinicName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                // color: Colors.white,
              ),
            ),
            Text(
              'Dr.$doctorName',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: secondaryTextColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "7:50 PM",
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
    );
  }
}
