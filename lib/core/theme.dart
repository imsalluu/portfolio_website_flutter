import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 64,
        fontWeight: FontWeight.w900,
        color: AppColors.textMainDark,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.textMainDark,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.textMainDark,
      ),
      bodyLarge: TextStyle(color: AppColors.textMainDark, fontSize: 18, height: 1.6),
      bodyMedium: TextStyle(color: AppColors.textDimDark, fontSize: 16, height: 1.6),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: Color(0x1A00A3FF),
      onSurface: Colors.white,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 64,
        fontWeight: FontWeight.w900,
        color: AppColors.textMainLight,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.textMainLight,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.textMainLight,
      ),
      bodyLarge: TextStyle(color: AppColors.textMainLight, fontSize: 18, height: 1.6),
      bodyMedium: TextStyle(color: AppColors.textDimLight, fontSize: 16, height: 1.6),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Colors.white,
      onSurface: AppColors.textMainLight,
    ),
  );
}
