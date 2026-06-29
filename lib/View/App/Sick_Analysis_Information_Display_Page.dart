import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Widget/App/Custom_Analysis_Container.dart';
import 'package:al_hadara/Widget/App/Custom_Back_Contaner.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SickAnalysisInformationDisplayPage extends StatelessWidget {
  SickAnalysisInformationDisplayPage({super.key});
  String pageName = 'SickAnalysisInformationDisplay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: constColor,
              alignment: Alignment.topLeft,
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: CustomBackContainer()),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "General Analysiss",
                    style: TextStyle(fontSize: 36, fontFamily: gabriela),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  endIndent: 32,
                  indent: 32,
                ),
                ListView.builder(
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustomServiceInformationDisplayContainer(
                        title: "CBC",
                        information:
                            "Information such as How many hours should I fast? Which tests should be included? How long does it take for the resulrs to appear? The cost of the test");
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
