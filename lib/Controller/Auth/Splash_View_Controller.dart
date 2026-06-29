import 'package:get/get.dart';

class SplashViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2, microseconds: 500), () {
      Get.offNamed(
        '/Reception',
      );
    });
  }
}
