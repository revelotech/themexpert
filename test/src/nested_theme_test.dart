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

enum TokenType { overridden, exclusive }

void main() {
  Color getColor(BuildContext context, TokenType tokenType) {
    return tokenType == TokenType.overridden
        ? ThemeX.ofType<AppTheme>(context).surfaceColor
        : ThemeX.ofType<NestedTheme>(context).primaryColor;
  }

  Widget buildBoilerPlate({required TokenType tokenType}) {
    return ThemeXConfiguration(
      darkMode: false,
      builder: (context) => ThemeXWrapper(
        theme: AppTheme(context),
        builder: (context) => MaterialApp(
          home: Scaffold(
            backgroundColor: ThemeX.ofType<AppTheme>(context).surfaceColor,
            body: ThemeXWrapper(
              theme: NestedTheme(context),
              builder: (context) {
                return Container(
                  height: 10,
                  color: getColor(context, tokenType),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  group('When widget fetches color token from theme', () {
    group('and it is a nested theme with overridden tokens', () {
      testWidgets('then it should not affect widgets above it in the tree',
          (tester) async {
        await tester
            .pumpWidget(buildBoilerPlate(tokenType: TokenType.overridden));

        final scaffoldFinder = find.byType(Scaffold);
        expect(scaffoldFinder, findsOneWidget);

        final scaffold =
            scaffoldFinder.first.evaluate().first.widget as Scaffold;
        expect(scaffold.backgroundColor, Colors.white);
      });

      testWidgets('then it should get the correct token from nested theme',
          (tester) async {
        await tester
            .pumpWidget(buildBoilerPlate(tokenType: TokenType.overridden));

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
      await tester.pumpWidget(buildBoilerPlate(tokenType: TokenType.exclusive));

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
