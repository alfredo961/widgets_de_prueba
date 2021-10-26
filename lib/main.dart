import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/animation_view/animation_page.dart';
import 'package:tabbar/dropdown_view/dropdown_page.dart';
import 'package:tabbar/form_view/form_page.dart';
import 'package:tabbar/home_page.dart';
import 'package:tabbar/map_view/map_view.dart';
import 'package:tabbar/stepper_views/stepper_page.dart';
import 'package:tabbar/tabs_view/tab_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        GetPage(name: '/map', page: () => MapWidgetView()),
        GetPage(name: '/dropdown', page: () => DropdownPage()),
        GetPage(name: '/animation', page: () => AnimationPage()),
      ],
    );
  }
}
