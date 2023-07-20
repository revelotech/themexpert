import 'package:flutter/material.dart';
import 'package:flutter_themex/flutter_themex.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';
import 'package:flutter_themex_example/theme/dark_mode_button_theme.dart';
import 'package:flutter_themex_example/theme/secondary_theme.dart';
import 'package:flutter_themex_example/theme/specific_widget_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  String get darkModeState => isDarkMode ? 'ON' : 'OFF';

  @override
  Widget build(BuildContext context) {
    return ThemeXConfiguration(
      darkMode: isDarkMode,
      builder: (context) => ThemeXWrapper(
        theme: AppTheme(context),
        builder: (context) => MaterialApp(
          home: Scaffold(
            backgroundColor: themeOf(context).surfaceColor,
            appBar: AppBar(
              backgroundColor: themeOf(context).surfaceColor,
              title: Text(
                'Flutter ThemeX Example',
                style: TextStyle(color: themeOf(context).highlightTextColor),
              ),
              systemOverlayStyle: themeOf(context).uiOverlayStyle,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: SizedBox(
                  height: 30,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Powered by Revelo',
                      style: TextStyle(
                        color: themeOf(context).poweredByReveloTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      width: double.maxFinite,
                      color: themeOf(context).primaryColor,
                      child: Center(
                          child: Text(
                        'App Theme',
                        style: themeOf(context).txBody,
                      )),
                    ),
                  ),
                  Expanded(
                    child: ThemeXWrapper(
                      theme: SecondaryTheme(context),
                      builder: (context) => Container(
                        margin: const EdgeInsets.all(12),
                        width: double.maxFinite,
                        color: themeOf(context).primaryColor,
                        child: Center(
                            child: Text(
                          'Secondary Theme',
                          style: themeOf(context).txBody,
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ThemeXWrapper(
                      theme: SpecificWidgetTheme(context),
                      builder: (context) => Container(
                        margin: const EdgeInsets.all(12),
                        width: double.maxFinite,
                        color: themeOf(context).primaryColor,
                        child: Center(
                            child: Text(
                          'Specific widget Theme',
                          style: ThemeX.ofType<SpecificWidgetTheme>(context)
                              .txTitle,
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ThemeXWrapper(
                      theme: DarkModeButtonTheme(context),
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 24),
                          width: double.maxFinite,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ThemeX.ofType<DarkModeButtonTheme>(context)
                                      .buttonColor,
                            ),
                            child: Text(
                              'Dark Mode: $darkModeState',
                              style: themeOf(context).txBody,
                            ),
                            onPressed: () {
                              setState(() {
                                isDarkMode = !isDarkMode;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
