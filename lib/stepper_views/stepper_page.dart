import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/stepper_views/stepper_controller.dart';

class StepperPage extends StatelessWidget {
  StepperPage({Key? key}) : super(key: key);

  final controller = Get.put(StepperController());

  @override
  Widget build(BuildContext context) {
    final List<Step> steps = [
      Step(
          title: const Text("Paso 1"),
          content: SizedBox(
              height: Get.height / 1.5,
              child: const Center(child: Text("Complete el formulario uno ")))),
      Step(
          title: const Text("Paso 2"),
          content: SizedBox(
              height: Get.height / 1.5,
              child: const Center(child: Text("Complete el formulario dos ")))),
      Step(
          title: const Text("Paso 3"),
          content: SizedBox(
              height: Get.height / 1.5,
              child:
                  const Center(child: Text("Complete el formulario tres ")))),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return !controller.complete.value
            ? Stepper(
                currentStep: controller.currentStep.value,
                type: StepperType.horizontal,
                steps: steps,
                onStepCancel: () => controller.stepCancel(),
                onStepTapped: (step) => controller.stepSelected(step),
                onStepContinue: () => controller.stepContinue(steps.length),
              )
            : Center(
                child: AlertDialog(
                title: const Text("Titulo"),
                content: const Text("SE HAN COMPLETADO LOS PASOS"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Get.offNamed("/");
                      },
                      child: const Text("Regresar"))
                ],
              ));
      }),
    );
  }
}
