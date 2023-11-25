import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static const primaryColor = Color(0xFF5D9CEC);
  static const mintGreen= Color(0xFFDFECDB);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: primaryColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.redAccent,
        background: mintGreen,
        onBackground: Colors.white70,
        surface: Colors.white38,
        onSurface: Colors.white60),
    scaffoldBackgroundColor: mintGreen,
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 35,
      ),
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 20,
        color: primaryColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0,
    ),
  );
  // static ThemeData darkTheme = ThemeData(
  //   primaryColor: primaryColor,
  //   colorScheme: const ColorScheme(
  //       brightness: Brightness.light,
  //       primary: primaryColor,
  //       onPrimary: Colors.black,
  //       secondary: primaryColor,
  //       onSecondary: Colors.white,
  //       error: Colors.red,
  //       onError: Colors.redAccent,
  //       background: mintGreen,
  //       onBackground: Colors.white70,
  //       surface: Colors.white38,
  //       onSurface: Colors.white60),
  //   scaffoldBackgroundColor: Colors.transparent,
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: Color(0xFFB7935F),
  //     selectedIconTheme: IconThemeData(
  //       color: primaryColor,
  //       size: 35,
  //     ),
  //     selectedItemColor: primaryColor,
  //     unselectedItemColor: Colors.grey,
  //     unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
  //   ),
  //   textTheme: TextTheme(
  //     titleLarge: GoogleFonts.poppins(
  //       fontSize: 30,
  //       color: Colors.white,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     bodyLarge: GoogleFonts.poppins(
  //       fontSize: 25,
  //       color: Colors.black,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     bodyMedium: GoogleFonts.poppins(
  //       fontSize: 25,
  //       color: Colors.black,
  //       fontWeight: FontWeight.w500,
  //     ),
  //     bodySmall: GoogleFonts.poppins(
  //       fontSize: 20,
  //       color: Colors.black,
  //       fontWeight: FontWeight.normal,
  //     ),
  //   ),
  //   appBarTheme: AppBarTheme(
  //     iconTheme: IconThemeData(
  //       color: Colors.white,
  //     ),
  //     elevation: 0,
  //     color: Colors.transparent,
  //     centerTitle: true,
  //
  //   ),
  // );
}
