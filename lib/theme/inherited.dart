import 'package:flutter/material.dart';
import 'package:geeks_theme/theme/theme_initialize.dart';

import 'app_theme.dart';

part './extentions/read_theme_context.dart';

class GeeksThemeProvider extends StatefulWidget {
  const GeeksThemeProvider({
    Key? key,
    required this.child,
    required this.themeDataProvider,
  }) : super(key: key);
  final Widget child;
  final GeeksTheme themeDataProvider;

  @override
  State<GeeksThemeProvider> createState() => _GeeksThemeProviderState();
}

class _GeeksThemeProviderState extends State<GeeksThemeProvider> {
  ThemeMode get currentThemeMode => ThemeInitialize.getCurrentTheme()!;
  void updateThemeMode(ThemeMode newThemeMode) async {
    setState(() {});
    await ThemeInitialize.saveTheme(newThemeMode);
  }

  GeeksTheme get themeDataProvider => widget.themeDataProvider;

  @override
  Widget build(BuildContext context) {
    return GeeksThemeRead(
      stateWidget: this,
      themeMode: currentThemeMode,
      child: widget.child,
    );
  }
}

extension ThemeRead on BuildContext {
  _GeeksThemeProviderState readTheme() => GeeksThemeRead.of(this)!;
}

class GeeksThemeRead extends InheritedWidget {
  const GeeksThemeRead({
    Key? key,
    child,
    required this.themeMode,
    required this.stateWidget,
  }) : super(key: key, child: child);
  final ThemeMode themeMode;
  final _GeeksThemeProviderState stateWidget;

  static _GeeksThemeProviderState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GeeksThemeRead>()
        ?.stateWidget;
  }

  @override
  bool updateShouldNotify(GeeksThemeRead oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
