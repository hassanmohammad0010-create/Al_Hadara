import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Function/Auth/Signup_Function.dart';
import 'package:al_hadara/Function/Shared/Validation.dart';
import 'package:al_hadara/View/Auth/Sign_in_View_Page.dart';
import 'package:al_hadara/Widget/Auth/Custom_Buttom.dart';
import 'package:al_hadara/Widget/Auth/Custom_Circle.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Text_Failed.dart';
import 'package:al_hadara/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  String pageName = '/Signup';
  GlobalKey<FormState> signupKey = GlobalKey();
  String? role, userName, email, password;
  LoadingIndcatorController loadingController =
      Get.put(LoadingIndcatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: constGreyColor,
        body: GetBuilder<LoadingIndcatorController>(builder: (controller) {
          return Form(
            key: signupKey,
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
                            "Sign up".tr,
                            style: const TextStyle(
                              fontSize: 46,
                              color: Colors.black,
                              fontFamily: madimiOne,
                            ),
                          ),
                          Text(
                            "Hello! Let's join with us".tr,
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
                  child: CircleAvatar(
                    radius: 300,
                    child: CustomCircle(
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  width: 200,
                  right: -70,
                  top: -180,
                  child: CircleAvatar(
                    radius: 300,
                    child: CustomCircle(
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 260),
                  child: Column(
                    children: [
                      CustomDropDown(
                          itemList: ["doctor", "patient"],
                          hintText: "Identity".tr,
                          icon: const Icon(
                            Icons.cases_rounded,
                            color: constColor,
                          ),
                          onChanched: (data) {
                            identitySharedPreferences!
                                .setString('identity', data!);

                            role = data;
                          }),
                      CustomTextFormFaild(
                          maxLine: 1,
                          icon: const Icon(
                            Icons.person_2,
                            color: constColor,
                          ),
                          labelText: 'User Name'.tr,
                          onChange: (data) {
                            userName = data;
                          },
                          validator: (data) {
                            return Validarot().nameValidator(data!);
                          }),
                      CustomTextFormFaild(
                          maxLine: 1,
                          icon: const Icon(
                            Icons.email,
                            color: constColor,
                          ),
                          labelText: 'Email'.tr,
                          onChange: (data) {
                            email = data;
                          },
                          validator: (data) {
                            return Validarot().emailValidate(data!);
                          }),
                      CustomTextFormFaild(
                          maxLine: 1,
                          icon: const Icon(
                            Icons.password,
                            color: constColor,
                          ),
                          labelText: 'Password'.tr,
                          onChange: (data) {
                            password = data;
                          },
                          validator: (data) {
                            return Validarot().passwordValidator(data!);
                          }),
                    ],
                  ),
                ),
                Positioned(
                  width: 600,
                  left: -120,
                  bottom: -420,
                  child: CircleAvatar(
                    radius: 300,
                    child: CustomCircle(
                      height: 600,
                      width: 600,
                      columnChild: Padding(
                        padding: const EdgeInsets.only(top: 70, left: 40),
                        child: Column(
                          children: [
                            CustomButtom(
                                text: "Sign up".tr,
                                ontap: () async {
                                  if (signupKey.currentState!.validate()) {
                                    controller.isLoading();
                                    await signupFunction(
                                      userName: userName!,
                                      email: email!,
                                      password: password!,
                                      role: role!,
                                    );
                                    controller.isntLoading();
                                  }
                                }),
                            const SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offNamed(SigninPage().pageName);
                              },
                              child: Text(
                                'You already have an account?Sign in'.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: abhayaLibre),
                              ),
                            ),
                          ],
                        ),
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
