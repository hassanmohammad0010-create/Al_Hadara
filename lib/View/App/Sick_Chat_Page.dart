import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/app/Get_My_Appointment_Controller.dart';
import 'package:al_hadara/Widget/App/Custom_Center_Date_Container.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SickChatPage extends StatelessWidget {
  SickChatPage({super.key});
  String pageName = 'SickChat';

  GetMyAppointmentController myAppointmentController =
      Get.put(GetMyAppointmentController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<GetMyAppointmentController>(builder: (controller) {
      return myAppointmentController.appointments == null
          ? CustomLoading(load: true)
          : myAppointmentController.appointments!.isEmpty
              ? Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset('assets/Image/app/chatPage.png'),
                    const Text(
                      'There are no appointments',
                      style: TextStyle(fontFamily: abhayaLibre, fontSize: 22),
                    )
                  ],
                )
              : SizedBox(
                  child: ListView.builder(
                    itemCount: myAppointmentController.appointments!.length,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomAppointmentContainer(
                              appointmentModel:
                                  myAppointmentController.appointments![index],
                            )),
                      );
                    },
                  ),
                );
    }));
  }
}
