import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/ocr_view/ocr3_controller.dart';

class OCR3View extends StatelessWidget {
  OCR3View({Key? key}) : super(key: key);
  final controller = Get.put(OCR3Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: ListView(
          children: [
            GetBuilder<OCR3Controller>(
                init: OCR3Controller(),
                id: "imagen",
                builder: (_) {
                  return controller.pickedImage == null
                      ? Container(
                          height: 300,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, size: 100),
                        )
                      : Container(
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              image: DecorationImage(
                                  image: FileImage(controller.pickedImage!),
                                  fit: BoxFit.fill)),
                        );
                }),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                child: const Text("Pick Image",
                    style: TextStyle(color: Colors.white)),
                onPressed: () => controller.obtenerImagen(),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => controller.scanning.value
                ? const Center(child: CircularProgressIndicator())
                : const Icon(Icons.done, size: 40, color: Colors.green)),
            const SizedBox(height: 20),
            Center(
              child: Obx(() => Text(
                    controller.extractText.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
