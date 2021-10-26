import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/ocr_view/ocr_controller.dart';

class OCRView extends StatelessWidget {
  OCRView({Key? key}) : super(key: key);
  final controller = Get.put(OCRController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => Text(controller.scanResult!.value.isEmpty
                    ? "Escanee un documento"
                    : controller.scanResult!.value),
              ),
            ),
            Flexible(
              child: MaterialButton(
                  elevation: 2,
                  color: Colors.indigo,
                  onPressed: () => controller.scanStart(),
                  child: const Text("Escanear")),
            )
          ],
        ),
      ),
    );
  }
}
