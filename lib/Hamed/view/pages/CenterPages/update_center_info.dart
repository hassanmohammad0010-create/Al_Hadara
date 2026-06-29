import 'package:al_hadara/Hamed/Controller/centerController/update_center_info_controller.dart';
import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Hamed/Function/Shered/handel_fun.dart';
import 'package:al_hadara/Hamed/model/centerModel/cente_model.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Custom_Text_Field.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/Day_Picker.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/arrowBackButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/time_picker_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCenterInfo extends StatelessWidget {
  UpdateCenterInfo({super.key, required this.centerModel});
  final CenterModel centerModel;

  @override
  Widget build(BuildContext context) {
    final UpdateCenterInfoController updateCenterInfoController = Get.put(
      UpdateCenterInfoController(centerModel: centerModel),
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
                init: updateCenterInfoController.name,
                maxLine: 1,
                onTap: (name) {
                  updateCenterInfoController.changeName(name!);
                },
                validator: () {},
              ),
              CustomTextField(
                libel: 'Location',
                init: updateCenterInfoController.location,
                maxLine: 1,
                onTap: (location) {
                  updateCenterInfoController.changeLocation(location!);
                },
                validator: () {},
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DayPicker(
                    hint: updateCenterInfoController.startDay,
                    onChange: (startDay) {
                      updateCenterInfoController.changeStartDay(startDay);
                    },
                  ),
                  DayPicker(
                    hint: updateCenterInfoController.endDay,
                    onChange: (endDay) {
                      updateCenterInfoController.changeEndtDay(endDay);
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              GetBuilder<UpdateCenterInfoController>(
                builder: (updateCenterInfoController) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimePickerTwo(
                      hint: updateCenterInfoController.startTime,
                      onChange: (startTime) {
                        updateCenterInfoController.changeStartTime(startTime);
                      },
                    ),
                    TimePickerTwo(
                      hint: updateCenterInfoController.endTime,
                      onChange: (endTime) {
                        updateCenterInfoController.changeEndTime(endTime);
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
                  updateCenterInfoController.test();
                  handleWithLoading(
                    updateCenterInfoController.updateCenterInfo,
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
