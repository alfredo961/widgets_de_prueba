import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/dropdown_view/dropdown_controller.dart';
import 'package:tabbar/dropdown_view/dropdown_widget.dart';

class DropdownPage extends StatelessWidget {
  DropdownPage({Key? key}) : super(key: key);
  final DropdownController controller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            GetX<DropdownController>(
                builder: (_) => DropdownWidget(
                      value: controller.fruitSelected.value,
                      items: controller.fruits,
                      onChanged: (newValue) {
                        controller.selectFruit(newValue!);
                      },
                    )),
            GetX<DropdownController>(
                builder: (_) => DropdownWidget(
                      value: controller.carroSelected.value,
                      items: controller.carrosList,
                      onChanged: (newValue) {
                        controller.selectCarro(newValue!);
                      },
                    )),
          ],
        ));
  }
}
