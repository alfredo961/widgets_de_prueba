import 'dart:developer';
import 'package:flutter/material.dart' show ChangeNotifier, debugPrint;
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, offline, connecting }

class SocketProvider extends ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  IO.Socket? _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket!;
  Function get emit => _socket!.emit;

  String? _nombre;
  String? _asunto;
  int? _id;

  String? get nombre => _nombre ?? "";
  String? get asunto => _asunto ?? "";
  int? get id => _id = 0;

  SocketProvider() {
    initState();
  }

  void initState() {
    log("/socket page initialized");
    initSocket();
  }

  void initSocket() {
    _socket = IO.io('http://10.0.2.2:3000/', {
      "transports": ["websocket"],
      "autoConnect": true
    });

    _socket!.on('connect', (_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket!.on('disconnect', (_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    socket.on('nuevo-mensaje', (payload) {
      debugPrint("nuevo-mensaje:");
      debugPrint("nombre:" + payload["nombre"]);
      debugPrint("nombre:" + payload["mensaje"]);
      payload.containsKey('mensaje2') ? payload["mensaje2"] : "No hay mensaje";
    });

    socket.on('nueva-notification', (payload) {
      // debugPrint("nueva-notification:");
      // debugPrint("nombre:" + payload["nombre"]);
      // debugPrint("asunto:" + payload["asunto"]);

      _nombre =
          payload.containsKey('nombre') ? payload["nombre"] : "No hay nombre";
      _asunto =
          payload.containsKey('asunto') ? payload["asunto"] : "Sin asunto";
      _id = payload.containsKey('id') ? payload["id"] : 0;

      debugPrint(nombre);
      debugPrint(asunto);
      debugPrint(id.toString());
    });
  }
}
