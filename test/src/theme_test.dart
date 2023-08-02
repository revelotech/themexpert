import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themexpert/themexpert.dart';

class AppTheme extends BaseTheme {
  AppTheme(super.context);

  Color get surfaceColor => darkMode ? Colors.black : Colors.white;
}

void main() {
  Widget buildBoilerPlate(bool isDarkMode) {
    return ThemeXConfiguration(
      darkMode: isDarkMode,
      builder: (context) => ThemeXWrapper(
        theme: AppTheme(context),
        builder: (context) => MaterialApp(
          home: Scaffold(
            body: Container(
              height: 10,
              color: ThemeX.ofType<AppTheme>(context).surfaceColor,
            ),
          ),
        ),
      ),
    );
  }

  group('When widget fetches color token from theme', () {
    testWidgets('and dark mode is not active then it should fetch white',
        (tester) async {
      await tester.pumpWidget(buildBoilerPlate(false));

      final widgetFinder = find.byType(Container);

      final container = widgetFinder.first.evaluate().first.widget as Container;
      expect(container.color, Colors.white);
    });

    testWidgets('and dark mode is active then it should fetch black',
        (tester) async {
      await tester.pumpWidget(buildBoilerPlate(true));

      final widgetFinder = find.byType(Container);

      final container = widgetFinder.first.evaluate().first.widget as Container;
      expect(container.color, Colors.black);
    });
  });
}
