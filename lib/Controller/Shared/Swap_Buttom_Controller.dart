import 'package:get/get.dart';

class SwapButtomController extends GetxController {
  bool isToggled = false;
  double size = 30;
  double innerPadding = 0;
  @override
  void onInit() {
    super.onInit();
    innerPadding = size / 10;
  }

  click() {
    isToggled = !isToggled;
    update();
  }
}
