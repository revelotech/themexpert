import 'package:flutter/material.dart';
import 'package:themexpert/themexpert.dart';

/// This is the base class for every theme in the application. It is expected
/// that you create your own themes that extend this class. We recommend
/// creating an app theme that will have basic attributes and should be used
/// throughout most of the app.
///
/// When different themes are needed, you should create other themes that extend
/// this app theme and override specific attributes or create new ones if
/// necessary.
///
/// There must be a [ThemeXConfiguration] ancestor in order to fetch the
/// darkMode.
abstract class BaseTheme {
  /// Context where this theme is being used.
  final BuildContext context;

  /// Constructor
  const BaseTheme(
    this.context,
  );

  /// This is a convenience method to fetch the [ThemeXConfiguration] darkMode
  /// property.
  bool get darkMode => ThemeXConfiguration.of(context).darkMode;
}
