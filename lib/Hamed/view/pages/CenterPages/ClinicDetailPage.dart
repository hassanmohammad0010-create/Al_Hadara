import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Clinic_details_Section.dart';
import 'package:flutter/material.dart';

class ClinicDetailPage extends StatelessWidget {
  const ClinicDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: mainColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          'Dental',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, right: 10),
                        child: Icon(Icons.edit, size: 35),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 1),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse_sharp,
                              size: 30,
                              color: mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "6 PM  -  11 PM",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range_rounded,
                              size: 30,
                              color: mainColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "SUNDAY  -  FRIDAY",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 30, color: mainColor),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "cosmetic Clinic",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.5),
                  ClinicDetailsSection(
                    sectionName: 'Specialty',
                    info: ['Bottox', 'ISO', 'Laser'],
                  ),
                  Divider(thickness: 1.5),
                  ClinicDetailsSection(
                    sectionName: 'Services',
                    info: ['Bottox', 'ISO', 'Laser'],
                  ),
                  Divider(thickness: 1.5),
                  Text(
                    "DOCTORS",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      // DoctorShowBox(name: 'ALi Saleh', specialty: 'specialty'),
                      // DoctorShowBox(
                      //     name: 'Gaffar Hana', specialty: 'specialty'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
