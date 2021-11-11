import 'package:flutter/material.dart';

extension _RoutesExtension on BuildContext {
  void pushNamed(String name) {
    Navigator.of(this).pushNamed(name);
  }

  void backToPage() {
    Navigator.of(this).pop();
  }
}
