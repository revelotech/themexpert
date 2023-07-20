import 'package:flutter/material.dart';
import 'package:flutter_themex/flutter_themex.dart';

/// This is the base class for every theme in the application. It is expected that you create
/// your own themes that extend this class. We recommend creating an app theme that will
//// have basic attributes and should be used throughout most of the app. When needed you should
/// create other themes that extends this app theme created and override specific attributes or even
/// create new ones if necessary.
///
/// There must be a [ThemeXConfiguration] ancestor in order to fetch the darkMode.
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
