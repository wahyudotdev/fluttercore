import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  final textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
        fontSize: 89.sp, fontWeight: FontWeight.w300, letterSpacing: -1.5.sp),
    headline2: GoogleFonts.poppins(
        fontSize: 36.sp, fontWeight: FontWeight.w300, letterSpacing: -0.5.sp),
    headline3:
        GoogleFonts.poppins(fontSize: 44.sp, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.poppins(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25.sp,
      color: Colors.black,
    ),
    headline5:
        GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15.sp,
    ),
    subtitle1: GoogleFonts.poppins(
        fontSize: 14.sp, fontWeight: FontWeight.w400, letterSpacing: 0.15.sp),
    subtitle2: GoogleFonts.poppins(
        fontSize: 13.sp, fontWeight: FontWeight.w500, letterSpacing: 0.1.sp),
    bodyText1: GoogleFonts.poppins(
      color: AppColors.textBlack,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1.sp,
    ),
    bodyText2: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15.sp,
    ),
    button: GoogleFonts.poppins(
      fontSize: 14.sp,
      letterSpacing: 0.15.sp,
      color: Colors.white,
    ),
    caption: GoogleFonts.poppins(
        fontSize: 13.sp, fontWeight: FontWeight.w400, letterSpacing: 0.4.sp),
    overline: GoogleFonts.poppins(
        fontSize: 11.sp, fontWeight: FontWeight.w400, letterSpacing: 1.5.sp),
  );

  final appBarTheme = const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: AppColors.textBlack,
    centerTitle: true,
    elevation: 0,
  );

  final checkBoxTheme = CheckboxThemeData(
    fillColor: MaterialStateProperty.all(AppColors.primary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.r),
    ),
    overlayColor: MaterialStateProperty.all(AppColors.softGray),
  );

  final radioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColors.primary),
  );

  final inputDecorationTheme = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.softGray,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.softGray,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.primarySwatch,
      ),
    ),
    iconColor: AppColors.primarySwatch,
    focusColor: AppColors.primarySwatch,
  );

  static final marginHorizontal = 24.w;
  static final marginVertical = 24.h;
}
