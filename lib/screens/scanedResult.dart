import 'package:flutter/material.dart';
import 'package:imagetotext/api/pdfgenerator.dart';
import 'package:imagetotext/constants/alertdialog.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/screens/homepage.dart';
import 'package:imagetotext/widgets/imagePicker.dart';
import 'package:imagetotext/widgets/settingBottomSheet.dart';
import 'package:provider/provider.dart';

class scanedResult extends StatelessWidget {
  String text;
  scanedResult({required this.text});
  TextEditingController textEditingController = TextEditingController();
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
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: TextFormField(
                  initialValue: text,
                  maxLines: null,
                  expands: true,
                  onChanged: (value) {
                    text = value;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.add_a_photo),
                  title: Text(
                    "Add more images",
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  bottomSheet(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    "Settings",
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
