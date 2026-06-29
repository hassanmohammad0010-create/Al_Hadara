import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Model/Lab_Model.dart';
import 'package:al_hadara/Service/App/Get_Lab_Information_Service.dart';
import 'package:get/get.dart';

class GetLabController extends GetxController {
  LabModel? labModel;
  @override
  void onInit() async {
    dynamic response = await GetLabInformationService().getLabInformation();
    if (response != fail) {
      labModel = response;
    }
    update();
    // TODO: implement onInit
    super.onInit();
  }

  set() async {
    dynamic response = await GetLabInformationService().getLabInformation();
    if (response != fail) {
      labModel = response;
    }
    update();
  }

  get() async {
    dynamic response = await GetLabInformationService().getLabInformation();
    if (response != fail) {
      labModel = response;
    }
    update();
    return labModel;
  }
}
