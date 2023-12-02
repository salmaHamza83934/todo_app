import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static const primaryColorLight = Color(0xFF5D9CEC);
  static const primaryColorDark=Color(0xFF060E1E);
  static const mintGreen= Color(0xFFDFECDB);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColorLight,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColorLight,
        onPrimary: Colors.black,
        secondary: primaryColorLight,
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
        color: primaryColorLight,
        size: 35,
      ),
      selectedItemColor: primaryColorLight,
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
        color: primaryColorLight,
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
        fontWeight: FontWeight.w700,
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorLight,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColorDark,
        onPrimary: Colors.white,
        secondary: primaryColorLight,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.redAccent,
        background: primaryColorDark,
        onBackground: Colors.white70,
        surface: Colors.white38,
        onSurface: Colors.white60),
    scaffoldBackgroundColor: primaryColorDark,
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: primaryColorLight,
        size: 35,
      ),
      selectedItemColor: primaryColorLight,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 20,
        color: primaryColorLight,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
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
