import 'package:flutter/material.dart';
import 'package:imagetotext/provider/fontProvider.dart';
import 'package:provider/provider.dart';

class dropDownMenu with ChangeNotifier {
  var currentIndex = '<TrueType Font "QERuthStafford"';
  dropdownButtonFormField(context) {
    fontProvider.font();
    final fontList = fontProvider.fontlist;
    return DropdownButtonFormField(
      hint: const Text("     choose font"),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      dropdownColor: Theme.of(context).backgroundColor,
      items: fontList.map((fontList) {
        return DropdownMenuItem(
            value: fontList,
            child: Text("$fontList".substring(
              14,
            )));
      }).toList(),
      onChanged: (value) {
        currentIndex = value as String;
        debugPrint(currentIndex.toString());
        notifyListeners();
      },
      onSaved: (value) {
        currentIndex = value as String;
        notifyListeners();
      },
      value: currentIndex,
    );
  }
}
