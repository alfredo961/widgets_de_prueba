import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as scket;

class Sockets {
  final socket =
      scket.io('http://f9c4-190-86-109-255.ngrok.io/', <String, dynamic>{
    'transports': ['websocket'],
  });

  // final socket = WebSocketChannel.connect(
  //   Uri.parse('wss://echo.websocket.org'),
  // );

  bool isConnected = false;

  Sockets() {
    socket.connect();
    socket.onConnect((_) {
      isConnected = true;
      debugPrint("Conectado!");
      emitSocket();
    });

    socket.on("Notificación", (message) {
      debugPrint(message);
    });
  }

  emitSocket() {
    if (isConnected) {
      readLine().listen((String line) => socket.emit("stream", line));
      socket.on("msg", (data) {
        _printFromServer(data);
        debugPrint(data);
      });
    }
  }
}

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

// ignore: avoid_print
void _printFromServer(String message) => print(message);
