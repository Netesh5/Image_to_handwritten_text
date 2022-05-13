import 'package:flutter/material.dart';
import 'package:imagetotext/provider/fontProvider.dart';
import 'package:provider/provider.dart';

class dropDownMenu with ChangeNotifier {
  int? currentIndex = 0;
  dropdownButtonFormField(context) {
    Provider.of<fontProvider>(context, listen: false).font();
    return DropdownButtonFormField(
        items: Provider.of<fontProvider>(context, listen: false)
            .fontlist
            .map((font) {
          return DropdownMenuItem(value: font, child: Text("$font"));
        }).toList(),
        onChanged: (value) {
          currentIndex = value as int?;
          notifyListeners();
        });
  }
}
