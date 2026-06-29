import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/centerController/addEditClinicController.dart';
import 'package:al_hadara/Hamed/Controller/centerController/add_doctor_to_clicnc_controller.dart';
import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Hamed/Function/Shered/handel_fun.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Custom_Text_Field.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/Day_Picker.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/Time_Picker.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/arrowBackButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/add_doctor_to_clinic.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/add_service_to_clinic_lab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClinicLabPage extends StatelessWidget {
  AddClinicLabPage({super.key, required this.type});
  final String type;
  final AddClinicLabController addEditClinicController = Get.put(
    AddClinicLabController(),
  );
  final AddDoctorToClinicController addDoctorToClinicController = Get.put(
    AddDoctorToClinicController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 40,
            right: 20,
            bottom: 85,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowBackButton(blue: true),
                    Text(
                      type == laboratory
                          ? "Laboratory Details"
                          : "CLinic Details",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "INFO",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                CustomTextField(
                  libel: 'Specialty',
                  hight: 50,
                  maxLine: 1,
                  onTap: (String? specialty) {
                    addEditClinicController.changeSpecialty(specialty);
                  },
                  validator: () {},
                ),
                CustomTextField(
                  libel: 'Summary',
                  explainText:
                      'add some detail about this section and what is special about it',
                  hint:
                      'add some details about this clinic, equipment,tools,etc...',
                  onTap: (String? summary) {
                    addEditClinicController.changeSummary(summary);
                  },
                  validator: () {},
                ),
                SizedBox(height: 15),
                Text(
                  "Work Time",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DayPicker(
                      hint: 'From',
                      onChange: (day) {
                        addEditClinicController.changeDayFrom(day);
                      },
                    ),
                    DayPicker(
                      hint: "TO",
                      onChange: (day) {
                        addEditClinicController.changeDayTo(day);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<AddClinicLabController>(
                      builder: (addEditClinicController) => (TimePicker(
                        hint: addEditClinicController.hourFrom == null
                            ? 'From'
                            : addEditClinicController.hourFrom!,
                        from: true,
                      )),
                    ),
                    GetBuilder<AddClinicLabController>(
                      builder: (addEditClinicController) => (TimePicker(
                        hint: addEditClinicController.hourTo == null
                            ? 'To'
                            : addEditClinicController.hourTo!,
                      )),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Divider(thickness: 1.5),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FunctionalButton(
                    text: "Save and Continue",
                    width: 400,
                    onTap: () async {
                      type == laboratory
                          ? {
                              if (addEditClinicController.checkLab())
                                {
                                  handleWithLoading(
                                    addEditClinicController.addLaboratory,
                                    () {
                                      if (addEditClinicController.id != null &&
                                          addEditClinicController.id! >= 0) {
                                        Get.to(AddServiceToClinicLab(
                                          targetId: addEditClinicController.id!,
                                          type: laboratory,
                                        ));
                                      }
                                    },
                                  ),
                                }
                              else
                                {
                                  customAlert(
                                    "some data is missing, pleas fill the form",
                                  ),
                                },
                            }
                          : {
                              if (addEditClinicController.check())
                                {
                                  handleWithLoading(
                                    addEditClinicController.add,
                                    () {
                                      if (addEditClinicController.id != null &&
                                          addEditClinicController.id! >= 0) {
                                        Get.to(AddDoctorToClinicPage(
                                            clinicId:
                                                addEditClinicController.id!));
                                      }
                                    },
                                  ),
                                  // print(addEditClinicController.add()),
                                }
                              else
                                {
                                  customAlert(
                                    "some data is missing, pleas fill the form",
                                  ),
                                },
                            };
                    },
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
