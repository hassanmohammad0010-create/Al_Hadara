import 'package:al_hadara/Hamed/Function/Shered/add_services_to.dart';
import 'package:al_hadara/Hamed/Function/Shered/clinic/add_service.dart';
import 'package:get/get.dart';

class AddServiceController extends GetxController {
  String? serviceName;
  String? description;
  String? type;
  int? targetId;

  init(String type, int targetId) {
    this.targetId = targetId;
    this.type = type;
  }

  changeName(serviceName) {
    this.serviceName = serviceName;
    update();
  }

  changeDescription(description) {
    this.description = description;
    update();
  }

  bool check() {
    if (serviceName != null &&
        description != null &&
        targetId != null &&
        type != null) {
      return true;
    }
    return false;
  }

  Future<int> add() async {
    int id = await addService(
      clinicId: 28,
      name: serviceName!,
      description: description!,
    );
    int done = await addServicesTo(
      serviceIds: [id],
      targetId: targetId!,
      type: type!,
    );
    return done;
  }

  clear() {
    serviceName = null;
    description = null;
  }
}
