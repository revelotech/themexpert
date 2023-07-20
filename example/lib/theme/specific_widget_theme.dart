import 'package:flutter/material.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';

class SpecificWidgetTheme extends AppTheme {
  const SpecificWidgetTheme(
    super.context,
  );

  @override
  Color get primaryColor => darkMode ? Colors.black : Colors.redAccent;

  TextStyle get txTitle => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
      ).copyWith(color: darkMode ? Colors.white : Colors.black);
}
