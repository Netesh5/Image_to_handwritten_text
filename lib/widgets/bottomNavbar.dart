import 'package:flutter/material.dart';
import 'package:imagetotext/widgets/settingBottomSheet.dart';

class bottomNavBar with ChangeNotifier {
  bottomNavbar(context) {
    int currentIndex = 0;
    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: Theme.of(context).backgroundColor,
      destinations: [
        NavigationDestination(
            icon: Icon(
              Icons.add_a_photo_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            selectedIcon: Icon(
              Icons.add_a_photo,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Add more images"),
        NavigationDestination(
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            selectedIcon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            label: "Settings"),
      ],
      onDestinationSelected: (index) {
        currentIndex = index;
        if (currentIndex == 0) {
        } else {
          bottomSheet(context);
        }
        notifyListeners();
      },
    );
  }
}
