import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/centerController/centerHomeController.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/add_doc_to_clinic.dart';
import 'package:al_hadara/Hamed/Function/Shered/deletAlert.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Center_Home_Page_Doctor_Show_Box.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/LabAndServicesBox.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/addButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/clinicBox.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/namedDivider.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/Add_Edit_Clinic-Page.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/add-doc_to_clinicTWo.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/add_doctor_to_clinic.dart';
import 'package:al_hadara/Hamed/view/pages/SharedPage/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CenterHomePage extends StatelessWidget {
  CenterHomePage({super.key});

  final CenterHomeController homeController = Get.put(CenterHomeController());

  @override
  Widget build(BuildContext context) {
    homeController.getClinics();
    homeController.getDoctors();
    homeController.getLabs();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat('EEEE').format(DateTime.now()),
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateFormat(
                                      'd/M/yyyy',
                                    ).format(DateTime.now()),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Builder(
                            builder: (context) => IconButton(
                              onPressed: () {
                                Get.to(SettingPage());
                              },
                              icon: Icon(
                                Icons.settings,
                                color: mainColor,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1),
                  ],
                ),
              ),
              NamedDivider(name: 'Clinic'),
              SizedBox(height: 8),
              GetBuilder<CenterHomeController>(
                builder: (homeController) => homeController.clinic != null
                    ? SizedBox(
                        width: double.maxFinite,
                        child: Wrap(
                          spacing: 15,
                          alignment: WrapAlignment.start,
                          children: List.generate(
                                homeController.clinic!.length,
                                (index) => (ClinicBox(
                                  clinicName:
                                      homeController.clinic![index].name!,
                                  onLongPress: () {
                                    deleteAlert(
                                      "Clinic",
                                      homeController.clinic![index].id!,
                                      () {
                                        homeController.getClinics();
                                      },
                                    );
                                  },
                                  onTap: () {
                                    Get.to(AddDoctorToClinicPageTwo(
                                        clinicId:
                                            homeController.clinic![index].id!));
                                  },
                                )),
                              ) +
                              [
                                ClinicBox(
                                  clinicName: 'clinicName',
                                  add: true,
                                  onTap: () {
                                    Get.to(AddClinicLabPage(type: clinic));
                                  },
                                  onLongPress: () {},
                                ),
                              ],
                        ),
                      )
                    : SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(), // loading spinner
                        ),
                      ),
              ),
              SizedBox(height: 8),
              NamedDivider(name: "Laboratory"),
              SizedBox(height: 8),
              GetBuilder<CenterHomeController>(
                builder: (homeController) => homeController.laboratory != null
                    ? (Column(
                        children: [
                          ...List.generate(
                            homeController.laboratory!.length,
                            (index) => (LabAndServiceBox(
                              name: homeController.laboratory![index].name,
                              id: homeController.laboratory![index].id,
                              onTap: () {},
                              onTapIcon: () {
                                homeController.getLabs();
                              },
                            )),
                          ),
                          AddButton(
                            onTap: () {
                              Get.to(AddClinicLabPage(type: laboratory));
                            },
                          ),
                        ],
                      ))
                    : SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(), // loading spinner
                        ),
                      ),
              ),
              SizedBox(height: 24),
              user == center
                  ? Column(
                      children: [
                        NamedDivider(name: 'doctor'),
                        SizedBox(height: 8),
                        GetBuilder<CenterHomeController>(
                          builder: (homeController) => homeController.doctor !=
                                  null
                              ? Column(
                                  children: [
                                    ...List.generate(
                                      homeController.doctor!.length,
                                      (index) => (DoctorShowBox(
                                        name:
                                            homeController.doctor![index].name,
                                        specialty: homeController
                                            .doctor![index].specialty,
                                        id: homeController.doctor![index].id,
                                        onDeleteSuccess: () {
                                          homeController.getDoctors();
                                        },
                                      )),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 100,
                                  child: Center(
                                    child:
                                        CircularProgressIndicator(), // loading spinner
                                  ),
                                ),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
