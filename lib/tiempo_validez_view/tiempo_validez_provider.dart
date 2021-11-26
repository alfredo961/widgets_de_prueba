import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class TiempoValidezProvider extends ChangeNotifier {}

class TiempoValidezController extends GetxController {
  RxString hora = "kk".obs;
  RxString minutos = "mm".obs;
  List<String> horasList = List<String>.generate(23, (i) => "$i");
  List<String> minutosList = List<String>.generate(59, (i) => "$i");
  RxString horaValue = "0".obs;
  RxString minutoValue = "0".obs;

  void changeHourText(String value) {
    hora.value = value;
    updateList(hora.value);
  }

  void changeMinuteText(String value) {
    minutos.value = value;
  }

  void selectHourValue(value) {
    horaValue.value = value;
  }

  void selectMinuteValue(value) {
    minutoValue.value = value;
  }

  updateList(String hora) {
    if (hora.isEmpty) hora = "0";
    int b = (17 - int.parse(hora));
    List<String> tempList = List<String>.generate(b, (i) => "$i");
    horasList.clear();
    horasList = tempList;
  }
}
