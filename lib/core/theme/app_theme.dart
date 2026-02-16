import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

import '../app_styles.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: AppStyles.onPrimary24700.copyWith(
      color: AppLightColors.onPrimary,
    ),
    backgroundColor: AppColors.transparent,
    foregroundColor: AppLightColors.onPrimary,
    iconTheme: IconThemeData(color: AppLightColors.onPrimary),
  ),
  scaffoldBackgroundColor: AppLightColors.primary,
  drawerTheme: DrawerThemeData(backgroundColor: AppLightColors.primary),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: AppStyles.onPrimary24700.copyWith(
      color: AppDarkColors.onPrimary,
    ),
    foregroundColor: AppDarkColors.onPrimary,

    backgroundColor: AppColors.transparent,
    iconTheme: IconThemeData(color: AppDarkColors.onPrimary),
  ),
  scaffoldBackgroundColor: AppDarkColors.primary,
  drawerTheme: DrawerThemeData(backgroundColor: AppDarkColors.primary),
);
