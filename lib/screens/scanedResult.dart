import 'package:flutter/material.dart';

import 'package:imagetotext/constants/alertdialog.dart';
import 'package:imagetotext/provider/fontSizeProvider.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/widgets/bottomNavbar.dart';
import 'package:imagetotext/widgets/dropDownMenu.dart';

import 'package:imagetotext/widgets/settingBottomSheet.dart';
import 'package:pdf/pdf.dart';

import 'package:provider/provider.dart';

class scanedResult extends StatelessWidget {
  String text;
  scanedResult({required this.text});
  TextEditingController textEditingController = TextEditingController();
  int currentIndex = 0;

  // pdfGenerator generator = pdfGenerator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: true,
          title: const Text(
            "Scanned Text",
          ),
          titleTextStyle: Theme.of(context).textTheme.headline6,
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          backgroundColor: Theme.of(context).backgroundColor,
          actions: [
            Consumer<textProvider>(
              builder: (context, copyToClipboard, child) => IconButton(
                  onPressed: () {
                    copyToClipboard.copyTOClipBoard(text, context);
                  },
                  icon: const Icon(Icons.copy)),
            ),
            IconButton(
                onPressed: () {
                  alertDialog(context, text);
                  // generator.createPdf(text);
                  // generator.savePdf(context);
                },
                icon: const Icon(Icons.picture_as_pdf))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: PdfPageFormat.letter.height,
                width: PdfPageFormat.letter.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/page.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  margin: const EdgeInsets.only(left: 72, top: 62),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: TextFormField(
                      minLines: 1,
                      cursorHeight: 0.1,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily:
                              Provider.of<dropDownMenu>(context).currentIndex,
                          fontSize:
                              Provider.of<fontSizeProvider>(context).FontSize,
                          color: Colors.black),
                      initialValue: text,
                      maxLines: 28,
                      onChanged: (value) {
                        text = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Provider.of<bottomNavBar>(context, listen: false)
            .bottomNavbar(context));
  }
}



// const SizedBox(
//                 height: 10,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: const ListTile(
//                   leading: Icon(Icons.add_a_photo),
//                   title: Text(
//                     "Add more images",
//                   ),
//                   trailing: Icon(Icons.arrow_forward_ios_rounded),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   bottomSheet(context);
//                 },
//                 child: const ListTile(
//                   leading: Icon(Icons.settings),
//                   title: Text(
//                     "Settings",
//                   ),
//                   trailing: Icon(Icons.arrow_forward_ios_rounded),
//                 ),
//               ),
            