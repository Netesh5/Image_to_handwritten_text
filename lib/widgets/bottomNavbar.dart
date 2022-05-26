import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/widgets/imagePicker.dart';
import 'package:imagetotext/widgets/settingBottomSheet.dart';
import 'package:provider/provider.dart';

class bottomNavBar with ChangeNotifier {
  bottomNavbar(context) {
    int currentIndex = 0;
    return NavigationBar(
      height: 60,
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
          label: "Settings",
        ),
      ],
      onDestinationSelected: (index) {
        currentIndex = index;
        if (currentIndex == 0) {
          Navigator.pop(context);
          // Provider.of<Imagepicker>(context, listen: false)
          //     .imagePickerGallay(context)
          //     .whenComplete(() => Provider.of<textProvider>(context)
          //         .recoginizeText(
          //             Provider.of<Imagepicker>(context).CroppedImagePath,
          //             context));
        } else {
          bottomSheet(context);
        }
        notifyListeners();
      },
    );
  }
}
