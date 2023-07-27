import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class DarkModeComponentTheme extends AppTheme {
  const DarkModeComponentTheme(
    super.context,
  );

  @override
  Color get surfaceColor => darkMode ? Color(0xFF0C152C) : Color(0xFFF7F8F9);
}
