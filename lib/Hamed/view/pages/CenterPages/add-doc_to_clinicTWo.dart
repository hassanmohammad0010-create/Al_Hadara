import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/Controller/centerController/add_doctor_to_clicnc_controller.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/add_doc_to_clinic.dart';
import 'package:al_hadara/Hamed/view/Widget/Center/Center_Home_Page_Doctor_Show_Box.dart';
import 'package:al_hadara/Hamed/view/pages/CenterPages/add_service_to_clinic_lab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDoctorToClinicPageTwo extends StatelessWidget {
  AddDoctorToClinicPageTwo({super.key, required this.clinicId});
  final int clinicId;
  final AddDoctorToClinicController addDoctorToClinicController =
      Get.put(AddDoctorToClinicController());
  @override
  Widget build(BuildContext context) {
    addDoctorToClinicController.getDoctor();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              // CustomTextField(
              //   libel: "search",
              //   maxLine: 1,
              //   onTap: (docName) {},
              //   validator: () {},
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add doctors',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => AddServiceToClinicLab(targetId: 37, type: clinic),
                      );
                      print('object');
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            'skip',
                            style: TextStyle(
                              color: const Color.fromRGBO(37, 137, 153, 1),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: mainColor,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              GetBuilder<AddDoctorToClinicController>(
                builder: (addDoctorToClinicController) => Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...addDoctorToClinicController.doctors.map(
                          (docModel) => DoctorShowBox(
                            name: docModel.name,
                            specialty: docModel.specialty,
                            id: docModel.id,
                            add: true,
                            futureFun: () async {
                              return addDoctorToClinic(docModel.id, clinicId);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
