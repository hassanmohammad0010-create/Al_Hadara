import 'package:al_hadara/Hamed/view/Widget/Center/analysisBox.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/Top_Colored_section.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/flowButton.dart';
import 'package:flutter/material.dart';

class LabDetailPage extends StatelessWidget {
  const LabDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopColoredSection(),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dental Laboratory",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              // onTap: () => {Get.to(AddEditClinicPage())},
                              child: Icon(Icons.edit, size: 35),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 25, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SUN  -  Friday",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "2:00 PM - 7:00 PM",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 1.5),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aviailable Analysis",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15, top: 5),
                                child: Text(
                                  "Choose the wanted analyis to do",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top: 10),
                                child: Wrap(
                                  children: [
                                    AnalysisBox(name: 'CBC'),
                                    AnalysisBox(name: 'CRS'),
                                    AnalysisBox(name: 'Heart'),
                                    AnalysisBox(name: '+', add: true),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 1.5),
                        Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle, size: 10),
                                  SizedBox(width: 8),
                                  Text(
                                    "CBC",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "informayim should know about the analysis , how many hours shoul i fast?",
                                style: TextStyle(
                                  // color: Color.fromARGB(214, 0, 0, 0),
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(thickness: 1.5),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle, size: 10),
                                  SizedBox(width: 8),
                                  Text(
                                    "CBC",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "informayim should know about the analysis , how many hours shoul i fast?",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(thickness: 1.5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlowButton(text: 'Appoint', pBottom: 5, pRight: 5),
        ],
      ),
    );
  }
}
