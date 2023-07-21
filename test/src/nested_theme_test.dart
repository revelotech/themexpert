import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_themex/flutter_themex.dart';

class AppTheme extends BaseTheme {
  AppTheme(super.context);

  Color get surfaceColor => darkMode ? Colors.black : Colors.white;
}

class NestedTheme extends AppTheme {
  NestedTheme(super.context);

  @override
  Color get surfaceColor => darkMode ? Colors.red : Colors.blue;

  Color get primaryColor => darkMode ? Colors.green : Colors.yellow;
}

void main() {
  Widget buildBoilerPlate({required WidgetBuilder nestedThemeWithToken}) {
    return ThemeXConfiguration(
      darkMode: false,
      builder: (context) => ThemeXWrapper(
        theme: AppTheme(context),
        builder: (context) => MaterialApp(
          home: Scaffold(
            backgroundColor: ThemeX.ofType<AppTheme>(context).surfaceColor,
            body: nestedThemeWithToken(context),
          ),
        ),
      ),
    );
  }

  group('When widget fetches color token from theme', () {
    group('and it is a nested theme with overridden tokens', () {
      testWidgets('then it should not affect widgets above it in the tree',
          (tester) async {
        await tester.pumpWidget(
          buildBoilerPlate(
            nestedThemeWithToken: (context) => ThemeXWrapper(
              theme: NestedTheme(context),
              builder: (context) {
                return Container(
                  height: 10,
                  color: ThemeX.ofType<NestedTheme>(context).surfaceColor,
                );
              },
            ),
          ),
        );

        final scaffoldFinder = find.byType(Scaffold);
        expect(scaffoldFinder, findsOneWidget);

        final scaffold =
            scaffoldFinder.first.evaluate().first.widget as Scaffold;
        expect(scaffold.backgroundColor, Colors.white);
      });

      testWidgets('then it should get the correct token from nested theme',
          (tester) async {
        await tester.pumpWidget(
          buildBoilerPlate(
            nestedThemeWithToken: (context) => ThemeXWrapper(
              theme: NestedTheme(context),
              builder: (context) {
                return Container(
                  height: 10,
                  color: ThemeX.ofType<NestedTheme>(context).surfaceColor,
                );
              },
            ),
          ),
        );

        final scaffoldFinder = find.byType(Scaffold);
        expect(scaffoldFinder, findsOneWidget);

        final widgetFinder = find.byType(Container);
        expect(widgetFinder, findsOneWidget);

        final scaffold =
            scaffoldFinder.first.evaluate().first.widget as Scaffold;
        expect(scaffold.backgroundColor, Colors.white);

        final container =
            widgetFinder.first.evaluate().first.widget as Container;
        expect(container.color, Colors.blue);
      });
    });

    testWidgets(
        'and it is a nested theme with exclusive token then it should get the correct token from nested theme',
        (tester) async {
      await tester.pumpWidget(
        buildBoilerPlate(
          nestedThemeWithToken: (context) => ThemeXWrapper(
            theme: NestedTheme(context),
            builder: (context) {
              return Container(
                height: 10,
                color: ThemeX.ofType<NestedTheme>(context).primaryColor,
              );
            },
          ),
        ),
      );

      final scaffoldFinder = find.byType(Scaffold);
      expect(scaffoldFinder, findsOneWidget);

      final widgetFinder = find.byType(Container);
      expect(widgetFinder, findsOneWidget);

      final scaffold = scaffoldFinder.first.evaluate().first.widget as Scaffold;
      expect(scaffold.backgroundColor, Colors.white);

      final container = widgetFinder.first.evaluate().first.widget as Container;
      expect(container.color, Colors.yellow);
    });
  });
}
