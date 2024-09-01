import 'package:flutter/material.dart';

@immutable
class ColorTheme extends ThemeExtension<ColorTheme> {
  const ColorTheme({
    required this.primaryColor,
    required this.secondaryColor,
  });
  final Color? primaryColor;
  final Color? secondaryColor;
  @override
  ColorTheme copyWith({Color? primaryColor, Color? secondaryColor}) {
    return ColorTheme(
      primaryColor: secondaryColor ?? this.secondaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  @override
  ColorTheme lerp(ThemeExtension<ColorTheme>? other, double t) {
    if (other is! ColorTheme) {
      return this;
    }
    return ColorTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
    );
  }

  // @override
  // String toString() => 'ColorTheme(brandColor: brandColor, danger: danger)';
}
