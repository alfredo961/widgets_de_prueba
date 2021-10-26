import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  RxString latitud = "".obs;
  RxString longitud = "".obs;

  final initialCameraPosition =
      const CameraPosition(target: LatLng(-1.831239, -78.183406), zoom: 10);

  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTapped => _markersController.stream;

  void onTap(LatLng position) {
    latitud.value = position.latitude.toString();
    longitud.value = position.longitude.toString();

    //final markerId = MarkerId(_markers.length.toString());
    final markerId = MarkerId(1.toString());
    final marker = Marker(
        markerId: markerId,
        position: position,
        draggable: true,
        onDragEnd: (newPosition) {
          latitud.value = newPosition.latitude.toString();
          longitud.value = newPosition.longitude.toString();
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {
          _markersController.sink.add(1.toString());
        },
        infoWindow: const InfoWindow(title: ""));

    _markers[markerId] = marker;
    update(["mapa"]);
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}
