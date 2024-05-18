import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'q_colors.dart';
import 'q_constants.dart';

class QAppTextStyles {
  //NOTE - Headline Style
  static final TextStyle displayLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 57,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final TextStyle displayMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 45,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final TextStyle displaySmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 36,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  //NOTE - Headline Style
  static final TextStyle headlineLarge = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final TextStyle headlineMedium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final TextStyle headlineSmall = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  //NOTE -  Title Style
  static final TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final TextStyle titleSmall = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  //NOTE - Label Style
  static final TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: QColors.text,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: QColors.text,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: QColors.grey_80,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  //NOTE - Body Style
  static final TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: QColors.text,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: QColors.text,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static final TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: QColors.grey_80,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static const TextStyle inputStyle = TextStyle(
    fontSize: QConstants.kFontSizeM,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle button = TextStyle(
    fontSize: QConstants.kFontSizeM,
    fontWeight: FontWeight.w700,
  );

  // https://api.flutter.dev/flutter/material/TextTheme-class.html
  static TextTheme get textTheme {
    final textTheme = TextTheme(
      // Headline
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    ).apply(
      bodyColor: QColors.grey_80,
      displayColor: QColors.text,
    );
    return textTheme;
  }
}


//  w100 → const FontWeight
//     Thin, the least thick
//     FontWeight._(0, 100)
// w200 → const FontWeight
//     Extra-light
//     FontWeight._(1, 200)
// w300 → const FontWeight
//     Light
//     FontWeight._(2, 300)
// w400 → const FontWeight
//     Normal / regular / plain
//     FontWeight._(3, 400)
// w500 → const FontWeight
//     Medium
//     FontWeight._(4, 500)
// w600 → const FontWeight
//     Semi-bold
//     FontWeight._(5, 600)
// w700 → const FontWeight
//     Bold
//     FontWeight._(6, 700)
// w800 → const FontWeight
//     Extra-bold
//     FontWeight._(7, 800)
// w900 → const FontWeight
//     Black, the most thick
//     FontWeight._(8, 900)
