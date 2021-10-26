import 'package:get/get.dart';

class HomeController extends GetxController {
  passToTabs() {
    Get.toNamed("/tabs");
  }

  passToStepper() {
    Get.toNamed("/steps");
  }

  passToForm() {
    Get.toNamed("/form");
  }

  passToMapView() {
    Get.toNamed("/map");
  }

  passToDropdownView() {
    Get.toNamed("/dropdown");
  }

  passToAnimationView() {
    Get.toNamed("/animation");
  }
}
