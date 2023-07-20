import 'package:flutter/material.dart';
import 'package:flutter_themex/src/base_theme.dart';
import 'package:flutter_themex/src/widgets/theme_x.dart';

/// ThemeXWrapper is a convenience widget to build a tree of widgets with the
/// right [BuildContext] object that is able to fetch the closest theme
/// settings.
///
/// It is alright to use nested themes if necessary.
///
/// In order to access the theming variables, simply call
/// [ThemeX].ofType<YourThemeType>(context) and access the theme's attributes.
class ThemeXWrapper extends StatelessWidget {
  /// The theme to be placed in the tree. It must extend [BaseTheme].
  final BaseTheme theme;

  /// The builder that will be used to build the tree. This is important because
  /// otherwise the [BuildContext] of the widgets below [ThemeXWrapper] in the
  /// WidgetTree wouldn’t have access to the properties of the InheritedWidget
  /// [ThemeX].
  final WidgetBuilder builder;

  /// Constructor
  const ThemeXWrapper({
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
