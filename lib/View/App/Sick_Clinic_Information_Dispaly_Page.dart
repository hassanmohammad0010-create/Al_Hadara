import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Controller/app/Get_Clinic_Doctors_Information_Service.dart';
import 'package:al_hadara/View/App/Sick_Doctor_Information_Display_Page.dart';
import 'package:al_hadara/Widget/App/Custom_Back_Contaner.dart';
import 'package:al_hadara/Model/CLinic_Model.dart';
import 'package:al_hadara/Widget/App/Custom_Doctor_Container.dart';
import 'package:al_hadara/Widget/App/Custom_Row.dart';
import 'package:al_hadara/Widget/Shared_Widget/Custom_Lodaing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SickClinicInformationDisplayPage extends StatelessWidget {
  SickClinicInformationDisplayPage({super.key, this.clinicModel});
  ClinicModel? clinicModel;
  String pageName = "SickClinicInformationDisplay";

  GetClinicDoctorController doctorController =
      Get.put(GetClinicDoctorController());

  @override
  Widget build(BuildContext context) {
    doctorController.set(id: clinicModel!.id);
    return Scaffold(
        body: GetBuilder<GetClinicDoctorController>(builder: (controller) {
      return doctorController.doctorsModel == null
          ? CustomLoading(load: true)
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    color: constColor,
                    alignment: Alignment.topLeft,
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: CustomBackContainer()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '${clinicModel!.name} ',
                          style: const TextStyle(
                              fontSize: 36,
                              fontFamily: abhayaLibre,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomRow(
                          icons: Icons.table_chart_sharp,
                          text: clinicModel!.clinicType,
                        ),
                        CustomRow(
                          icons: Icons.schedule_sharp,
                          text:
                              "From ${clinicModel!.startTime.substring(0, 5)} to ${clinicModel!.endTime.substring(0, 5)} ",
                        ),
                        CustomRow(
                          icons: Icons.calendar_month_sharp,
                          text:
                              "From ${clinicModel!.startDay} to ${clinicModel!.endDay}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 32,
                    indent: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Services".tr,
                              style: const TextStyle(
                                fontSize: 28,
                                color: constColor,
                                fontFamily: gabriela,
                              ),
                            ),
                            const SizedBox(
                              width: 180,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: constColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            itemCount: clinicModel!.services!.length,
                            itemBuilder: (context, index) {
                              return Text(clinicModel!.services![index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: gabriela,
                                  ));
                            },
                          ),
                        )
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
                    child: Text(
                      "Doctor".tr,
                      style: const TextStyle(
                          fontSize: 36,
                          fontFamily: abhayaLibre,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    itemCount: doctorController.doctorsModel!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomDoctorContainer(
                          doctorName:
                              doctorController.doctorsModel![index].name,
                          specialty:
                              doctorController.doctorsModel![index].specialty,
                          onTap: () {
                            Get.to(() => SickDoctorInformationDisplayPage(
                                  clinicname: clinicModel!.name,
                                  doctorModel:
                                      doctorController.doctorsModel![index],
                                ));
                          });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            );
    }));
  }
}
