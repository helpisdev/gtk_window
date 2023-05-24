import 'package:flutter/material.dart';

enum GTKColor {
  lightUnfocusedBackground(
    color: Color(0xFFFAFAFA),
    theme: ThemeMode.light,
    isFocused: false,
    type: GTKColorType.background,
  ),
  darkUnfocusedBackground(
    color: Color(0xFF242424),
    theme: ThemeMode.dark,
    isFocused: false,
    type: GTKColorType.background,
  ),
  lightFocusedBackground(
    color: Color(0xFFEBEBEB),
    theme: ThemeMode.light,
    isFocused: true,
    type: GTKColorType.background,
  ),
  darkFocusedBackground(
    color: Color(0xFF303030),
    theme: ThemeMode.dark,
    isFocused: true,
    type: GTKColorType.background,
  ),
  lightBorder(
    color: Color(0xFFE0E0E0),
    theme: ThemeMode.light,
    type: GTKColorType.border,
  ),
  darkBorder(
    color: Color(0x73000000),
    theme: ThemeMode.dark,
    type: GTKColorType.border,
  ),
  lightFocusedWindowCommandButtonBackground(
    color: Color(0xFFd9d9d9),
    theme: ThemeMode.light,
    isFocused: true,
    type: GTKColorType.buttonBackground,
  ),
  darkFocusedWindowCommandButtonBackground(
    color: Color(0x1AFFFFFF),
    theme: ThemeMode.dark,
    isFocused: true,
    type: GTKColorType.buttonBackground,
  ),
  lightUnfocusedWindowCommandButtonBackground(
    color: Color(0xFFf0f0f0),
    theme: ThemeMode.light,
    isFocused: false,
    type: GTKColorType.buttonBackground,
  ),
  darkUnfocusedWindowCommandButtonBackground(
    color: Color(0xFF2e2e2e),
    theme: ThemeMode.dark,
    isFocused: false,
    type: GTKColorType.buttonBackground,
  ),
  lightWindowCommandButtonIcon(
    color: Color(0xFF000000),
    theme: ThemeMode.light,
    type: GTKColorType.buttonIcon,
  ),
  darkWindowCommandButtonIcon(
    color: Color(0xFFFFFFFF),
    theme: ThemeMode.dark,
    type: GTKColorType.buttonIcon,
  );

  const GTKColor({
    required this.theme,
    required this.type,
    required this.color,
    this.isFocused,
  });

  final bool? isFocused;
  final GTKColorType type;
  final ThemeMode theme;
  final Color color;

  static Color getGTKColor(
    final BuildContext context, {
    required final GTKColorType type,
    final bool? isFocused,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final ThemeMode mode = isDark ? ThemeMode.dark : ThemeMode.light;
    return GTKColor.values
        .singleWhere(
          (final GTKColor color) =>
              color.theme == mode &&
              color.isFocused == isFocused &&
              color.type == type,
        )
        .color;
  }
}

enum GTKColorType {
  background,
  buttonBackground,
  buttonIcon,
  border;
}
