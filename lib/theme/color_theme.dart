import 'package:flutter/material.dart';

class ColorTheme {
  ColorTheme._();

  static const MaterialColor orange = MaterialColor(
    _primaryOrange,
    {
      100: Color(0xfff7e2c7),
      200: Color(0xfff5cfaa),
      300: Color(0xfff0ba8b),
      400: Color(0xffefa26e),
      500: Color(_primaryOrange),
      600: Color(0xffec8751),
      700: Color(0xffeb6937),
      800: Color(0xffe7491a),
      900: Color(0xffcd3c11),
    },
  );
  static const MaterialColor blackWhite = MaterialColor(
    _primaryBlackWhite,
    {
      100: Color(0xffffffff),
      200: Color(0xffdedede),
      300: Color(0xffbfbfbf),
      400: Color(0xffa5a5a5),
      500: Color(_primaryBlackWhite),
      600: Color(0xff4f5053),
      700: Color(0xff333333),
      800: Color(0xff111111),
      900: Color(0xff000000),
    },
  );

  static const int _primaryOrange = 0xFFED9728;
  static const int _primaryBlackWhite = 0xff737477;
}
