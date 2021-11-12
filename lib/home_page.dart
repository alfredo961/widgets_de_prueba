import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/home_controller.dart';
import 'package:tabbar/socket_view/socket_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  final espacio = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final socketService = context.watch<SocketProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.online)
                ? Icon(
                    Icons.check_circle,
                    color: Colors.blue[300],
                  )
                : const Icon(
                    Icons.offline_bolt,
                    color: Colors.red,
                  ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn1",
                icon: const Icon(Icons.list_alt_outlined),
                label: const Text("TabBar"),
                onPressed: () => controller.passToTabs()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn2",
                label: const Text("Stepper"),
                icon: const Icon(Icons.featured_play_list_outlined),
                onPressed: () => controller.passToStepper()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn3",
                label: const Text("Form"),
                icon: const Icon(Icons.find_in_page_outlined),
                onPressed: () => controller.passToForm()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn4",
                label: const Text("Mapa"),
                icon: const Icon(Icons.map_outlined),
                onPressed: () => controller.passToMapView()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn5",
                label: const Text("Dropdown"),
                icon: const Icon(Icons.menu_open_outlined),
                onPressed: () => controller.passToDropdownView()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn6",
                label: const Text("Bounce Animation"),
                icon: const Icon(Icons.animation),
                onPressed: () => controller.passToAnimationView()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn7",
                label: const Text("OCR"),
                icon: const Icon(Icons.scanner_outlined),
                onPressed: () => controller.passToOCRView()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn8",
                label: const Text("Notifications"),
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () => controller.passToNotificationView()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn9",
                label: const Text("Device Information"),
                icon: const Icon(Icons.perm_device_info),
                onPressed: () => controller.passToDeviceInfoView()),
            espacio,
            FloatingActionButton.extended(
                heroTag: "btn10",
                label: const Text("Socket"),
                icon: const Icon(
                    Icons.signal_wifi_connected_no_internet_4_outlined),
                onPressed: () => controller.passToSocketView()),
            espacio,
          ],
        ),
      ),
    );
  }
}
