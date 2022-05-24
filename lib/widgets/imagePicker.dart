import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagetotext/widgets/errorSnackBar.dart';
import 'package:image_cropper/image_cropper.dart';

class Imagepicker with ChangeNotifier {
  XFile? file;
  String imagePath = "";
  String CroppedImagePath = "";
  Future imagePickerGallay(context) async {
    try {
      file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (file != null) {
        imagePath = file!.path;
        debugPrint(imagePath);
        CropImage(imagePath);
      } else {
        return;
      }
    } on PlatformException catch (e) {
      errorSnackbar(context, e.message.toString());
    }
    notifyListeners();
  }

  Future imagePickerCamera(context) async {
    try {
      file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        imagePath = file!.path;
        CropImage(imagePath);
      } else {
        return;
      }
    } on PlatformException catch (e) {
      errorSnackbar(context, e.message.toString());
    }
    notifyListeners();
  }

  CropImage(imagePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imagePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      CroppedImagePath = croppedImage.path;
      debugPrint(croppedImage.path);
      notifyListeners();
    }
  }
}
