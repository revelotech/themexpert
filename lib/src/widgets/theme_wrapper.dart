import 'package:flutter/material.dart';
import 'package:flutter_themex/src/base_theme.dart';
import 'package:flutter_themex/src/widgets/theme_x.dart';

/// ThemeWrapper is a convenience widget to build a tree of widgets with the
/// right [BuildContext] object that is able to fetch the closest theme
/// settings.
///
/// It is alright to use nested themes if necessary.
///
/// In order to access the theming variables, simply call
/// [ThemeX].ofType<YourThemeType>(context) and access the theme's variables.
class ThemeWrapper extends StatelessWidget {
  /// The theme to be used in the tree, it should extend BaseTheme.
  final BaseTheme theme;

  /// The builder that will be used to build the tree.
  final WidgetBuilder builder;

  /// ThemeWrapper is a convenience widget to build a tree of widgets with the
  /// right [BuildContext] that is able to fetch the closest theme settings.
  const ThemeWrapper({
    required this.theme,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeX(
      theme: theme,
      child: Builder(builder: builder),
    );
  }
}
