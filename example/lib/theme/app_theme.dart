import 'package:flutter/services.dart';
import 'package:flutter_themex/flutter_themex.dart';
import 'package:flutter/material.dart';

class AppTheme extends BaseTheme {
  const AppTheme(
    super.context,
  );

  SystemUiOverlayStyle get uiOverlayStyle =>
      darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

  Color get surfaceColor => darkMode ? const Color(0xFF0C152C) : Colors.white;

  Color get primaryColor => darkMode ? Colors.teal : Colors.tealAccent;

  Color get highlightTextColor => darkMode ? Colors.white : Colors.black;

  Color get poweredByReveloTextColor => darkMode
      ? const Color(0xFF5AC2D7)
      : const Color.fromARGB(255, 9, 60, 126);

  TextStyle get txBody => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
      ).copyWith(color: darkMode ? Colors.white : Colors.black);
}

AppTheme themeOf(BuildContext context) {
  return ThemeX.ofType<AppTheme>(context);
}
