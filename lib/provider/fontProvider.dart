import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class fontProvider with ChangeNotifier {
  List<Font> fontlist = [];
  font() async {
    final font = await rootBundle.load("assets/fonts/QERuthStafford.ttf");
    final ttf = pw.Font.ttf(font);
    final font2 = await rootBundle.load("assets/fonts/QEAntonyLark.ttf");
    final ttf2 = pw.Font.ttf(font2);
    final font3 = await rootBundle.load("assets/fonts/QEBEV.ttf");
    final ttf3 = pw.Font.ttf(font3);
    final font4 = await rootBundle.load("assets/fonts/QEBradenHill.ttf");
    final ttf4 = pw.Font.ttf(font4);
    final font5 = await rootBundle.load("assets/fonts/QEDavidReidCAP.ttf");
    final ttf5 = pw.Font.ttf(font5);
    final font6 = await rootBundle.load("assets/fonts/QEKevinShirley.ttf");
    final ttf6 = pw.Font.ttf(font6);
    final font7 = await rootBundle.load("assets/fonts/QEKunjarScript.ttf");
    final ttf7 = pw.Font.ttf(font7);
    final font8 = await rootBundle.load("assets/fonts/QEPrintVersion.ttf");
    final ttf8 = pw.Font.ttf(font8);
    final font9 = await rootBundle.load("assets/fonts/QEVRead.ttf");
    final ttf9 = pw.Font.ttf(font9);
    fontlist = [ttf, ttf2, ttf3, ttf4, ttf5, ttf6, ttf7, ttf8, ttf9];
  }
}
