import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/app_colors.dart';

class AppStyles {
  //700 onPrimary
  static TextStyle get onPrimary24700 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w700,
    fontSize: 24,
  );
  static TextStyle get onPrimary16700 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w700,
    fontSize: 16,
  );

  //500 onPrimary
  static TextStyle get onPrimary20500 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w500,
    fontSize: 20,
  );
  static TextStyle get onPrimary24500 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w500,
    fontSize: 24,
  );
  static TextStyle get onPrimary14500 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w500,
    fontSize: 14,
  );

  /// //////////////
  //700 primary
  static TextStyle get primary24700 => GoogleFonts.inter(
      color: AppColors.primary,
      fontWeight: .w700,
      fontSize: 24,
    );
  static TextStyle get primary20700 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w700,
    fontSize: 20,
  );

  //500 primary
  static TextStyle get primary20500 => GoogleFonts.inter(
    color: AppColors.onPrimary,
    fontWeight: .w500,
    fontSize: 20,
  );

  /// //////////////
  //700 gray
  static TextStyle get gray20700 =>
      GoogleFonts.inter(color: AppColors.gray, fontWeight: .w700, fontSize: 20);

  //500 gray
  static TextStyle get gray12500 =>
      GoogleFonts.inter(color: AppColors.gray, fontWeight: .w500, fontSize: 12);
}
