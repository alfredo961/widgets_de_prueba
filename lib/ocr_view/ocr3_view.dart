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
            controller.pickedImage == null
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
                  )
          ],
        ),
      ),
    );
  }
}
