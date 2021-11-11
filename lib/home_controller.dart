import 'package:get/get.dart';

class HomeController extends GetxController {
  Future? passToTabs() {
    return Get.toNamed("/tabs");
  }

  Future? passToStepper() {
    return Get.toNamed("/steps");
  }

  Future? passToForm() {
    return Get.toNamed("/form");
  }

  Future? passToMapView() {
    return Get.toNamed("/map");
  }

  Future? passToDropdownView() {
    return Get.toNamed("/dropdown");
  }

  Future? passToAnimationView() {
    return Get.toNamed("/animation");
  }

  Future? passToOCRView() {
    return Get.toNamed("/ocr");
  }

  Future? passToNotificationView() {
    return Get.toNamed("/notificacion");
  }

  Future? passToDeviceInfoView() {
    return Get.toNamed("/deviceInfo");
  }
}
