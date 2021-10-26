import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String? value;
  final Function(String?)? onChanged;
  final List<String?>? items;

  const DropdownWidget(
      {Key? key,
      @required this.value,
      @required this.items,
      @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return DropdownButton<String>(
    //   isExpanded: true,
    //   value: value,
    //   onChanged: onChanged,
    //   items: items.map<DropdownMenuItem<String>>((String item) {
    //     return DropdownMenuItem<String>(key: ValueKey(item), value: item, child: Text(item));
    //   }).toList(),
    // );
    return DropdownButton<String>(
      isExpanded: true,
      value: value,
      onChanged: onChanged,
      items: items!.map<DropdownMenuItem<String>>((String? item) {
        return DropdownMenuItem<String>(
            value: item, child: Text(item!.replaceAll(RegExp(r'[0-9]'), '')));
      }).toList(),
    );
  }
}
