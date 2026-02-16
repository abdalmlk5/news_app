import "package:flutter/material.dart";
import "package:news_app/core/providers/theme_provider.dart";

class AppColors {
  AppColors._();
  static bool get _isDark => ThemeProvider.instance?.isDark() ?? false;

  static Color get primary =>
      _isDark ? AppDarkColors.primary : AppLightColors.primary;
  static Color get onPrimary =>
      _isDark ? AppDarkColors.onPrimary : AppLightColors.onPrimary;
  static const Color white = Colors.white;
  static const Color gray = Color(0xFFA0A0A0);
  static const Color transparent = Colors.transparent;
}

class AppLightColors {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color onPrimary = Color(0xFF171717);
}

class AppDarkColors {
  static const Color primary = Color(0xFF171717);
  static const Color onPrimary = Color(0xFFFFFFFF);
}
