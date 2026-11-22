import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Background Gradient
  static const Color gradientStart = Color(0xFF7B3FD6);
  static const Color gradientEnd = Color(0xFF34188A);

  // Cards
  static const Color cardBackground = Colors.white;
  static const Color cardBorderBottom = Color(0xFFD9D1EE);

  // Main Buttons (Quizizz Yellow)
  static const Color primaryButton = Color(0xFFFFC93C);
  static const Color primaryButtonShadow = Color(0xFFD8A600);
  static const Color primaryButtonText = Color(0xFF2B1B00);

  // Secondary/Action Buttons (Light Purple/White)
  static const Color secondaryButton = Color(0xFFEDE7F6);
  static const Color secondaryButtonShadow = Color(0xFFD1C4E9);
  static const Color secondaryButtonText = Color(0xFF4A148C);

  // Option Buttons (4 Colors & Shapes)
  static const Color optionRed = Color(0xFFE21B3C);
  static const Color optionRedShadow = Color(0xFFA5132A);

  static const Color optionBlue = Color(0xFF1368CE);
  static const Color optionBlueShadow = Color(0xFF0D4891);

  static const Color optionYellow = Color(0xFFD89E00);
  static const Color optionYellowShadow = Color(0xFF9E7300);

  static const Color optionGreen = Color(0xFF26890C);
  static const Color optionGreenShadow = Color(0xFF195E07);

  // HUD & Status
  static const Color hudHeart = Color(0xFFFF4D6D);
  static const Color hudStar = Color(0xFFFFD166);
  static const Color dotCompleted = Color(0xFFFFC93C);
  static const Color dotActive = Colors.white;
  static const Color dotInactive = Color(0x66FFFFFF);

  // Feedback Colors
  static const Color feedbackCorrectBg = Color(0xFFE8F5E9);
  static const Color feedbackCorrectBorder = Color(0xFF2E7D32);
  static const Color feedbackWrongBg = Color(0xFFFFEBEE);
  static const Color feedbackWrongBorder = Color(0xFFC62828);
}

class AppShapes {
  static const String triangle = '▲';
  static const String diamond = '◆';
  static const String circle = '●';
  static const String square = '■';

  static const List<String> optionShapes = [
    triangle,
    diamond,
    circle,
    square,
  ];

  static const List<String> shapeNames = [
    'Segitiga',
    'Belah Ketupat',
    'Lingkaran',
    'Persegi',
  ];

  static const List<Color> optionColors = [
    AppColors.optionRed,
    AppColors.optionBlue,
    AppColors.optionYellow,
    AppColors.optionGreen,
  ];

  static const List<Color> optionShadowColors = [
    AppColors.optionRedShadow,
    AppColors.optionBlueShadow,
    AppColors.optionYellowShadow,
    AppColors.optionGreenShadow,
  ];
}

class AppTheme {
  static ThemeData get themeData {
    final baseTextTheme = GoogleFonts.nunitoTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.gradientStart,
        primary: AppColors.gradientStart,
        secondary: AppColors.primaryButton,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.nunito(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.nunito(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF1F1F24),
        ),
        titleMedium: GoogleFonts.nunito(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF2D2D34),
        ),
        bodyLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2D2D34),
          height: 1.4,
        ),
        bodyMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF4A4A58),
          height: 1.4,
        ),
        labelLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
