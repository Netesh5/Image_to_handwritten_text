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
        colorScheme: const ColorScheme.light(
            primary: Colors.white, secondary: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),

//font size of drawer item

            subtitle1: TextStyle(color: Colors.white),
            subtitle2: TextStyle(color: Colors.white)));
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primaryContainer: Colors.black,
          primary: Colors.black, //button color
          secondary: Colors.black, //button background color
          onSecondary: Colors.white, //for text color inside button
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        primaryIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.black),
        fontFamily: "ubuntu",
        textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.black),
            headline4: TextStyle(color: Colors.black),
            headline5: TextStyle(color: Colors.black),
            headline6: TextStyle(color: Colors.black),
            bodyText1:
                TextStyle(color: Colors.black), //font size of drawer item
            subtitle1: TextStyle(color: Colors.black),
            subtitle2: TextStyle(color: Colors.black)));
  }
}
