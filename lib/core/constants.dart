import 'package:flutter/material.dart';

class AppColors {
  // Cyan & Carbon Palette (Inspired by Jacob Aiden)
  static const Color primary = Color(0xFF00A3FF); // Vibrant Cyan
  static const Color secondary = Color(0xFF050B18); // Midnight Navy (Darker)
  static const Color accent = Color(0xFF00FFE0); // Bright Turquoise Cyan
  
  // Dark Theme - Carbon Obsidian
  static const Color darkBgStart = Color(0xFF050A18); // Deep Midnight
  static const Color darkBgEnd = Color(0xFF020409); // Near Black
  static const List<Color> darkGradient = [
    Color(0xFF050A18),
    Color(0xFF020409),
  ];
  
  // Light Theme - Ice & Glass
  static const Color lightBgStart = Color(0xFFF0F9FF); // Very Light Cyan tint
  static const Color lightBgEnd = Color(0xFFE0F2FE); // Soft Blue-ish tint
  static const List<Color> lightGradient = [
    Color(0xFFF0F9FF),
    Color(0xFFE0F2FE),
  ];
  
  // Text Colors
  static const Color textMainDark = Color(0xFFFFFFFF);
  static const Color textDimDark = Color(0xFFA0AEC0); // Blueish Gray
  
  static const Color textMainLight = Color(0xFF0F172A); // Midnight Navy
  static const Color textDimLight = Color(0xFF475569); // Slate

  // Branding / Special
  static const Color hireMe = Color(0xFF00A3FF);
  static const Color surfaceDark = Color(0x1A00A3FF); // Cyan glow surface
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double section = 60.0;
}
