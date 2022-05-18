import 'package:flutter/material.dart';

class heightgapSlider with ChangeNotifier {
  double heightGap = 0.0;
  HeightgapSlider() {
    return Slider(
        min: 0.0,
        max: 3.0,
        divisions: 12,
        value: heightGap,
        onChanged: (value) {
          heightGap = value;
          notifyListeners();
        });
  }
}
