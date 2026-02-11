import "package:flutter/material.dart";

class AppColors {
  static Color get primary => AppLightColors.primary;
  static Color get onPrimary => AppLightColors.onPrimary;
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
