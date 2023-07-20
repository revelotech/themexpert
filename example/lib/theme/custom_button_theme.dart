import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class CustomButtonTheme extends AppTheme {
  const CustomButtonTheme(
    super.context,
  );

  Color get buttonColor =>
      darkMode ? const Color.fromARGB(255, 28, 45, 90) : Colors.blue;
}
