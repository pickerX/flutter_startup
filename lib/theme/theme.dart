import 'package:flutter/material.dart';
import 'package:flutter_startup/theme/color.dart';
import 'package:flutter_startup/theme/font.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData defaultTheme() {
    return ThemeData(primarySwatch: Colors.amber);
  }

  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: lightColorScheme.surface,
      canvasColor: lightColorScheme.secondary,
      textTheme: GoogleFonts.poppinsTextTheme(lightTextTheme),
      // iconTheme: IconThemeData(color: lightColorScheme.onSecondary),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: lightColorScheme.primary),
    );
  }

  static ThemeData dartTheme() {
    return ThemeData(
      colorScheme: darkColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: darkColorScheme.surface,
      canvasColor: darkColorScheme.secondary,
      textTheme: GoogleFonts.poppinsTextTheme(darkTextTheme),
      // iconTheme: IconThemeData(color: darkColorScheme.onSecondary),
      // floatingActionButtonTheme: FloatingActionButtonThemeData(
      //     backgroundColor: darkColorScheme.primary),
    );
  }
}
