import 'package:al_hadara/Hamed/Function/Shered/get_center_info.dart';
import 'package:al_hadara/Hamed/model/centerModel/cente_model.dart';
import 'package:get/get.dart';

class CenterInfoController extends GetxController {
  CenterModel? centerModel;

  getCenterInfo() async {
    centerModel = await getCenter();
    update();
  }
}
