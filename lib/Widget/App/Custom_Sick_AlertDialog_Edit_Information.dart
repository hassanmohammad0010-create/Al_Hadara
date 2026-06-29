import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Controller/app/Get_My_Profile_As_Sick_Controller.dart';
import 'package:al_hadara/Function/Shared/Check_Internet.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Function/Shared/Validation.dart';
import 'package:al_hadara/Model/Sick_Model.dart';
import 'package:al_hadara/Service/App/Up_Date_Patient_Information_Service.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Date.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustonSickAlertDialogEditInformation extends StatelessWidget {
  CustonSickAlertDialogEditInformation({
    super.key,
    required this.name,
    required this.gender,
    required this.phone,
    required this.birthDate,
  });
  String name, phone, gender, birthDate;
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> sickEditPage = GlobalKey();
  LoadingIndcatorController loadingIndcatorController =
      Get.put(LoadingIndcatorController());
  GetMyProfileAsSickController getMyProfileAsSickController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingIndcatorController>(builder: (controller) {
      return Stack(
        children: [
          Form(
              key: sickEditPage,
              child: AlertDialog(
                title: const Text(
                  "Edit Page",
                  style: TextStyle(color: constColor, fontFamily: gabriela),
                ),
                contentPadding: EdgeInsets.zero,
                insetPadding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  // Optional: Make corners rounded
                  borderRadius: BorderRadius.circular(8),
                ),
                content: SingleChildScrollView(
                  child: SizedBox(
                    width: Get.width, // Full screen width
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Wrap content height
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          const CircleAvatar(
                            radius: 100,
                            backgroundImage:
                                AssetImage('assets/Image/defult.jpg'),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  CustomTextFormFaild(
                                      initialValue: getMyProfileAsSickController
                                          .sickModel!.name,
                                      maxLine: 1,
                                      icon: const Icon(
                                        Icons.person_2,
                                        color: constColor,
                                      ),
                                      labelText: 'User Name',
                                      onChange: (data) {
                                        name = data;
                                      },
                                      validator: (data) {
                                        return Validarot().nameValidator(data!);
                                      }),
                                  CustomDropDown(
                                      selectedItem: getMyProfileAsSickController
                                          .sickModel!.gender,
                                      itemList: genderTypes,
                                      hintText: 'Gender',
                                      icon: const Icon(Icons.person),
                                      onChanched: (data) {
                                        gender = data!;
                                      }),
                                  CustomDate(
                                    initialValue: getMyProfileAsSickController
                                        .sickModel!.birthDate,
                                    textEditingController:
                                        textEditingController,
                                    labelText: 'Birth Day',
                                    icon: const Icon(
                                      Icons.cake,
                                    ),
                                  ),
                                  CustomTextFormFaild(
                                      initialValue: getMyProfileAsSickController
                                          .sickModel!.phoneNumber,
                                      maxLenght: 10,
                                      icon: const Icon(
                                        Icons.phone,
                                      ),
                                      textInputType: TextInputType.number,
                                      labelText: 'Phone number',
                                      onChange: (data) {
                                        phone = data;
                                      },
                                      validator: (data) {
                                        return Validarot()
                                            .numberValidation(data!);
                                      }),
                                ],
                              )),
                          const SizedBox(
                            height: 32,
                          ),
                          CustomColoredButtom(
                            text: "Apply",
                            ontap: () async {
                              if (sickEditPage.currentState!.validate()) {
                                loadingIndcatorController.isLoading();
                                if (await checkInternet()) {
                                  dynamic response =
                                      await UpDateSickInformation()
                                          .upDateSickInformation(
                                              name: name,
                                              phone: phone,
                                              gender: gender,
                                              birthDate:
                                                  textEditingController.text);
                                  if (response != fail) {
                                    SickModel sickModel = response;
                                    await getMyProfileAsSickController
                                        .set(sickModel);
                                  } else {
                                    customSnackBar(
                                        title: warning,
                                        message:
                                            'To many requests Please try after 10 minute');
                                  }

                                  Get.back();

                                  customSnackBar(
                                      title: "Success",
                                      message: "Information has been updated");
                                } else {
                                  customSnackBar(
                                      title: warning,
                                      message: "Please check internet");
                                }
                                loadingIndcatorController.isntLoading();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          CustomLoading(load: loadingIndcatorController.load)
        ],
      );
    });
  }
}
