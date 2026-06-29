import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/app/Get_My_Profile_As_Sick_Controller.dart';

import 'package:al_hadara/Widget/App/Custom_Container.dart';
import 'package:al_hadara/Widget/App/Custom_Sick_AlertDialog_Edit_Information.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SickPersonalPage extends StatelessWidget {
  SickPersonalPage({super.key});
  String pageName = '/SickPersonal';
  GetMyProfileAsSickController getMyProfileAsSickController =
      Get.put(GetMyProfileAsSickController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<GetMyProfileAsSickController>(builder: (controller) {
      return getMyProfileAsSickController.sickModel == null
          ? CustomLoading(load: true)
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage('assets/Image/defult.jpg'),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            getMyProfileAsSickController.sickModel!.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                fontFamily: abhayaLibre),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.dialog(CustonSickAlertDialogEditInformation(
                                name: getMyProfileAsSickController
                                    .sickModel!.name,
                                birthDate: getMyProfileAsSickController
                                    .sickModel!.birthDate,
                                gender: getMyProfileAsSickController
                                    .sickModel!.gender,
                                phone: getMyProfileAsSickController
                                    .sickModel!.phoneNumber,
                              ));
                            },
                            child: const Icon(
                              Icons.edit,
                              size: 32,
                              color: constColor,
                            ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'gender  :  ${getMyProfileAsSickController.sickModel!.gender}',
                            style: const TextStyle(
                              fontFamily: abhayaLibre,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'phone  :  ${getMyProfileAsSickController.sickModel!.phoneNumber}',
                            style: const TextStyle(
                              fontFamily: abhayaLibre,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'BirthDate  :  ${getMyProfileAsSickController.sickModel!.birthDate}',
                            style: const TextStyle(
                              fontFamily: abhayaLibre,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Blood type  :  ${getMyProfileAsSickController.sickModel!.bloodType}',
                            style: const TextStyle(
                              fontFamily: abhayaLibre,
                              fontSize: 24,
                            ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Text(
                        "Personal Analysis".tr,
                        style: const TextStyle(
                            fontSize: 38,
                            fontFamily: abhayaLibre,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    // if analysis existion
                    getMyProfileAsSickController.sickModel == null
                        ? SizedBox(
                            child: ListView.builder(
                              itemCount: 10,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomContainer(
                                        title: "General Analysis",
                                        onTap: () {}),
                                  ),
                                );
                              },
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                              ),
                              Image.asset(
                                'assets/Image/app/test.png',
                                height: 250,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 32),
                                child: Text(
                                  'There are no tests',
                                  style: TextStyle(
                                      fontFamily: madimiOne,
                                      fontSize: 24,
                                      color: constColor),
                                ),
                              )
                            ],
                          )
                  ],
                ),
              ),
            );
    }));
  }
}
