import 'package:al_hadara/Model/Sick_Model.dart';
import 'package:al_hadara/Service/App/Get_My_Profile_As_Sick_Service.dart';
import 'package:get/get.dart';

class GetMyProfileAsSickController extends GetxController {
  SickModel? sickModel;

  set(SickModel data) {
    sickModel = data;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    sickModel = await GetMyProfileAsSickService().getMyProfile();
    update();
  }
}
