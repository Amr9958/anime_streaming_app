import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const String mulish = 'Mulish';
  
  // Google Fonts TextStyle getters
  static TextStyle get mulishLight => GoogleFonts.mulish(fontWeight: FontWeight.w300);
  static TextStyle get mulishRegular => GoogleFonts.mulish(fontWeight: FontWeight.w400);
  static TextStyle get mulishMedium => GoogleFonts.mulish(fontWeight: FontWeight.w500);
  static TextStyle get mulishSemiBold => GoogleFonts.mulish(fontWeight: FontWeight.w600);
  static TextStyle get mulishBold => GoogleFonts.mulish(fontWeight: FontWeight.w700);
  static TextStyle get mulishExtraBold => GoogleFonts.mulish(fontWeight: FontWeight.w800);
  static TextStyle get mulishBlack => GoogleFonts.mulish(fontWeight: FontWeight.w900);
  
  // Base Mulish TextStyle
  static TextStyle mulishTextStyle({FontWeight? fontWeight, double? fontSize, Color? color}) {
    return GoogleFonts.mulish(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );
  }
}