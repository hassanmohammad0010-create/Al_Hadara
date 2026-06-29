import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/centerController/add_service_controller.dart';
import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Hamed/Function/Shered/handel_fun.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Custom_Text_Field.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/CenterHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddServiceToClinicLab extends StatelessWidget {
  AddServiceToClinicLab({
    super.key,
    required this.targetId,
    required this.type,
  });
  final int targetId;
  final String type;
  final AddServiceController addServiceToClinicLab = Get.put(
    AddServiceController(),
  );
  @override
  Widget build(BuildContext context) {
    addServiceToClinicLab.init(type, targetId);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: mainColor,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Add Services',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => CenterHomePage());
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'skip',
                              style: TextStyle(
                                color: const Color.fromRGBO(37, 137, 153, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: mainColor,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextField(
                  libel: 'Service name',
                  maxLine: 1,
                  onTap: (name) {
                    addServiceToClinicLab.changeName(name);
                  },
                  validator: () {},
                ),
                CustomTextField(
                  libel: 'Description',
                  maxLine: 1,
                  onTap: (description) {
                    addServiceToClinicLab.changeDescription(description);
                  },
                  validator: () {},
                ),
                SizedBox(height: 30),
                FunctionalButton(
                  text: 'Add',
                  width: 400,
                  onTap: () {
                    if (addServiceToClinicLab.check()) {
                      handleWithLoading(addServiceToClinicLab.add, () {
                        addServiceToClinicLab.clear();
                        customAlert('Services added');
                      });
                    } else {
                      customAlert('Fill all field');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
