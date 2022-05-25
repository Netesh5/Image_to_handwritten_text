import 'package:flutter/material.dart';

class fontColorProvider with ChangeNotifier {
  Color currentColor = Colors.black;
  List<Color> currentColors = [Colors.red, Colors.blue, Colors.black];
  void changeColor(Color color) {
    currentColor = color;
    notifyListeners();
  }
}
