import 'package:al_hadara/Hamed/Function/Shered/update_center_info_fun.dart';
import 'package:al_hadara/Hamed/model/centerModel/cente_model.dart';
import 'package:get/get.dart';

class UpdateCenterInfoController extends GetxController {
  String name;
  String location;
  String startDay;
  String endDay;
  String startTime;
  String endTime;

  UpdateCenterInfoController({required CenterModel centerModel})
      : name = centerModel.name,
        location = centerModel.location,
        startDay = centerModel.startDay,
        endDay = centerModel.endDay,
        startTime = centerModel.startTime,
        endTime = centerModel.endTime;
  changeName(String name) {
    this.name = name;
  }

  changeLocation(String location) {
    this.location = location;
    update();
  }

  changeStartDay(String startDay) {
    this.startDay = startDay;
    update();
  }

  changeEndtDay(String endDay) {
    this.endDay = endDay;
    update();
  }

  changeStartTime(String startTime) {
    this.startTime = startTime;
    update();
  }

  changeEndTime(String endTime) {
    this.endTime = endTime;
    update();
  }

  Future<int> updateCenterInfo() async {
    int success = await updateCenter(
      name: name,
      location: location,
      startDay: startDay,
      endDay: endDay,
      startTime: startTime,
      endTime: endTime,
    );
    return success;
  }

  test() {
    print(name);
    print(location);
    print(startDay);
    print(endDay);
    print(startTime);
    print(endTime);
  }
}
