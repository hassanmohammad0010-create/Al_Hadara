import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Function/Auth/Signin_Function.dart';
import 'package:al_hadara/Function/Shared/Validation.dart';

import 'package:al_hadara/View/Auth/Enter_Email_View_Page.dart';
import 'package:al_hadara/View/Auth/Sign_up_View_Page.dart';
import 'package:al_hadara/Widget/Auth/Custom_Buttom.dart';
import 'package:al_hadara/Widget/Auth/Custom_Circle.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:al_hadara/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  String pageName = '/Signin';
  GlobalKey<FormState> signInKey = GlobalKey();
  String? identity, email, password;
  LoadingIndcatorController loadingIndcatorController =
      Get.put(LoadingIndcatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: constGreyColor,
        body: GetBuilder<LoadingIndcatorController>(builder: (controller) {
          return Form(
            key: signInKey,
            child: Stack(
              children: [
                Positioned(
                  width: 500,
                  left: -100,
                  top: -320,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 390, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in".tr,
                            style: const TextStyle(
                              fontSize: 46,
                              color: Colors.black,
                              fontFamily: madimiOne,
                            ),
                          ),
                          Text(
                            "Hey!Good to see you".tr,
                            style: const TextStyle(
                                fontSize: 22,
                                fontFamily: gabriela,
                                color: Colors.black
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: 200,
                  right: -30,
                  top: -250,
                  child: CustomCircle(
                    height: 200,
                    width: 200,
                  ),
                ),
                Positioned(
                  width: 200,
                  right: -70,
                  top: -180,
                  child: CustomCircle(
                    height: 200,
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 310),
                  child: Column(
                    children: [
                      CustomDropDown(
                          itemList: identityList,
                          hintText: "Identity".tr,
                          icon: const Icon(
                            Icons.cases_rounded,
                            color: constColor,
                          ),
                          onChanched: (data) {
                            identitySharedPreferences!
                                .setString('identity', data!);
                            identity = data;
                          }),
                      CustomTextFormFaild(
                          maxLine: 1,
                          icon: const Icon(
                            Icons.email,
                            color: constColor,
                          ),
                          labelText: 'Email'.tr,
                          onChange: (data) {},
                          validator: (data) {
                            email = data;
                            return Validarot().emailValidate(email!);
                          }),
                      CustomTextFormFaild(
                          maxLine: 1,
                          icon: const Icon(
                            Icons.password,
                            color: constColor,
                          ),
                          labelText: 'Password'.tr,
                          onChange: (data) {},
                          validator: (data) {
                            password = data;
                            return Validarot().passwordValidator(password!);
                          }),
                    ],
                  ),
                ),
                Positioned(
                  width: 600,
                  left: -120,
                  bottom: -400,
                  child: CustomCircle(
                    height: 600,
                    width: 600,
                    columnChild: Padding(
                      padding: const EdgeInsets.only(top: 70, left: 40),
                      child: Column(
                        children: [
                          CustomButtom(
                              text: "Sign in".tr,
                              ontap: () async {
                                if (signInKey.currentState!.validate()) {
                                  loadingIndcatorController.isLoading();
                                  await signinFunction(
                                      email: email!, password: password!);
                                  loadingIndcatorController.isntLoading();
                                }
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offNamed(SignupPage().pageName);
                            },
                            child: Text(
                              "Don't have an account?Sign up".tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: abhayaLibre),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(EnterEmailPage().pageName);
                            },
                            child: Text(
                              "Forget password".tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: abhayaLibre),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomLoading(load: controller.load)
              ],
            ),
          );
        }));
  }
}
