import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/form_view/form_controller.dart';

class FormPage extends StatelessWidget {
  final controller = Get.put(FormController());
  static const espacio = SizedBox(height: 30);
  FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            espacio,
            const Text("FORMULARIO"),
            espacio,
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                        onSaved: (String? value) =>
                            controller.setVacunado(value!)),
                    espacio,
                    TextFormField(
                      onSaved: (String? value) =>
                          controller.setNoVacunado(value!),
                    ),
                    espacio,
                    TextFormField(
                      onSaved: (String? value) =>
                          controller.setVacunado(value!),
                    ),
                    espacio,
                    TextFormField(
                      onSaved: (String? value) =>
                          controller.setNoVacunado(value!),
                    ),
                  ],
                )),
            espacio,
            ElevatedButton(
              onPressed: () => controller.onPressed(),
              child: const Text("TAP!"),
            )
          ],
        ),
      ),
    );
  }
}
