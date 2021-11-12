import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/socket_view/socket_provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = context.watch<SocketProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ServerStatus: ${socketService.serverStatus}"),
            Text("Nombre: ${socketService.nombre}"),
            Text("Asunto: ${socketService.asunto}"),
            Text("id: ${socketService.id}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          //emite al socket
          socketService.emit('emitir-mensaje',
              {"nombre": "flutter", "mensaje": "hola desde flutter"});
        },
      ),
    );
  }
}
