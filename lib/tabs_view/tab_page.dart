
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar/tabs_view/tab_controller.dart';

class TabBarPage extends StatelessWidget {

  final controller = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller.tabController,
          tabs: <Widget>[
            Tab(child: Icon(Icons.ac_unit)),
            Tab(child: Icon(Icons.account_balance)),
            Tab(child: Icon(Icons.admin_panel_settings_outlined)),
          ],
        ),
      ),
      body: Container(
          child: TabBarView(
            controller: controller.tabController,
            children: <Widget>[
              Page1(),
              Page2(),
              Page3()

            ],
          )
      ),
    );
  }
}

class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("PANTALLA 1"),
              SizedBox(height: 50,),
              Row(
                children: [
                  Expanded(flex:1,child:Text("Titulo")),
                  Expanded(flex:3,child: TextFormField()),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(flex:1,child:Text("Titulo")),
                  Expanded(flex:3,child: TextFormField()),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(flex:1,child:Text("Titulo")),
                  Expanded(flex:3,child: TextFormField()),
                ],
              ),
            ],
          )
      ),
    );
  }
}

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text("PANTALLA 2")
      ),
    );
  }
}

class Page3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text("PANTALLA 3")
      ),
    );
  }
}