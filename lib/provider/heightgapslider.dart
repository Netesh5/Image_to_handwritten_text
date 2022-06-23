import 'package:flutter/material.dart';

class heightgapSlider with ChangeNotifier {
  double heightGap = 0.0;
  bool heightSlider = false;
  HeightgapSlider() {
    return Slider(
        min: 0.0,
        max: 3.0,
        divisions: 12,
        label: heightGap.toString(),
        value: heightGap,
        onChanged: (value) {
          heightGap = value;
          heightSlider = true;
          notifyListeners();
        });
  }
}
