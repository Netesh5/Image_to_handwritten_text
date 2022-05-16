import 'package:flutter/material.dart';

class heightgapSlider with ChangeNotifier {
  double heightGap = 1.0;
  HeightgapSlider() {
    return Slider(
        min: 0.0,
        max: 10.0,
        divisions: 10,
        value: heightGap,
        onChanged: (value) {
          heightGap = value;
          notifyListeners();
        });
  }
}
