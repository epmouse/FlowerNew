import 'package:flutter/material.dart';
class Utils {
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
