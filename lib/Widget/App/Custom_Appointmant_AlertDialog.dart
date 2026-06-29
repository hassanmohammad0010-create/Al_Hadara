import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/Shared/Loding_Indcator_Controller.dart';
import 'package:al_hadara/Controller/app/Get_My_Profile_As_Sick_Controller.dart';
import 'package:al_hadara/Function/Shared/Snack_Bar.dart';
import 'package:al_hadara/Service/App/Sick_Book_Appointment_Service.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Colored_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Date.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Dropdown_Buttom.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAppointmantAlertDialog extends StatelessWidget {
  CustomAppointmantAlertDialog(
      {super.key,
      required this.clinicName,
      required this.clinicId,
      required this.doctorName,
      required this.doctorId});
  String clinicName, doctorName;
  String clinicId, doctorId;
  GlobalKey<FormState> appointmantKey = GlobalKey();
  TextEditingController textEditingController = TextEditingController();
  LoadingIndcatorController loadingIndcatorController =
      Get.put(LoadingIndcatorController());
  GetMyProfileAsSickController getMyProfileAsSickController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadingIndcatorController>(builder: (controller) {
      return Stack(
        children: [
          Form(
            key: appointmantKey,
            child: AlertDialog(
              title: const Text(
                "Book an appointmant",
                style: TextStyle(color: constColor, fontFamily: gabriela),
              ),
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              content: SizedBox(
                width: Get.width, // Full screen width
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Wrap content height
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            children: [
                              CustomDropDown(
                                  itemList: [clinicName],
                                  selectedItem: clinicName,
                                  enabled: false,
                                  label: 'Clinic',
                                  hintText: clinicName,
                                  icon: const Icon(Icons.business),
                                  onChanched: (data) {}),
                              CustomDropDown(
                                  itemList: [doctorName],
                                  selectedItem: doctorName,
                                  hintText: doctorName,
                                  enabled: false,
                                  label: 'Doctor Name',
                                  icon: const Icon(Icons.person),
                                  onChanched: (data) {}),
                              CustomDate(
                                hintText: 'Appointment Date',
                                icon: const Icon(
                                  Icons.date_range,
                                  color: constColor,
                                ),
                                textEditingController: textEditingController,
                                labelText: 'Date',
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomColoredButtom(
                          text: 'Agree',
                          ontap: () async {
                            if (appointmantKey.currentState!.validate()) {
                              loadingIndcatorController.isLoading();
                              String response = await SickBookAppointmentService()
                                  .bookAppointmentService(
                                      doctorId: doctorId,
                                      patientId:
                                          "${getMyProfileAsSickController.sickModel!.id}",
                                      clinicId: clinicId,
                                      date: textEditingController.text);
                              loadingIndcatorController.isntLoading();

                              if (response == fail) {
                                customSnackBar(
                                    title: warning,
                                    message: 'Something went wrong');
                              } else if (response == 'no available') {
                                customSnackBar(
                                    title: warning,
                                    message:
                                        ' there are no available appointments on the day provided.');
                              } else if (response == 'worng date') {
                                customSnackBar(
                                    title: warning,
                                    message: 'Please enter a valid date.');
                              } else if (response == 'to many requests') {
                                customSnackBar(
                                    title: warning,
                                    message: 'to many requests.');
                              } else {
                                Get.back();
                                customSnackBar(
                                    duration: 5,
                                    title: success,
                                    message:
                                        "Your appointment will be at $response");
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Note',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: abhayaLibre,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      Text(
                        "Please don't select an appointment after ${DateTime.now().month} /${DateTime.now().day + 9} ",
                        style:
                            const TextStyle(fontFamily: gabriela, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomLoading(load: loadingIndcatorController.load)
        ],
      );
    });
  }
}
