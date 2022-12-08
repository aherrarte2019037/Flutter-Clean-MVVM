import 'package:flutter/material.dart';
import 'package:flutter_clean_mvvm/resources/fonts.gen.dart';

class AppThemeData {
  AppThemeData._();
  
  static ThemeData lighTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: FontFamily.montserrat,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: FontFamily.montserrat,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
  );
}