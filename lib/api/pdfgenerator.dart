import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagetotext/provider/fontColorProvider.dart';
import 'package:imagetotext/provider/fontSizeProvider.dart';
import 'package:imagetotext/provider/heightgapslider.dart';
import 'package:imagetotext/provider/letterSpacingSilder.dart';
import 'package:imagetotext/provider/wordSpacingSlider.dart';
import 'package:imagetotext/widgets/dropDownMenu.dart';
import 'package:imagetotext/widgets/errorSnackBar.dart';
import 'package:imagetotext/widgets/imagePicker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

//documents
class pdfGenerator {
  final pdf = pw.Document();
//pdf
  createPdf(List text, BuildContext context) async {
    double? height =
        Provider.of<heightgapSlider>(context, listen: false).heightGap == 0
            ? null
            : Provider.of<heightgapSlider>(context, listen: false).heightGap /
                5.3;
    double? wordspacing = Provider.of<wordSpacingSlider>(context, listen: false)
                .wordSpacing ==
            0.0
        ? null
        : Provider.of<wordSpacingSlider>(context, listen: false).wordSpacing /
            3.3;
    double? letterspacing =
        Provider.of<letterSpacingSlider>(context, listen: false)
                    .letterspacing ==
                0.0
            ? null
            : Provider.of<letterSpacingSlider>(context, listen: false)
                    .letterspacing /
                3.3;
    double? fontsize =
        Provider.of<fontSizeProvider>(context, listen: false).FontSize ?? 16.0;
    final fontFamily =
        Provider.of<dropDownMenu>(context, listen: false).currentIndex;
    Color fontColor =
        Provider.of<fontColorProvider>(context, listen: false).currentColor;

    debugPrint(height.toString());
    debugPrint(wordspacing.toString());
    debugPrint(letterspacing.toString());
    debugPrint(fontsize.toString());
    debugPrint(fontFamily);

    final font = await rootBundle.load("assets/fonts/$fontFamily.ttf");
    final ttf = pw.Font.ttf(font);
    debugPrint(ttf.toString());

    //final bgPage = await rootBundle.loadString("assets/images/bgpage.svg");
    final ByteData bytes = await rootBundle.load('assets/images/page.jpg');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final image = pw.MemoryImage(byteList);

//to create backgroundImages
    final pagetheme = pw.PageTheme(
        margin:
            const pw.EdgeInsets.only(bottom: 0, right: 0, left: 72, top: 72),
        pageFormat: PdfPageFormat.letter,
        buildBackground: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Image(image, fit: pw.BoxFit.cover),
          );
        });

    for (var i = 0;
        i < Provider.of<Imagepicker>(context, listen: false).files.length;
        i++) {
      pdf.addPage(pw.Page(
          pageTheme: pagetheme,
          build: (pw.Context context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.only(left: 23, right: 0, bottom: 0),
              child: pw.Text(text[i],
                  style: pw.TextStyle(
                    color: PdfColor.fromInt(fontColor.value),
                    fontSize: fontsize,
                    font: ttf,
                    height: height,
                    wordSpacing: wordspacing,
                    letterSpacing: letterspacing,
                  )),
            );
          }));
    }
  }
  //Saving file

  savePdf(BuildContext context, String name) async {
    try {
      if (Platform.isIOS) {
        final dir = await getApplicationDocumentsDirectory();
        debugPrint(dir.toString());
        // final path = dir!.path + "/text.pdf";
        final file = File(dir.path + "/" + name + ".pdf");
        await file
            .writeAsBytes(await pdf.save())
            .then((value) => errorSnackbar(context, "File saved"));
      } else {
        final dir = await getExternalStorageDirectory();
        // final path = dir!.path + "/text.pdf";
        final file = File(dir!.path + "/" + name + ".pdf");
        await file
            .writeAsBytes(await pdf.save())
            .then((value) => errorSnackbar(context, "File saved"));
        //saving file
      }
    } on PlatformException catch (e) {
      errorSnackbar(context, e.message.toString());
      //error detection
    }
  }
}
