import 'package:flutter/material.dart';
import 'package:flutter_themex/flutter_themex.dart';
import 'package:flutter_themex_example/theme/app_theme.dart';
import 'package:flutter_themex_example/theme/accent_theme.dart';
import 'package:flutter_themex_example/theme/switch_component_theme.dart';

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
          debugShowCheckedModeBanner: false,
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
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 40,
                            bottom: 12,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 1,
                          ),
                          color: themeOf(context).badgeColor,
                          child: Text(
                            'APP THEME',
                            style: themeOf(context).txBodySmaller,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 12,
                            bottom: 12,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'This is the app ',
                                  style: themeOf(context).txBodyBig,
                                ),
                                TextSpan(
                                  text: 'main theme',
                                  style: themeOf(context).txBodyBig.copyWith(
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 12,
                            bottom: 12,
                          ),
                          child: Text(
                            'All the tokens and cool things that your '
                            'app needs are configured here. Also, I need '
                            'to write a few more words so the description '
                            'feels a little less lorem-ipsum-ish',
                            style: themeOf(context).txBodySmall,
                          ),
                        ),
                        ThemeXWrapper(
                          theme: AccentTheme(context),
                          builder: (context) {
                            return Container(
                              margin: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 12,
                                bottom: 12,
                              ),
                              padding: const EdgeInsets.all(24),
                              color: themeOf(context).surfaceColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 1,
                                    ),
                                    color: themeOf(context).badgeColor,
                                    child: Text(
                                      'ACCENT THEME',
                                      style: themeOf(context).txBodySmaller,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'This is the Accent Theme. ',
                                            style: themeOf(context)
                                                .txBodySmall
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w800),
                                          ),
                                          TextSpan(
                                            text:
                                                'It will always maintain it\'s color hierarchy, although some color might need to be tweaked.',
                                            style: themeOf(context).txBodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                    ),
                                    child: Text(
                                      'Read more',
                                      style:
                                          themeOf(context).txBodySmall.copyWith(
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: ThemeXWrapper(
                      theme: SwitchComponentTheme(context),
                      builder: (context) => Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                ThemeX.ofType<SwitchComponentTheme>(context)
                                    .borderRadius,
                            color: themeOf(context).surfaceColor,
                            boxShadow: themeOf(context).darkMode
                                ? null
                                : [
                                    ThemeX.ofType<SwitchComponentTheme>(context)
                                        .shadow
                                  ],
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Switch(
                                activeColor:
                                    themeOf(context).highlightTextColor,
                                value: isDarkMode,
                                onChanged: (value) {
                                  setState(() {
                                    isDarkMode = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Toggle Dark Mode',
                                style:
                                    ThemeX.ofType<SwitchComponentTheme>(context)
                                        .txSwitch,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
