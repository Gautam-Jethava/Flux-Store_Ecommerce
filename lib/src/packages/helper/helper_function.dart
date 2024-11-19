import 'package:flutter/material.dart';

abstract interface class HelperFunction {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
