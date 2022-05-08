import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagetotext/widgets/errorSnackBar.dart';

class Imagepicker with ChangeNotifier {
  XFile? file;
  String imagePath = "";
  Future imagePickerGallay(context) async {
    try {
      file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        imagePath = file!.path;
        debugPrint(imagePath);
      } else {
        return;
      }
    } on PlatformException catch (e) {
      errorSnackbar(context, e.toString());
    }
    notifyListeners();
  }

  Future imagePickerCamera(context) async {
    try {
      file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        imagePath = file!.path;
      } else {
        return;
      }
    } on PlatformException catch (e) {
      errorSnackbar(context, e.toString());
    }
    notifyListeners();
  }
}
