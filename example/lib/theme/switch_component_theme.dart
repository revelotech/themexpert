import 'package:flutter/material.dart';
import 'package:themexpert_example/theme/app_theme.dart';

class SwitchComponentTheme extends AppTheme {
  const SwitchComponentTheme(
    super.context,
  );

  @override
  Color get surfaceColor =>
      darkMode ? const Color(0xFF0C152C) : const Color(0xFFF7F8F9);

  List<BoxShadow>? get shadow => darkMode
      ? null
      : [
          const BoxShadow(
            color: Color(0xFF112239),
            blurRadius: 1,
            offset: Offset(0, 1),
          )
        ];

  BorderRadius get borderRadius => BorderRadius.circular(200);
}
