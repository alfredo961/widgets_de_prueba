export 'package:tabbar/utils/extensions/extensions.dart';

class Utils {
  Utils._();

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
