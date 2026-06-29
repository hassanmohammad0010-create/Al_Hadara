import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/doctorHomeController/doctor_home_controller.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/clinicBox.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/doctor_appointments.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/functionalButton.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/namedDivider.dart';
import 'package:al_hadara/Hamed/view/pages/SharedPage/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorHomePage extends StatelessWidget {
  DoctorHomePage({super.key});
  final DoctorHomeController doctorHomeController = Get.put(
    DoctorHomeController(),
  );

  @override
  Widget build(BuildContext context) {
    doctorHomeController.getAppointment();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d/M/yyyy').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Builder(
                            builder: (context) => IconButton(
                              onPressed: () {
                                Get.to(SettingPage());
                              },
                              icon: Icon(
                                Icons.settings,
                                color: mainColor,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1),
                  ],
                ),
              ),
              Text(
                'those are the clinic where you work in,you can see your whole appointment to the next ten days from setting',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(132, 0, 0, 0),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.maxFinite,
                child: Wrap(
                  spacing: 15,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    doctorHomeController.clinics.length,
                    (index) =>
                        (ClinicBox(clinicName: 'Dental', onLongPress: () {})),
                  ),
                ),
              ),
              NamedDivider(name: "Appointments"),
              Text(
                'those are your appointment for today, you can see your whole appointment to the next ten days from setting',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(132, 0, 0, 0),
                ),
              ),
              SizedBox(height: 15),
              GetBuilder<DoctorHomeController>(
                builder: (doctorHomeController) => Column(
                  children: List.generate(
                    doctorHomeController.appointments.length,
                    (index) => (DoctorAppointments(
                      clinicName:
                          doctorHomeController.appointments[index].clinicName,
                      patientName:
                          doctorHomeController.appointments[index].patientName,
                      date: doctorHomeController.appointments[index].date,
                      time: doctorHomeController.appointments[index].time,
                    )),
                  ),
                ),
              ),
              FunctionalButton(
                text: "show all",
                width: 400,
                textSize: 22,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
