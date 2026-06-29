import 'package:al_hadara/Hamed/Controller/doctorHomeController/update_doctor_controller.dart';
import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Hamed/Function/Shered/handel_fun.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Custom_Text_Field.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/Day_Picker.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/arrowBackButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/time_picker_2.dart';
import 'package:al_hadara/Model/Doctor_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateDoctorInfo extends StatelessWidget {
  const UpdateDoctorInfo({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    final UpdateDoctorInfoController updateDoctorInfoController = Get.put(
      UpdateDoctorInfoController(doctorModel: doctorModel),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ArrowBackButton(blue: true),
                  SizedBox(width: 50),
                  Text(
                    'Update info',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(
                libel: 'Name',
                init: updateDoctorInfoController.name,
                onTap: (name) {
                  updateDoctorInfoController.changeName(name!);
                },
                validator: () {},
              ),
              CustomTextField(
                libel: 'specialty',
                init: updateDoctorInfoController.specialty,
                onTap: (specialty) {
                  updateDoctorInfoController.changeSpecialty(specialty!);
                },
                validator: () {},
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DayPicker(
                    hint: updateDoctorInfoController.startDay,
                    onChange: (startDay) {
                      updateDoctorInfoController.changeStartDay(startDay);
                    },
                  ),
                  DayPicker(
                    hint: updateDoctorInfoController.endDay,
                    onChange: (endDay) {
                      updateDoctorInfoController.changeEndtDay(endDay);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              GetBuilder<UpdateDoctorInfoController>(
                builder: (updateDoctorInfoController) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimePickerTwo(
                      hint: updateDoctorInfoController.startTime,
                      onChange: (startTime) {
                        updateDoctorInfoController.changeStartTime(startTime);
                      },
                    ),
                    TimePickerTwo(
                      hint: updateDoctorInfoController.endTime,
                      onChange: (endTime) {
                        updateDoctorInfoController.changeEndTime(endTime);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FunctionalButton(
                text: 'update',
                height: 40,
                textSize: 15,
                width: 400,
                onTap: () {
                  updateDoctorInfoController.test();
                  handleWithLoading(
                    updateDoctorInfoController.updateDoctorInfo,
                    () {
                      customAlert('your information has been updated');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
