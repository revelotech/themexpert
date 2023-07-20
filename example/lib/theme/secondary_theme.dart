import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class SecondaryTheme extends AppTheme {
  const SecondaryTheme(
    super.context,
  );

  @override
  Color get primaryColor => darkMode ? Colors.orange : Colors.orangeAccent;
}
