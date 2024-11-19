import 'package:flutter/material.dart';
import 'package:flux_store/src/utils/text_theme.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Product Sans',
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightText);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Product Sans',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkText,
  );
}
