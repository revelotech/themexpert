# Flutter ThemeX

[![pub package](https://img.shields.io/pub/v/flutter_themex?style=plastic&logo=flutter)](https://pub.dev/packages/flutter_themex)

![Flutter ThemeX Logo](https://raw.githubusercontent.com/revelojobs/flutter_themex/main/doc/static/ThemeX_Symbol96.png)

Flutter ThemeX is a highly customized theme solution for Flutter apps to make it easy to apply multiple themes with no effort when a redesign is needed.

## Features

![Working form gif](https://raw.githubusercontent.com/revelojobs/flutter_themex/main/doc/static/ThemeX_example.gif)

- Theme configuration with support for dark mode.
- Theme Wrapper to enable simple usage of themes.
- Base theme to get you started right away with your own themes.
- ThemeX to source the theme of the current context and use its tokens.

## Requirements


## Usage

1. Add the `flutter_themex` package to your [pubspec dependencies](https://pub.dev/packages/flutter_themex/install).

2. Create your own AppTheme class extending from BaseTheme making sure to pass the `context`. See the example app on how to do that.

3. Add your theme tokens to your theme class.

4. [optional] Add a standalone method in your AppTheme class' file to make it comfortable to access your theme. See the example app on how to do that.
    ```dart
    AppTheme themeOf(BuildContext context) {
      return ThemeX.ofType<AppTheme>(context);
    }
    ```

4. [optional] Add Dark Mode support to your app.

    1. Add support to dark mode by adding Theme Configuration to the root of your app (before MaterialApp).
    2. After that, make sure to wrap your MaterialApp in a ThemeXWrapper with you AppTheme. The beginning of your widget tree should look like this:
        ```dart
            @override
            Widget build(BuildContext context) {
                return ThemeXConfiguration(
                    darkMode: isDarkMode,
                    builder: (context) => ThemeXWrapper(
                        theme: AppTheme(context),
                        builder: (context) => MaterialApp(
            // ...
        ```
    3. To toggle dark mode, you should update ThemeXConfiguration's darkMode property. This will update all the themes in your app with the new dark mode configuration. There is a quick example on how to do that in the example app.

6. When creating new themes, always extend them from your main AppTheme.

    1. If your theme has unique tokens, not available in your general AppTheme, use ThemeX.ofType<YourSpecificTheme>(context) to be able to access them. See the example app on how to do that.
    2. If your theme only overrides tokens from AppTheme, you can use themeOf(context) to access them.
