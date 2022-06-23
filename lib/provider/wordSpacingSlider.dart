import 'package:flutter/material.dart';

class wordSpacingSlider with ChangeNotifier {
  double wordSpacing = 0.0;
  bool wordSlider = false;
  // ignore: non_constant_identifier_names
  WordSpacinggapSlider() {
    return Slider(
        min: 0.0,
        max: 20.0,
        divisions: 10,
        label: wordSpacing.toString(),
        value: wordSpacing,
        onChanged: (value) {
          wordSpacing = value;
          wordSlider = true;
          notifyListeners();
        });
  }
}
