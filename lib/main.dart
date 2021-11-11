import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/animation_view/animation_page.dart';
import 'package:tabbar/dropdown_view/dropdown_page.dart';
import 'package:tabbar/form_view/form_page.dart';
import 'package:tabbar/home_page.dart';
import 'package:tabbar/map_view/map_view.dart';
import 'package:tabbar/notificaciones_view/notificaciones_provider.dart';
import 'package:tabbar/notificaciones_view/notificaciones_view.dart';
import 'package:tabbar/ocr_view/ocr_view.dart';
import 'package:tabbar/stepper_views/stepper_page.dart';
import 'package:tabbar/tabs_view/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/tabs', page: () => TabBarPage()),
        GetPage(name: '/steps', page: () => StepperPage()),
        GetPage(name: '/form', page: () => FormPage()),
        GetPage(name: '/map', page: () => const MapWidgetView()),
        GetPage(name: '/dropdown', page: () => DropdownPage()),
        GetPage(name: '/animation', page: () => const AnimationPage()),
        GetPage(name: '/ocr', page: () => OCRView()),
        GetPage(
            name: '/notificacion',
            page: () => ChangeNotifierProvider<NotificacionesProvider>(
                  create: (_) => NotificacionesProvider(),
                  child: const NotificacionesView(),
                )),
      ],
    );
  }
}
