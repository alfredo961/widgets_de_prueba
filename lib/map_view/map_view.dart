import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tabbar/map_view/map_controller.dart';

class MapWidgetView extends StatelessWidget {
  //final controller = Get.put(MapController());

  const MapWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      init: MapController(),
      builder: (controller) {
        controller.onMarkerTapped.listen((id) {});
        return Scaffold(
          appBar: AppBar(title: const Text("Google Map")),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                    height: Get.height / 2,
                    child: GetBuilder<MapController>(
                        id: "mapa",
                        builder: (_) => GoogleMap(
                              initialCameraPosition:
                                  controller.initialCameraPosition,
                              myLocationButtonEnabled: false,
                              //esta propiedad, solo se ve en Android
                              onTap: controller.onTap,
                              markers: controller.markers,
                            ))),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text("Latitud: "),
                    Obx(() {
                      return Text(controller.latitud.value);
                    })
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text("Longitud: "),
                    Obx(() {
                      return Text(controller.longitud.value);
                    })
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
