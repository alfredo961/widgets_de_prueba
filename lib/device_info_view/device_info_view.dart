import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/device_info_view/device_info_provider.dart';
import 'package:tabbar/utils/extensions/extensions.dart';

class DeviceInfoView extends StatelessWidget {
  const DeviceInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeviceInfoProvider controller = Provider.of(context, listen: false);
    final device = context.watch<DeviceInfoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Information'),
      ),
      body: SizedBox(
        height: context.height,
        width: double.infinity,
        child: ListView(
          children: controller.deviceData.keys.map((String property) {
            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    property,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: Consumer<DeviceInfoProvider>(
                          builder: (_, state, __) => Text(
                                //'${state.deviceData[property]}',
                                //"${controller.deviceData[property]}",
                                "${device.deviceData[property]}",
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              ))),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
