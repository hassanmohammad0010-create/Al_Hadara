import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/sharedPageController/bookAppointmentController.dart';
import 'package:al_hadara/Hamed/Function/Shered/custom_alert.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Custom_Text_Field.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/appointmentBox.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/customDropDownField.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/datePicker.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/flowButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/namedDivider.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/add_new_patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookAppointmentPage extends StatelessWidget {
  BookAppointmentPage({super.key});

  final BookAppointmentController bookController = Get.put(
    BookAppointmentController(),
  );

  @override
  Widget build(BuildContext context) {
    bookController.getClinic();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    height: 100,
                    color: mainColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          DateFormat('d/M/yyyy').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Plase fill the form with the folwoing information to Book an appointment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GetBuilder<BookAppointmentController>(
                          builder: (bookController) => (CustomDropDownField(
                            label: 'Clinic',
                            height: 50,
                            list: bookController.clinics,
                            onChange: (clinic) {
                              bookController.changeClinic(clinic);
                              bookController.getDoctors(clinic.id);
                            },
                          )),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "you can chose the auto select option to book the nearlest appointment",
                          style: TextStyle(
                            // fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: secondaryTextColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        GetBuilder<BookAppointmentController>(
                          builder: (bookController) => GestureDetector(
                            onTap: () {
                              if (bookController.clinic == null) {
                                customAlert('Choose your clinic first');
                                return;
                              }
                            },
                            child: CustomDropDownField(
                              label: 'Doctor',
                              height: 50,
                              list: bookController.doctors,
                              onChange: (doctor) {
                                bookController.changeDoctor(doctor);
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GetBuilder<BookAppointmentController>(
                                builder: (bookController) => (SizedBox(
                                  width: 200,
                                  child: DatePicker(
                                    libel: 'Date',
                                    hint: bookController.date,
                                    fun: (date) {
                                      date == null
                                          ? null
                                          : bookController.changeDate(date);
                                    },
                                  ),
                                )),
                              ),
                              // FunctionalButton(
                              //   text: 'auto select',
                              //   textSize: 20,
                              //   onTap: () {
                              //     bookController.autoSelect();
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: CustomTextField(
                                  libel: 'user Id',
                                  hint: bookController.userName,
                                  hight: 50,
                                  maxLine: 1,
                                  validator: () {},
                                  onTap: (userName) {
                                    bookController.changeUserName(userName);
                                  },
                                ),
                              ),
                              // FunctionalButton(
                              //   text: 'new patient',
                              //   textSize: 20,
                              //   onTap: () {
                              //     Get.to(AddNewPatient());
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        NamedDivider(name: 'Appointment'),
                        SizedBox(height: 20),
                        GetBuilder<BookAppointmentController>(
                          builder: (bookAppointmentController) =>
                              ((bookController.clinic == null ||
                                      bookController.doctor == null ||
                                      bookController.date == null)
                                  ? SizedBox()
                                  : Container(
                                      child: AppointmentBox(
                                        clinicName:
                                            bookController.clinic!.option,
                                        doctorName:
                                            bookController.doctor!.option,
                                        date: bookController.date!,
                                        day: bookController.day!,
                                      ),
                                    )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FlowButton(
              text: 'Book',
              pBottom: 20,
              pRight: 20,
              onTap: () {
                bookController.test();
                bookController.bookAppointment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
