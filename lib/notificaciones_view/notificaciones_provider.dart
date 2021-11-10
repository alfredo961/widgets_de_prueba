import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabbar/notificaciones_view/api/notification_api.dart';

class NotificacionesProvider extends ChangeNotifier {
  String? selectedNotificationPayload;
  void Function(String?)? onCLickedNotification;

  NotificacionesProvider() {
    initState();
  }

  void initState() async {
    log("/notificacion initialized");
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() {
    log("listen notification!!!!!");
    NotificationApi.onNotifications.stream.listen(onCLickedNotification);
    notifyListeners();
  }

  // void onCLickedNotification(String? payload){
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => SecondPage(payload: payload)));
  // }

  schduledNotificationPressed() {
    log("scheduled notification pressed!");
  }

  removeNotificationPressed() {
    log("remove notification pressed!");
  }
}
