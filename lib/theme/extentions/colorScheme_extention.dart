part of './extentions.dart';

extension ThemeEx on ColorScheme {
  ColorScheme fromColorSchemeTo(ColorScheme colorScheme) {
    return copyWith(
      brightness: colorScheme.brightness,
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      primaryContainer: colorScheme.primaryContainer,
      onPrimaryContainer: colorScheme.onPrimaryContainer,
      secondary: colorScheme.secondary,
      onSecondary: colorScheme.onSecondary,
      secondaryContainer: colorScheme.secondaryContainer,
      onSecondaryContainer: colorScheme.onSecondaryContainer,
      tertiary: colorScheme.tertiary,
      onTertiary: colorScheme.onTertiary,
      tertiaryContainer: colorScheme.tertiaryContainer,
      onTertiaryContainer: colorScheme.onTertiaryContainer,
      error: colorScheme.error,
      onError: colorScheme.onError,
      errorContainer: colorScheme.errorContainer,
      onErrorContainer: colorScheme.onErrorContainer,
      background: colorScheme.background,
      onBackground: colorScheme.onBackground,
      surface: colorScheme.surface,
      onSurface: colorScheme.onSurface,
      surfaceVariant: colorScheme.surfaceVariant,
      onSurfaceVariant: colorScheme.onSurfaceVariant,
      outline: colorScheme.outline,
      shadow: colorScheme.shadow,
      inverseSurface: colorScheme.inverseSurface,
      onInverseSurface: colorScheme.onInverseSurface,
      inversePrimary: colorScheme.inversePrimary,
      surfaceTint: colorScheme.surfaceTint,
    );
  }
}
