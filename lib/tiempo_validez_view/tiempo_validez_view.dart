import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tabbar/tiempo_validez_view/tiempo_validez_provider.dart';

class TiempoValidezView extends StatelessWidget {
  TiempoValidezView({Key? key}) : super(key: key);

  final TiempoValidezController controller = Get.put(TiempoValidezController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiempo de validez'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RowWidget(
                text: 'Ingrese hora',
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: controller.changeHourText,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                )),
            RowWidget(
                text: 'Ingrese minutos',
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: controller.changeMinuteText,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //CustomRangeTextInputFormatter("59"),
                  ],
                )),
            RowWidget(
              text: 'Hora',
              child: HourDropdown(),
            ),
            RowWidget(
              text: 'Minutos',
              child: MinuteDropdown(),
            ),
          ],
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  final String? text;
  final Widget? child;

  RowWidget({Key? key, required this.text, required this.child})
      : super(key: key);

  final TiempoValidezController controller = Get.put(TiempoValidezController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text(text!)),
        Expanded(child: child!),
      ],
    );
  }
}

class HourDropdown extends StatelessWidget {
  final TiempoValidezController controller = Get.put(TiempoValidezController());

  HourDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton<String>(
          isExpanded: true,
          value: controller.horaValue.value,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          onChanged: controller.selectHourValue,
          items: controller.horasList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}

class MinuteDropdown extends StatelessWidget {
  final TiempoValidezController controller = Get.put(TiempoValidezController());

  MinuteDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButton<String>(
          isExpanded: true,
          value: controller.minutoValue.value,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          onChanged: controller.selectMinuteValue,
          items: controller.minutosList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
