import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Function/Shared/Validation.dart';
import 'package:al_hadara/Widget/App/Custom_Back_Contaner.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ReportPage extends StatelessWidget {
  ReportPage({super.key});
  String pageName = 'ReportPage';
  GlobalKey<FormState> reportKey = GlobalKey();
  String? report;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: reportKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 180,
                color: constColor,
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: CustomBackContainer(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 16,
                    ),
                    Text(
                      "Report".tr,
                      style: const TextStyle(
                          color: constColor,
                          fontFamily: abhayaLibre,
                          fontSize: 34),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "You can submit a report about any service or method to help us detect errors and provide the best form of service."
                          .tr,
                      style: const TextStyle(
                          fontFamily: abhayaLibre, fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormFaild(
                  icon: const Icon(
                    Icons.edit,
                    color: constColor,
                  ),
                  maxLine: 6,
                  labelText: 'Report'.tr,
                  onChange: (data) {},
                  validator: (data) {
                    report = data;
                    return Validarot().generalValidation(report!);
                  }),
              const SizedBox(
                height: 32,
              ),
              Align(
                  alignment: Alignment.center,
                  child: CustomColoredButtom(
                    text: 'Apply'.tr,
                    ontap: () {
                      if (reportKey.currentState!.validate()) {}
                    },
                  )),
              const SizedBox(
                height: 180,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Thank you for your interest. We will respond as soon as possible.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 18,
                    fontFamily: abhayaLibre,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
