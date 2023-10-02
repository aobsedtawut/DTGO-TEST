import 'package:flutter/material.dart';

ThemeData dtgoTheme(BuildContext context) {
  return ThemeData(
    fontFamily: 'totae',
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: gray1D,
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(primary: Colors.yellow, secondary: Colors.black),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.yellow,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: gray1D,
    ),
  );
}

const Color cream = Color(0xFFF5F4F0);
const Color gray1D = Color(0xFF1D1D1D);

const Color grayD3 = Color.fromARGB(255, 116, 115, 115);
