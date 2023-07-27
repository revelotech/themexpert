import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class AccentTheme extends AppTheme {
  const AccentTheme(
    super.context,
  );

  @override
  Color get surfaceColor => darkMode ? Color(0xFF3A7C92) : Color(0xFF9CDAE7);

  @override
  Color get badgeColor => darkMode ? Color(0xFF2B5970) : Color(0xFFEFF9FB);
}
