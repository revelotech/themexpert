import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class SwitchComponentTheme extends AppTheme {
  const SwitchComponentTheme(
    super.context,
  );

  @override
  Color get surfaceColor =>
      darkMode ? const Color(0xFF0C152C) : const Color(0xFFF7F8F9);

  TextStyle get txSwitch => txBody.copyWith(fontSize: 16);

  BoxShadow get shadow => BoxShadow(
        color: themeOf(context).shadowColor,
        blurRadius: 1,
        offset: const Offset(0, 1),
      );

  BorderRadius get borderRadius => BorderRadius.circular(200);
}
