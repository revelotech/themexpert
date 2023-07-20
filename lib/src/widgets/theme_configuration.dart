import 'package:flutter/material.dart';
import 'package:flutter_themex/src/base_theme.dart';

/// This widget controls if it should be dark mode or not. Because of that, it should only be used once
/// and it should be placed as one of the first widgets of the app.
/// Using this Widget is optional if you don't want to use the dark mode feature.
class ThemeConfiguration<T extends BaseTheme> extends InheritedWidget {
  /// Define if it's darkMode
  final bool darkMode;

  /// Constructor: define if it's darkMode and pass MaterialApp as a child
  ThemeConfiguration({
    required this.darkMode,
    required WidgetBuilder builder,
    super.key,
  }) : super(
          child: Builder(
            builder: (context) => builder(context),
          ),
        );

  @override
  bool updateShouldNotify(covariant ThemeConfiguration oldWidget) {
    return darkMode != oldWidget.darkMode;
  }

  /// This is a method used internally by the library to get the current
  /// [ThemeConfiguration] parameters.
  static ThemeConfiguration of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: ThemeConfiguration)!;
}
