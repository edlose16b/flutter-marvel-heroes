import 'package:marvelheroes/app/ui/colors.dart';
import 'package:marvelheroes/app/ui/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme(BuildContext context) {
  final lightTheme = Theme.of(context);

  final textColor = lightTheme.textTheme.bodyLarge!.color;

  return ThemeData(
    primarySwatch: generateMaterialColor(Palette.primary),
    textTheme: GoogleFonts.nunitoTextTheme(),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: lightTheme.scaffoldBackgroundColor,
      actionsIconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
  );
}

ThemeData buildDarkTheme(BuildContext context) {
  final darkTheme = ThemeData.dark();

  return ThemeData.dark().copyWith(
    primaryColor: Palette.primary,
    textTheme: GoogleFonts.nunitoTextTheme(darkTheme.textTheme),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      // backgroundColor: darkTheme.scaffoldBackgroundColor,
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
