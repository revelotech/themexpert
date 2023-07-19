import 'package:flutter/material.dart';
import 'package:flutter_themex/flutter_themex.dart';

/// This is the base class for every theme in the application. If you come to need to create
/// an additional theme, simply extend it and override the necessary variables.
///
/// There must be a [ThemeConfiguration] ancestor in order to fetch the darkMode.
abstract class BaseTheme {
  /// Context where this theme is being used.
  final BuildContext context;

  // /// This should ONLY be used in specific cases in which, for example, there's not a
  // /// GlobalAppTheme available on the tree.
  // final bool? manualDarkMode;

  /// Constructor
  const BaseTheme(
    this.context,
    // this.manualDarkMode,
  );

  /// This is a convenience method to fetch the [ThemeConfiguration] darkMode
  /// property.
  bool get darkMode => ThemeConfiguration.of(context).darkMode;
}
