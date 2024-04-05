import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trucks/Common/Theme/color.dart';

class ThemeState {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.tertiaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: AppColors.blackColor, opacity: 0.8),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      prefixIconColor: AppColors.blackColor,
      suffixIconColor: AppColors.blackColor,
    ),
    textTheme: GoogleFonts.lexendTextTheme(
      ThemeData.light().textTheme,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.tertiaryColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      prefixIconColor: Colors.white,
      suffixIconColor: Colors.white,
      focusedBorder: defaultBlackBorder,
      enabledBorder: defaultBlackBorder,
      border: defaultBlackBorder,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}

var defaultWhiteBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.blackColor,
    width: 0.5,
  ),
  borderRadius: const BorderRadius.all(
    Radius.circular(20),
  ),
);

const defaultBlackBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
    width: 1,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
);
