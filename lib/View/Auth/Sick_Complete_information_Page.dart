import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Function/Auth/Sick_Complete_Information_Function.dart';

import 'package:al_hadara/Function/Shared/Validation.dart';

import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Date.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SickCompleteInformationPage extends StatelessWidget {
  SickCompleteInformationPage({super.key, this.name});
  GlobalKey<FormState> sickInformationKey = GlobalKey();
  String pageName = '/SickCompleteInformationPage';
  LoadingIndcatorController loadingIndcatorController =
      Get.put(LoadingIndcatorController());
  TextEditingController textEditingController = TextEditingController();
  String? gender, bloodType, phoneNum, name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constGreyColor,
        body: GetBuilder<LoadingIndcatorController>(builder: (controller) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: sickInformationKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Complete Information ".tr,
                          style: const TextStyle(
                              fontFamily: pacifico,
                              fontSize: 40,
                              color: constColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('assets/Image/defult.jpg'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomDropDown(
                            itemList: genderTypes,
                            hintText: 'Gender',
                            icon: const Icon(Icons.person),
                            onChanched: (data) {
                              gender = data;
                            }),
                        CustomDate(
                          textEditingController: textEditingController,
                          labelText: 'Birth Day',
                          icon: const Icon(
                            Icons.cake,
                          ),
                        ),
                        CustomDropDown(
                            itemList: bloodTypes,
                            hintText: 'Blood Type',
                            icon: const Icon(Icons.person),
                            onChanched: (data) {
                              bloodType = data;
                            }),
                        CustomTextFormFaild(
                            maxLenght: 10,
                            icon: const Icon(
                              Icons.phone,
                            ),
                            textInputType: TextInputType.number,
                            labelText: 'Phone number',
                            onChange: (data) {
                              phoneNum = data;
                            },
                            validator: (data) {
                              return Validarot().numberValidation(data!);
                            }),
                        const SizedBox(
                          height: 32,
                        ),
                        CustomColoredButtom(
                          text: "Complete".tr,
                          ontap: () async {
                            if (sickInformationKey.currentState!.validate()) {
                              loadingIndcatorController.isLoading();
                              await sickCompleteInformationFunction(
                                  name: name!,
                                  gender: gender!,
                                  birthDay: textEditingController.text,
                                  bloodType: bloodType!,
                                  phoneNum: phoneNum!);

                              loadingIndcatorController.isntLoading();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              CustomLoading(load: controller.load)
            ],
          );
        }));
  }
}
