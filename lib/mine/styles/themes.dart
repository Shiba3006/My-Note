import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme:  const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black87,
      fontSize: 18.0,
      fontFamily: 'SedgwickAve-Regular',
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontSize: 14.0,
      fontFamily: 'SedgwickAve-Regular',
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontFamily: 'SedgwickAve-Regular',
    ),
  ),
  appBarTheme:  const AppBarTheme(
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: defaultColor,
      fontFamily: 'SedgwickAve-Regular',
    ),
  ),
  bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: defaultColor,
    // FAB. BG. + Circle AV. BG. + selected border + selected selected NAV. icon
      onPrimary: primaryColor!, // FAB. icon
      secondary: defaultColor,
      onSecondary: black,
      error: red,
      onError: Colors.redAccent,
      background: white, // NAV. BG. == scaffoldBackgroundColor
      onBackground: defaultColor, // unselected border
      surface: white,
      // appbar BG. + card BG. == scaffoldBackgroundColor + appbar title
      onSurface: defaultColor, // icons + appbar leading + border label
  ),
  useMaterial3: true,
);
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: semiBlackColor,
  textTheme:  const TextTheme(
    bodyLarge: TextStyle(
      color: semiWhiteColor,
      fontSize: 18.0,
      fontFamily: 'SedgwickAve-Regular',
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: semiWhiteColor,
      fontSize: 14.0,
      fontFamily: 'SedgwickAve-Regular',
    ),
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontFamily: 'SedgwickAve-Regular',
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: black,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontSize: 25.0,
      color: semiWhiteColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'SedgwickAve-Regular',
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: semiWhiteColor, // FAB. BG. + Circle AV. BG. + selected border
    onPrimary: semiBlackColor, // FAB. icon
    secondary: primaryColor!, // selected NAV. icon
    onSecondary: white,
    error: Colors.red,
    onError: Colors.redAccent,
    background: semiBlackColor, // NAV. BG. == scaffoldBackgroundColor
    onBackground: semiWhiteColor, // unselected border
    surface: semiGreyColor!, // appbar BG. + card BG.
    onSurface: semiWhiteColor, // icons + pop arrow + border label
  ),
  useMaterial3: true,
);