import 'package:flutter/widgets.dart';
import 'package:flutter_themex/src/base_theme.dart';
import 'package:flutter_themex/src/widgets/theme_configuration.dart';

/// [ThemeX] is an inherited widget used to hold the theme info for the
/// descendants of this tree. Prefer using the [ThemeWrapper] widget, otherwise
/// it will be necessary to use both the [ThemeX] widget and a [Builder] in
/// order to apply the desired theme to the right context.
///
/// There must be a [ThemeConfiguration] ancestor in order to use this widget.
class ThemeX extends InheritedWidget {
  /// This field is the theme you want applied to your widget tree.
  final BaseTheme theme;

  /// Constructor - Prefer using the [ThemeWrapper] widget. otherwise it will be
  /// necessary to use both the [ThemeX] widget and a [Builder] in order to get
  /// the right context.
  const ThemeX({
    required this.theme,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant ThemeX oldWidget) {
    return oldWidget.theme != theme;
  }

  /// This is a the method that should be used to fetch the theme properties
  /// of the desired context. It will throw an error if the theme is not found
  /// in the widget tree.
  static T ofType<T extends BaseTheme>(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeX>(
      aspect: ThemeX,
    );
    assert(
      result?.theme is T,
      'Theme of type $T not found in the Widget tree.',
    );
    return result!.theme as T;
  }
}
