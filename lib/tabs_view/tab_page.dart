import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/tabs_view/tab_controller.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({Key? key}) : super(key: key);

  final controller = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller.tabController,
          tabs: const <Widget>[
            Tab(child: Icon(Icons.ac_unit)),
            Tab(child: Icon(Icons.account_balance)),
            Tab(child: Icon(Icons.admin_panel_settings_outlined)),
          ],
        ),
      ),
      body: SizedBox(
          child: TabBarView(
        controller: controller.tabController,
        children: const <Widget>[Page1(), Page2(), Page3()],
      )),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("PANTALLA 1"),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Expanded(child: Text("Titulo")),
              Expanded(flex: 3, child: TextFormField()),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Expanded(child: Text("Titulo")),
              Expanded(flex: 3, child: TextFormField()),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Expanded(child: Text("Titulo")),
              Expanded(flex: 3, child: TextFormField()),
            ],
          ),
        ],
      )),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("PANTALLA 2"));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("PANTALLA 3"));
  }
}
