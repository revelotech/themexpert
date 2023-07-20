import 'package:flutter/material.dart';
import 'package:flutter_themex/src/base_theme.dart';

/// This widget controls if it should be dark mode or not. Because of that, it should only be used once
/// and it should be placed as one of the first widgets of the app.
/// Using this Widget is optional if you don't want to use the dark mode feature.
class ThemeXConfiguration<T extends BaseTheme> extends InheritedWidget {
  /// Define if it's darkMode
  final bool darkMode;

  /// Constructor: define if it's darkMode and pass MaterialApp as a child
  ThemeXConfiguration({
    required this.darkMode,
    required WidgetBuilder builder,
    super.key,
  }) : super(
          child: Builder(
            builder: (context) => builder(context),
          ),
        );

  @override
  bool updateShouldNotify(covariant ThemeXConfiguration oldWidget) {
    return darkMode != oldWidget.darkMode;
  }

  /// This is a method used internally by the library to get the current
  /// [ThemeXConfiguration] parameters.
  static ThemeXConfiguration of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: ThemeXConfiguration)!;
}
