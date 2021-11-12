import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/socket_view/socket_provider.dart';

class SocketView extends StatelessWidget {
  const SocketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SocketProvider controller = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket connection'),
      ),
      body: Container(),
    );
  }
}
