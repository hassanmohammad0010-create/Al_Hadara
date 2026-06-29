import 'package:al_hadara/Model/Center_Model.dart';
import 'package:al_hadara/Service/App/Get_Center_Information_Service.dart';
import 'package:get/get.dart';

class GetCenterInformationController extends GetxController {
  CenterModel? centerModel;
  @override
  void onInit() async {
    super.onInit();
    centerModel = await GetCenterInformationService().getCenterInformation();
    update();
  }
}
