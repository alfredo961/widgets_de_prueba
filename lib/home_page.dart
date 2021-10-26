import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/home_controller.dart';

class HomePage extends StatelessWidget {
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
                    icon: Icon(Icons.list_alt_outlined),
                    label: Text("TabBar"),
                    onPressed: () => controller.passToTabs()),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn2",
                    label: Text("Stepper"),
                    icon: Icon(Icons.featured_play_list_outlined),
                    onPressed: () => controller.passToStepper()),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn3",
                    label: Text("Form"),
                    icon: Icon(Icons.find_in_page_outlined),
                    onPressed: () => controller.passToForm()),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn4",
                    label: Text("Mapa"),
                    icon: Icon(Icons.map_outlined),
                    onPressed: () => controller.passToMapView()),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn5",
                    label: Text("Dropdown"),
                    icon: Icon(Icons.menu_open_outlined),
                    onPressed: () => controller.passToDropdownView()),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: FloatingActionButton.extended(
                    heroTag: "btn6",
                    label: Text("Bounce Animation"),
                    icon: Icon(Icons.animation),
                    onPressed: () => controller.passToAnimationView()),
              ),
            ],
          )),
    );
  }
}
