import 'package:flutter/material.dart';

class themeProvider with ChangeNotifier {
  static bool isDarkThemeEnable = false;
  static bool isLightThemeEnable = false;
  static ThemeData get darktheme {
    Color darkcolor = Color(0xff121212);
    return ThemeData(
        primaryColor: darkcolor,
        backgroundColor: darkcolor,
        scaffoldBackgroundColor: darkcolor,
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white)));
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.black)));
  }
}
