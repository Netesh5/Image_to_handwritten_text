import 'package:flutter/material.dart';

class wordSpacingSlider with ChangeNotifier {
  double wordSpacing = 0.0;
  // ignore: non_constant_identifier_names
  WordSpacinggapSlider() {
    return Slider(
        min: 0.0,
        max: 20.0,
        divisions: 10,
        value: wordSpacing,
        onChanged: (value) {
          wordSpacing = value;
          notifyListeners();
        });
  }
}
