import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/notificaciones_view/api/notification_api.dart';
import 'package:tabbar/notificaciones_view/notificaciones_provider.dart';
import 'package:tabbar/notificaciones_view/widgets/second_page.dart';
import 'package:tabbar/socket_view/socket_provider.dart';

class NotificacionesView extends StatefulWidget {
  const NotificacionesView({Key? key}) : super(key: key);

  @override
  _NotificacionesViewState createState() => _NotificacionesViewState();
}

class _NotificacionesViewState extends State<NotificacionesView> {
  @override
  initState() {
    super.initState();

    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecondPage(payload: payload),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final NotificacionesProvider controller =
        Provider.of(context, listen: false);

    final socketService = context.watch<SocketProvider>();

    Widget space = const SizedBox(height: 24);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 300),
            space,
            _buidButton(
                label: "Simple notification",
                icon: Icons.notifications,
                onPressed: () {
                  NotificationApi.showNotification(
                      title: socketService.nombre,
                      body: socketService.asunto,
                      payload: socketService.id.toString());
                }),
            space,
            _buidButton(
                label: "Scheduled notification",
                icon: Icons.notifications_active,
                onPressed: () => controller.schduledNotificationPressed()),
            space,
            _buidButton(
                label: "Remove notification",
                icon: Icons.remove,
                onPressed: () => controller.removeNotificationPressed()),
          ],
        ),
      ),
    );
  }

  Widget _buidButton(
      {required String? label,
      required IconData? icon,
      required Function()? onPressed}) {
    return ElevatedButton.icon(
        onPressed: onPressed, icon: Icon(icon), label: Text(label!));
  }
}
