import 'package:get/get.dart';

class LoadingIndcatorController extends GetxController {
  bool load = false;
  isLoading() {
    load = true;
    update();
  }

  isntLoading() {
    load = false;
    update();
  }
}
