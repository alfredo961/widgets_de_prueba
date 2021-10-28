import 'dart:developer';

import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:get/get.dart';

class OCRController extends GetxController {
  RxString? scanResult = "".obs;
  bool isInitialized = false;
  Size? _previewOcr;
  final int? _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  RegExp regExp = RegExp(r'\s+(\d{8}-\d{1})\s+', multiLine: true);

  @override
  void onInit() {
    super.onInit();
    FlutterMobileVision.start().then((previewSizes) {
      isInitialized = true;
      if (previewSizes[_cameraOcr] == null) {
        return;
      }
      _previewOcr = previewSizes[_cameraOcr]!.last;
      print(_previewOcr);
    });
  }

  scanStart() async {
    List<OcrText> list = <OcrText>[];
    Size _scanpreviewOcr = _previewOcr ?? FlutterMobileVision.PREVIEW;
    String tempText = "";

    try {
      list = await FlutterMobileVision.read(
        fps: 60.0,
        waitTap: true,
        showText: true,
        multiple: true,
        camera: _cameraOcr!,
        preview: _previewOcr ?? FlutterMobileVision.PREVIEW,
        scanArea: Size(_scanpreviewOcr.width - 20, _scanpreviewOcr.height - 20),
        //scanArea: const Size(640, 480),
      );

      for (OcrText text in list) {
        tempText = text.value;
      }
      //tempText = list[0].value;
      //scanResult!.value = regExp.allMatches(tempText).toString();
      log(tempText);
      var result = regExp.allMatches(tempText).map((m) => m.group(0));
      print("=*=*=*=*=*=*=*=*=");
      print(result);
      print("=*=*=*=*=*=*=*=*=");
    } catch (e) {
      print(e);
    }
  }
}
