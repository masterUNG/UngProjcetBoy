import 'package:flutter/material.dart';

class MyConstant {
  static Color primary = const Color(0xff8e1ea8);
  static Color dark = const Color(0xff5c0078);
  static Color light = const Color(0xffc154da);

  BoxDecoration bgBox() => BoxDecoration(color: light.withOpacity(0.5));

  TextStyle h1Style() => TextStyle(
        fontSize: 30,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
}
