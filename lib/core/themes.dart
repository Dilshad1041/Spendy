import 'package:flutter/material.dart';

class Themes {
  static ThemeData primaryTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 1, 28, 2),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent),
    // Other properties like typography, button themes, etc.
  );
}
