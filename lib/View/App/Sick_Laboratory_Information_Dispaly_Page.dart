import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Model/Lab_Model.dart';
import 'package:al_hadara/Widget/App/Custom_Analysis_Container.dart';
import 'package:al_hadara/Widget/App/Custom_Back_Contaner.dart';
import 'package:al_hadara/Widget/App/Custom_Row.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SickLaboratoryInformationDispalyPage extends StatelessWidget {
  SickLaboratoryInformationDispalyPage({super.key, this.labModel});
  String pageName = '/SickLaboratoryInformationDispaly';
  LabModel? labModel;
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
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Laboratory ",
                        style: TextStyle(fontSize: 36, fontFamily: gabriela),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomRow(
                        icons: Icons.star_border_purple500_sharp,
                        text: labModel!.name,
                      ),
                      CustomRow(
                        icons: Icons.schedule_sharp,
                        text:
                            "From  ${labModel!.startTime.substring(0, 5)} to ${labModel!.endTime.substring(0, 5)} ",
                      ),
                      CustomRow(
                        icons: Icons.calendar_month_sharp,
                        text:
                            "From ${labModel!.startDay} to ${labModel!.endDay}",
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  endIndent: 32,
                  indent: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Service",
                    style: TextStyle(fontSize: 36, fontFamily: gabriela),
                  ),
                ),
                labModel!.services!.isEmpty
                    ? Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: const Text(
                          'There are no services to provide.',
                          style: TextStyle(
                              color: constColor,
                              fontFamily: abhayaLibre,
                              fontSize: 20),
                        ),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: labModel!.services!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomServiceInformationDisplayContainer(
                              title: labModel!.services![index].name,
                              information:
                                  labModel!.services![index].description);
                        },
                      ),
                const SizedBox(
                  height: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
