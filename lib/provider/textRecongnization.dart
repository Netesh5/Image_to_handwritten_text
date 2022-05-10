import 'dart:io';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:imagetotext/widgets/errorSnackBar.dart';

class textProvider with ChangeNotifier {
  Future recoginizeText(String imagePath, BuildContext context) async {
    final visionImage = GoogleVisionImage.fromFilePath(imagePath);
    final textRecognizer = GoogleVision.instance.textRecognizer();
    try {
      final visionText = await textRecognizer.processImage(visionImage);
      await textRecognizer.close();
      final text = extractText(visionText, context);
      return text;
    } on PlatformException catch (e) {
      errorSnackbar(context, e.message.toString());
    }

    notifyListeners();
  }

  String extractText(VisionText visionText, BuildContext context) {
    String text = "";
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          text = text + word.text! + " ";
        }
        text = text + "\n";
      }
    }
    return text;
  }

  void copyTOClipBoard(String text, context) {
    if (text.trim() != "") {
      FlutterClipboard.copy(text)
          .then((value) => errorSnackbar(context, "Copied to clipboard"));
      debugPrint(text);
    }
    notifyListeners();
  }
}
