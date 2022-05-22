import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagetotext/provider/fontSizeProvider.dart';
import 'package:imagetotext/provider/heightgapslider.dart';
import 'package:imagetotext/provider/letterSpacingSilder.dart';
import 'package:imagetotext/provider/wordSpacingSlider.dart';
import 'package:imagetotext/widgets/errorSnackBar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class pdfGenerator {
  final pdf = pw.Document();

  createPdf(String text, BuildContext context) async {
    double? height =
        Provider.of<heightgapSlider>(context, listen: false).heightGap == 0
            ? null
            : Provider.of<heightgapSlider>(context, listen: false).heightGap;
    double? wordspacing = Provider.of<wordSpacingSlider>(context, listen: false)
                .wordSpacing ==
            0.0
        ? null
        : Provider.of<wordSpacingSlider>(context, listen: false).wordSpacing;
    double? letterspacing =
        Provider.of<letterSpacingSlider>(context, listen: false)
                    .letterspacing ==
                0.0
            ? null
            : Provider.of<letterSpacingSlider>(context, listen: false)
                .letterspacing;
    final fontsize =
        Provider.of<fontSizeProvider>(context, listen: false).FontSize;
    debugPrint(height.toString());
    debugPrint(wordspacing.toString());
    debugPrint(letterspacing.toString());

    final font = await rootBundle.load("assets/fonts/QEDavidReidCAP.ttf");
    final ttf = pw.Font.ttf(font);
    debugPrint(ttf.toString());

    //final bgPage = await rootBundle.loadString("assets/images/bgpage.svg");
    final ByteData bytes = await rootBundle.load('assets/images/page.jpg');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final image = pw.MemoryImage(byteList);

//to create backgroundImages
    final pagetheme = pw.PageTheme(
        pageFormat: PdfPageFormat.letter,
        //.applyMargin(left: 75, top: 62, right: 0, bottom: 0),
        buildBackground: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Image(image, fit: pw.BoxFit.cover),
          );
        });

    pdf.addPage(pw.Page(
        pageTheme: pagetheme,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.only(
              left: 23,
            ),
            child: pw.Text(text,
                style: pw.TextStyle(
                  fontSize: fontsize,
                  font: ttf,
                  height: height,
                  wordSpacing: wordspacing,
                  letterSpacing: letterspacing,
                )),
          );
        }));
  }

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
      }
    } on PlatformException catch (e) {
      errorSnackbar(context, e.message.toString());
    }
  }
}
