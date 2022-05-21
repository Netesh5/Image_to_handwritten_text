import 'package:flutter/material.dart';

class fontSizeProvider with ChangeNotifier {
  String fontSize = "";
  double? FontSize;
  fontSizeFormField() {
    return TextFormField(
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      initialValue: fontSize.isEmpty ? "16" : fontSize,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: "      Enter font size"),
      onChanged: (value) {
        fontSize = value;
        try {
          FontSize = double.parse(
              fontSize); // using try catch block to remove null error
        } catch (e) {
          return;
        }
        notifyListeners();
      },
    );
  }
}
