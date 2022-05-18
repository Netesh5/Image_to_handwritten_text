import 'package:flutter/material.dart';

class heightgapSlider with ChangeNotifier {
  int heightGap = 2;
  HeightgapSlider() {
    return Slider(
        min: 1,
        max: 10,
        divisions: 10,
        value: heightGap.toDouble(),
        onChanged: (value) {
          heightGap = value.toInt();
          notifyListeners();
        });
  }
}
