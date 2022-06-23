import 'package:flutter/material.dart';
import 'package:imagetotext/constants/alertdialog.dart';
import 'package:imagetotext/provider/fontColorProvider.dart';
import 'package:imagetotext/provider/fontSizeProvider.dart';
import 'package:imagetotext/provider/heightgapslider.dart';
import 'package:imagetotext/provider/letterSpacingSilder.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/provider/wordSpacingSlider.dart';
import 'package:imagetotext/widgets/bottomNavbar.dart';
import 'package:imagetotext/widgets/dropDownMenu.dart';
import 'package:imagetotext/widgets/imagePicker.dart';
import 'package:imagetotext/widgets/settingBottomSheet.dart';
import 'package:pdf/pdf.dart';

import 'package:provider/provider.dart';

class scanedResult extends StatelessWidget {
  String text;
  List texts = [];
  scanedResult({required this.text, required this.texts});

  TextEditingController textEditingController = TextEditingController();
  int currentIndex = 0;

  // pdfGenerator generator = pdfGenerator();
  @override
  Widget build(BuildContext context) {
    debugPrint("-------------");
    debugPrint(texts.toString());

    debugPrint("-------------");
    // print(texts);
    // debugPrint("-------------");

    return WillPopScope(
      onWillPop: () async {
        Provider.of<Imagepicker>(context, listen: false).files.length = 0;
        texts.clear();
        Provider.of<Imagepicker>(context, listen: false).imagePath = "";
        Provider.of<Imagepicker>(context, listen: false).CroppedImagePath = "";
        return true;
      },
      child: Scaffold(
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
                    alertDialog(context, texts);
                  },
                  icon: const Icon(Icons.picture_as_pdf))
            ],
          ),
          body: ListView.builder(
            itemCount: Provider.of<Imagepicker>(context).files.length,
            itemBuilder: (context, index) => SingleChildScrollView(
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
                      margin: const EdgeInsets.only(left: 75, top: 62),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: TextFormField(
                            textInputAction: TextInputAction.done,
                            minLines: 1,
                            cursorHeight: 10,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              height: Provider.of<heightgapSlider>(context)
                                          .heightGap ==
                                      0
                                  ? null
                                  : Provider.of<heightgapSlider>(context)
                                      .heightGap,
                              wordSpacing:
                                  Provider.of<wordSpacingSlider>(context)
                                              .wordSpacing ==
                                          0.0
                                      ? null
                                      : Provider.of<wordSpacingSlider>(context)
                                          .wordSpacing,
                              letterSpacing: Provider.of<letterSpacingSlider>(
                                              context)
                                          .letterspacing ==
                                      0.0
                                  ? null
                                  : Provider.of<letterSpacingSlider>(context)
                                      .letterspacing,
                              fontFamily: Provider.of<dropDownMenu>(context)
                                  .currentIndex,
                              fontSize: Provider.of<fontSizeProvider>(context)
                                  .FontSize,
                              color: Provider.of<fontColorProvider>(
                                context,
                              ).currentColor,
                            ),
                            initialValue: texts[index],
                            onChanged: (value) {
                              texts[index] = value;
                              debugPrint(text[index]);
                              debugPrint(index.toString());
                            }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Provider.of<bottomNavBar>(context, listen: false)
              .bottomNavbar(context)),
    );
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
            