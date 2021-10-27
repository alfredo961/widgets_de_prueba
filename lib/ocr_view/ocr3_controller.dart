import 'dart:io';

import 'package:get/get.dart';

class OCR3Controller extends GetxController {
  RxBool scanning = false.obs;
  RxString extractText = "".obs;
  File? pickedImage;
}
