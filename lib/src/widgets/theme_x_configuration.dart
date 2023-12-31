import 'package:flutter/material.dart';
import 'package:themexpert/src/base_theme.dart';

/// This widget controls if the theme should be dark mode or not. It should only
/// be used once and be placed before the first occurrence of [ThemeXWrapper].
/// Using this Widget is optional if you don't want to use the dark mode feature.
class ThemeXConfiguration<T extends BaseTheme> extends InheritedWidget {
  /// Define if it's darkMode
  final bool darkMode;

  /// Constructor
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
