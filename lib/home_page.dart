import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn1",
                    icon: const Icon(Icons.list_alt_outlined),
                    label: const Text("TabBar"),
                    onPressed: () => controller.passToTabs()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    label: const Text("Stepper"),
                    icon: const Icon(Icons.featured_play_list_outlined),
                    onPressed: () => controller.passToStepper()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn3",
                    label: const Text("Form"),
                    icon: const Icon(Icons.find_in_page_outlined),
                    onPressed: () => controller.passToForm()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn4",
                    label: const Text("Mapa"),
                    icon: const Icon(Icons.map_outlined),
                    onPressed: () => controller.passToMapView()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn5",
                    label: const Text("Dropdown"),
                    icon: const Icon(Icons.menu_open_outlined),
                    onPressed: () => controller.passToDropdownView()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn6",
                    label: const Text("Bounce Animation"),
                    icon: const Icon(Icons.animation),
                    onPressed: () => controller.passToAnimationView()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn7",
                    label: const Text("OCR"),
                    icon: const Icon(Icons.scanner_outlined),
                    onPressed: () => controller.passToOCRView()),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn8",
                    label: const Text("Notifications"),
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () => controller.passToNotificationView()),
              ),
            ],
          )),
    );
  }
}
