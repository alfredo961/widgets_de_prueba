
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/stepper_views/stepper_controller.dart';

class StepperPage extends StatelessWidget {

  final controller = Get.put(StepperController());

  @override
  Widget build(BuildContext context) {

    final List<Step> steps = [
      Step(
          title: Text("Paso 1"),
          content: Container(
              height: Get.height / 1.5,
              child: Center(child: Text("Complete el formulario uno "))
          )),
      Step(
          title: Text("Paso 2"),
          content: Container(
              height: Get.height / 1.5,
              child: Center(child: Text("Complete el formulario dos "))
          )),
      Step(
          title: Text("Paso 3"),
          content: Container(
              height: Get.height / 1.5,
              child: Center(child: Text("Complete el formulario tres "))
          )),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Obx(
          (){
            print(controller.complete.value);
            return !controller.complete.value
                ? Stepper(
              currentStep: controller.currentStep.value ,
              type: StepperType.horizontal,
              steps: steps,
              onStepCancel: ()=> controller.stepCancel(),
              onStepTapped: (step)=> controller.stepSelected(step),
              onStepContinue: () => controller.stepContinue(steps.length),
            )
                : Center(
                  child: AlertDialog(
                    title: Text("Titulo"),
                    content: Text("SE HAN COMPLETADO LOS PASOS"),
                    actions: [
                      ElevatedButton(onPressed: (){
                        Get.offNamed("/");
                      },
                          child: Text("Regresar"))
                    ],
            )
              );
          }
        ),
      ),
    );
  }
}
