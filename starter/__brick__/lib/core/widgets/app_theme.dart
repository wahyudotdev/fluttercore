import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  final textTheme = TextTheme(
    headline1: GoogleFonts.oswald(
        fontSize: 89, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: GoogleFonts.oswald(
        fontSize: 55, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: GoogleFonts.oswald(fontSize: 44, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.oswald(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.black,
    ),
    headline5: GoogleFonts.oswald(fontSize: 22, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.oswald(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.oswald(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: GoogleFonts.oswald(
        fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: GoogleFonts.mulish(
      color: AppColors.textBlack,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
    ),
    bodyText2: GoogleFonts.mulish(
      color: AppColors.textBlack,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    button: GoogleFonts.mulish(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    caption: GoogleFonts.mulish(
        fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.mulish(
        fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  final appBarTheme = const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.textBlack,
    centerTitle: true,
    elevation: 0,
  );

  final checkBoxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(AppColors.blue),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    overlayColor: MaterialStateProperty.all(AppColors.softGray),
  );

  final radioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColors.blue),
  );
}
