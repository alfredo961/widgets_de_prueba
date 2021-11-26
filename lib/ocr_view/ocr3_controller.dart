import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OCR3Controller extends GetxController {
  RxBool scanning = false.obs;
  RxString extractText = "".obs;
  File? pickedImage;
  final ImagePicker? _picker = ImagePicker();
  XFile? image;

  void obtenerImagen() async {
    scanning.value = true;
    image = (await _picker!.pickImage(source: ImageSource.gallery));
    pickedImage = File(image!.path);

    // extractText.value =
    //     await FlutterTesseractOcr.extractText(image!.path, language: "spa");
    scanning.value = false;
    update(["imagen"]);
  }
}
