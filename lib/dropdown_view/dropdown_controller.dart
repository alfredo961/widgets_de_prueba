import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  @override
  onInit() {
    super.onInit();
    convertToListString();
    carroSelected.replaceAll(RegExp('[a-zA-Z]'), '');
  }

  //===========DROPDOWN FRUTAS=========================
  RxString fruitSelected = "Apple".obs;
  List<String> fruits = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'Watermelon',
    'Pineapple'
  ];

  selectFruit(String newValue) {
    fruitSelected.value = newValue;
  }

  //===========DROPDOWN CARROS=========================
  RxString carroSelected = "101Audi".obs;
  List<Carros> carros = [
    Carros(idCarro: 101, nombre: 'Audi'),
    Carros(idCarro: 112, nombre: 'BMW'),
    Carros(idCarro: 123, nombre: 'Ford'),
    Carros(idCarro: 134, nombre: 'Aston Martin'),
    Carros(idCarro: 145, nombre: 'Bentley'),
    Carros(idCarro: 155, nombre: 'Mercedes Benz')
  ];
  List<String> carrosList = [];
  RxString idCarro = '101'.obs;
  RxString nombreCarro = '0'.obs;
  RxString auto = 'Audi'.obs;

  void convertToListString() {
    List<String> newCarrosList = [];

    carros.map((e) {
      auto.value = "${e.idCarro}${e.nombre}";
      newCarrosList.add(auto.value);
      return auto;
    }).toList();

    carrosList = newCarrosList;
  }

  selectCarro(String newValue) {
    carroSelected.value = newValue;
  }
}

class Carros {
  int? idCarro;
  String? nombre;

  Carros({@required this.idCarro, @required this.nombre});

  Map toJson() => {
        'id': idCarro,
        'nombre': nombre,
      };
}
