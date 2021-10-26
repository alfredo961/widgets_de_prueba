
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController{

  final formKey = GlobalKey<FormState>();
  RxString vacunado = '0'.obs;
  RxString noVacunado = '0'.obs;
  List lista = [];
  List lista2 = [];
  List itemsLista=[];

  setVacunado(String value){
   vacunado.value = value;
   lista.add(vacunado.value);
  }

  setNoVacunado(String value){
    noVacunado.value = value;
    lista2.add(noVacunado.value);
  }

  addToList(){
    itemsLista.addAll([lista, lista2]);
  }

  onPressed(){
    print("Form Validation : " + formKey.currentState.validate().toString());
    formKey.currentState.save();
    addToList();
    List a=[];
    itemsLista.forEach((element) {a.add(element);});
    print(a);

    
  }

}


/*
setValue(String value){
    numero.value=value;
    lista.add(CatastroBovino(
      animal: "Terneras",
      vacunado: int.parse(numero.value),
      noVacunado: int.parse(numero2.value)
    ));
    lista2.add(CatastroBovino(
        animal: "Vacas",
        vacunado: int.parse(numero.value),
        noVacunado: int.parse(numero2.value)
    ));
    lista.map((e) => {
      "animal": e.animal,
      "vacunado": e.vacunado,
      "noVacunado": e.noVacunado
    }).toList();

    print(lista);
  }
*/