import 'package:al_hadara/Hamed/Controller/centerController/add_patient_controller.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Custom_Text_Field.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/arrowBackButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/customDropDownField.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/datePicker.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/flowButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/namedDivider.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/read_only_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPatient extends StatelessWidget {
  AddNewPatient({super.key});

  final AddPatientController addPatientController = Get.put(
    AddPatientController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ArrowBackButton(blue: true),
                        Text(
                          'Patient Details',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          libel: 'First Name',
                          maxLine: 1,
                          onTap: (fName) {
                            addPatientController.changeFirstName(fName);
                          },
                          validator: () {},
                        ),

                        // Text(
                        //   "you can chose the auto select option to book the nearlest appointment",
                        //   style: TextStyle(
                        //       // fontSize: 20,
                        //       fontWeight: FontWeight.bold,
                        //       color: secondaryTextColor),
                        // ),
                        CustomTextField(
                          libel: 'Last Name',
                          maxLine: 1,
                          onTap: (lName) {
                            addPatientController.changeLastName(lName);
                          },
                          validator: () {},
                        ),
                        GetBuilder<AddPatientController>(
                          builder: (addPatientController) => (Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: DatePicker(
                                  libel: 'Birth day',
                                  hint: addPatientController.birthDay,
                                  birth: true,
                                  fun: (date) {
                                    date == null
                                        ? null
                                        : addPatientController.changeBirthDay(
                                            date,
                                          );
                                  },
                                ),
                              ),
                              ReadOnlyField(
                                libel: 'age',
                                hint: addPatientController.age.toString(),
                                width: 100,
                                onTap: (onTap) {},
                              ),
                            ],
                          )),
                        ),
                        CustomDropDownField(
                          label: 'Gender',
                          height: 50,
                          width: 200,
                          list: addPatientController.genderList,
                          onChange: (gender) {
                            addPatientController.changeGender(gender.option);
                          },
                        ),
                        SizedBox(height: 5),

                        SizedBox(height: 15),
                        NamedDivider(name: 'Additional Info'),

                        CustomTextField(
                          libel: 'Phone',
                          number: true,
                          onTap: (text) {
                            addPatientController.changeAdditionalInfo(text);
                          },
                          validator: () {},
                        ),
                        CustomTextField(
                          libel: 'Email',
                          email: true,
                          onTap: (text) {
                            addPatientController.changeAdditionalInfo(text);
                          },
                          validator: () {},
                        ),
                        CustomTextField(
                          libel: 'libel',
                          onTap: (text) {
                            addPatientController.changeAdditionalInfo(text);
                          },
                          validator: () {},
                          explainText:
                              'mention any detail about this patient that is important for doctor to know',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlowButton(
            text: 'Save',
            pBottom: 20,
            pRight: 20,
            onTap: () {
              addPatientController.test();
            },
          ),
        ],
      ),
    );
  }
}
