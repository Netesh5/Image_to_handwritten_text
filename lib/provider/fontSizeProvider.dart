import 'package:flutter/material.dart';

class fontSizeProvider with ChangeNotifier {
  String fontSize = "";
  double? FontSize;
  fontSizeFormField() {
    return TextFormField(
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      initialValue: fontSize.isEmpty ? "20" : fontSize,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: InputBorder.none, hintText: "      Enter font size"),
      onChanged: (value) {
        fontSize = value;

        notifyListeners();
      },
      onSaved: (value) {
        fontSize = value!;
        FontSize = double.parse(fontSize);
        notifyListeners();
      },
    );
  }
}
