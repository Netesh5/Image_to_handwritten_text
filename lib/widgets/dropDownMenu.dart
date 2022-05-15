import 'package:flutter/material.dart';
import 'package:imagetotext/provider/fontProvider.dart';
import 'package:provider/provider.dart';

class dropDownMenu with ChangeNotifier {
  var currentIndex = "QERuthStafford";
  dropdownButtonFormField(context) {
    fontProvider.font();
    final fontList = [
      "QEAntonyLark",
      "QEBEV",
      "QEBradenHill",
      "QEDavidReidCAP",
      "QEKevinShirley",
      "QEKunjarScript",
      "QEPrintVersion",
      "QERuthStafford",
      "QEVRead"
    ];
    return DropdownButtonFormField(
      hint: const Text("     choose font"),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      dropdownColor: Theme.of(context).backgroundColor,
      items: fontList.map((fontList) {
        return DropdownMenuItem(value: fontList, child: Text("$fontList"));
      }).toList(),
      onChanged: (value) {
        currentIndex = value.toString();
        debugPrint(currentIndex.toString());
        notifyListeners();
      },
      onSaved: (value) {
        currentIndex = value.toString();
        notifyListeners();
      },
      value: currentIndex,
    );
  }
}
