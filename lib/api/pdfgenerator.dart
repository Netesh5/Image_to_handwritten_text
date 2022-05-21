import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagetotext/provider/fontProvider.dart';
import 'package:imagetotext/widgets/errorSnackBar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class pdfGenerator {
  final pdf = pw.Document();

  createPdf(String text) async {
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
              child:
                  pw.Text(text, style: pw.TextStyle(fontSize: 16, font: ttf)));
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
