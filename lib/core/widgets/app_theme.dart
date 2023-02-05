import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  TextTheme textTheme({bool isDarkTheme = false}) => TextTheme(
        displayLarge: GoogleFonts.poppins(
            fontSize: 89.sp,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5.sp),
        displayMedium: GoogleFonts.poppins(
            fontSize: 36.sp,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5.sp),
        displaySmall:
            GoogleFonts.poppins(fontSize: 44.sp, fontWeight: FontWeight.w400),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25.sp,
          color: Colors.black,
        ),
        headlineSmall:
            GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w400),
        titleLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15.sp,
        ),
        titleMedium: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15.sp),
        titleSmall: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1.sp),
        bodyLarge: GoogleFonts.poppins(
          color: AppColors.textBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1.sp,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15.sp,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14.sp,
          letterSpacing: 0.15.sp,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4.sp),
        labelSmall: GoogleFonts.poppins(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5.sp),
      );

  AppBarTheme appBarTheme({bool isDarkTheme = false}) => const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textBlack,
        centerTitle: true,
        elevation: 0,
      );

  CheckboxThemeData checkBoxTheme({bool isDarkTheme = false}) =>
      CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        overlayColor: MaterialStateProperty.all(AppColors.softGray),
      );

  RadioThemeData radioTheme({bool isDarkTheme = false}) => RadioThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primary),
      );

  InputDecorationTheme inputDecorationTheme({bool isDarkTheme = false}) =>
      InputDecorationTheme(
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

  BottomNavigationBarThemeData bottomNavigationBarTheme(
      {bool isDarkTheme = false}) {
    return BottomNavigationBarThemeData(
      backgroundColor: isDarkTheme ? Colors.black26 : Colors.white,
      unselectedItemColor:
          isDarkTheme ? Colors.blue.withOpacity(0.5) : Colors.grey,
    );
  }
}

extension SwitchTheme on AppTheme {
  ThemeData get light => ThemeData(
      textTheme: textTheme(),
      radioTheme: radioTheme(),
      checkboxTheme: checkBoxTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme());
  ThemeData get dark => ThemeData(
        textTheme: textTheme(isDarkTheme: true),
        radioTheme: radioTheme(isDarkTheme: true),
        checkboxTheme: checkBoxTheme(isDarkTheme: true),
        scaffoldBackgroundColor: Colors.black26,
        appBarTheme: appBarTheme(isDarkTheme: true),
        inputDecorationTheme: inputDecorationTheme(isDarkTheme: true),
        bottomNavigationBarTheme: bottomNavigationBarTheme(isDarkTheme: true),
      );
}
