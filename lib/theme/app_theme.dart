import 'package:flutter/material.dart';
import 'package:geeks_theme/geeks_theme.dart';
import 'package:geeks_theme/theme/extentions/extentions.dart';



// part './text_theme.dart';
// https://api.flutter.dev/flutter/material/ThemeData/extensions.html
class GeeksTheme {
  GeeksTheme({
    this.useMaterial3 = true,
    this.lightColorScheme,
    this.darkColorScheme,
    this.textTheme,
    required this.useSeed ,
    this.darkSeedSchemeColor,
    this.lightSeedSchemeColor,
    this.themeChangeApp,
  });

  final bool useMaterial3;

  /// when used with seed the seed will show and this is did not work
  final ColorScheme? lightColorScheme;

  /// when used with seed the seed will show and this is did not work
  final ColorScheme? darkColorScheme;
  final TextTheme? Function(TextTheme? textTheme)? textTheme;

  /// If true, use a seed to generate a random color scheme.
  final bool useSeed;

  /// If useSeed light is true, this is the seed color for the theme.
  final ColorScheme? lightSeedSchemeColor;
  /// If useSeed dark is true, this is the seed color for the theme.
  final ColorScheme? darkSeedSchemeColor;

  /// used to change the theme and Widgets.
  // final ThemeData? themeChange;
  final ThemeData? Function(ColorScheme)? themeChangeApp;

  /// Light theme data from [ThemeData.lightTheme]
  ThemeData get lightTheme {
    late ColorScheme scheme;
    if (useSeed) {
      scheme = lightSeedSchemeColor ?? darkSeedSchemeColor??  const ColorScheme.light();
    } else {
      scheme = lightColorScheme ?? const ColorScheme.light();
    }
    final data = ThemeData.light().fromThemeDataTo(themeChangeApp!(scheme));
      TextTheme? textThemeToData = textTheme ==null ? data.textTheme : textTheme!(data.textTheme);
    return _themeProvider(scheme, data , textThemeToData);
  }

  /// Dark theme data from [ThemeData.darkTheme]
  ThemeData get darkTheme {
    late ColorScheme scheme;
    if (useSeed) {
      scheme = darkSeedSchemeColor ?? lightSeedSchemeColor?? const ColorScheme.dark();
    } else {
      scheme = darkColorScheme ?? const ColorScheme.dark();
    }
    final data = ThemeData.dark().fromThemeDataTo(themeChangeApp!(scheme))..textTheme;
     TextTheme? textThemeToData = textTheme ==null ? data.textTheme : textTheme!(data.textTheme);
    return _themeProvider(scheme, data , textThemeToData);
  }

  ThemeData _themeProvider(ColorScheme colorScheme, ThemeData themeData , TextTheme? textThemeToData) {
    return themeData.copyWith(
      useMaterial3: useMaterial3,
      colorScheme: colorScheme,
      textTheme: textThemeToData,
      scaffoldBackgroundColor:colorScheme.background,
      brightness:colorScheme.brightness ,
      primaryColor: colorScheme.primary,
    );
  }
}
