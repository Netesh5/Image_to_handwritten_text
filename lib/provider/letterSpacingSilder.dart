import 'package:flutter/material.dart';

class letterSpacingSlider with ChangeNotifier {
  double letterspacing = 0.0;
  bool letterSlider = false;
  LetterSpacingSlider() {
    return Slider(
        min: 0.0,
        max: 5,
        divisions: 10,
        label: letterspacing.toString(),
        value: letterspacing,
        onChanged: (value) {
          letterspacing = value;
          letterSlider = true;
          notifyListeners();
        });
  }
}
