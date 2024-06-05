import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.grey.shade700,
  ),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.pink.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
);
ThemeData darkmode = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.grey.shade300,
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: const Color.fromRGBO(236, 64, 122, 1),
    secondary: Colors.black38,
    inversePrimary: Colors.grey.shade300,
  ),
);
