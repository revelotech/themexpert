import 'package:flutter/services.dart';
import 'package:flutter_themex/flutter_themex.dart';
import 'package:flutter/material.dart';

class AppTheme extends BaseTheme {
  const AppTheme(
    super.context,
  );

  SystemUiOverlayStyle get uiOverlayStyle =>
      darkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

  Color get surfaceColor =>
      darkMode ? const Color(0xFF112239) : const Color(0xFFEFF9FB);

  Color get shadowColor =>
      darkMode ? const Color(0xFFEFF9FB) : const Color(0xFF112239);

  Color get primaryColor => const Color(0xFF5AC2D7);

  Color get badgeColor =>
      darkMode ? const Color(0xFF2B5970) : const Color(0xFFBDE7EF);

  Color get highlightTextColor =>
      darkMode ? const Color(0xFFF7F8F9) : const Color(0xFF3A506B);

  Color get linkColor => darkMode ? const Color(0xFF9CDAE7) : const Color(0xFF3A7C92);

  Color get poweredByReveloTextColor => darkMode
      ? const Color(0xFF5AC2D7)
      : const Color.fromARGB(255, 9, 60, 126);

  TextStyle get txBody => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 1,
        leadingDistribution: TextLeadingDistribution.even,
        color: highlightTextColor,
      );

  TextStyle get txBodyBig => txBody.copyWith(
        fontSize: 38,
        fontWeight: FontWeight.w600,
      );

  TextStyle get txBodySmall => txBody.copyWith(
        fontSize: 16,
      );

  TextStyle get txBodySmaller => txBody.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );
}

AppTheme themeOf(BuildContext context) {
  return ThemeX.ofType<AppTheme>(context);
}
