import 'package:flutter/material.dart';

class themeProvider with ChangeNotifier {
  static bool isDarkThemeEnable = true;
  ThemeMode get currentTheme =>
      isDarkThemeEnable ? ThemeMode.dark : ThemeMode.light;

  void toogleTheme() {
    isDarkThemeEnable = !isDarkThemeEnable;
    notifyListeners();
  }

  static ThemeData get darktheme {
    Color darkcolor = const Color(0xff121212);
    return ThemeData(
        primaryColor: darkcolor,
        backgroundColor: darkcolor,
        scaffoldBackgroundColor: darkcolor,
        fontFamily: "ubuntu",
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
            subtitle2: TextStyle(color: Colors.white)));
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        fontFamily: "ubuntu",
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.black),
            subtitle2: TextStyle(color: Colors.black)));
  }
}
