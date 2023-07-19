import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class DarkModeButtonTheme extends AppTheme {
  const DarkModeButtonTheme(
    super.context,
  );

  Color get buttonColor =>
      darkMode ? const Color.fromARGB(255, 28, 45, 90) : Colors.blue;
}
