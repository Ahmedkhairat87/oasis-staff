import 'dart:ui';
import 'package:flutter/material.dart';

abstract class ColorsManager {
  // ---------- LIGHT THEME COLORS ----------

  // Backgrounds
  static const Color lightBackGround = Color(0xFFF9F9F9);       // App background
  static const Color cardColor = Color(0xFFFFFFFF);             // Card backgrounds
  static const Color borderColor = Color(0xFFEAEAEA);           // Borders & shadows

  // Primary & Secondary
  static const Color lightPrimaryColor = Color(0xFF3281F4);     // Main blue
  static const Color lightOnPrimaryColor = Color(0xFF1A1A1A);   // Text on primary surfaces (dark gray)
  static const Color lightSecondaryColor = Color(0xFF30B8B0);   // Teal
  static const Color lightTertiaryColor = Color(0xFFF47A70);    // Coral/red-orange
  static const Color lightActionBlue = Color(0xFFE1EDFE);       // Background for icons (e.g. Check-In icons)

  // Neutral / Greys
  static const Color lightGrey = Color(0xFFA9A9A9);             // Soft text
  static const Color lightWhite = Color(0xFFFFFFFF);            // Explicit white

  // ---------- DARK THEME COLORS ----------

  static const Color darkBackGround = Color(0xFF000000);        // App background
  static const Color darkCardColor = Color(0xFF1E1E1E);         // Cards in dark mode
  static const Color darkBorderColor = Color(0xFF2C2C2C);       // Card borders / dividers

  static const Color darkPrimaryColor = Color(0xFF82B1FF);      // Same blue as light theme
  static const Color darkOnPrimaryColor = Color(0xFFFFFFFF);    // Text on dark background (white)
  static const Color darkSecondaryColor = Color(0xFF30B8B0);    // Teal
  static const Color darkTertiaryColor = Color(0xFFF47A70);     // Coral/red-orange
  static const Color darkActionBlue = Color(0xFF1A2B48);        // Muted background for icons

  static const Color darkGrey = Color(0xFFD3D3D3);              // Text/labels on dark
  static const Color darkWhite = Color(0xFFFFFFFF);             // Explicit white
}