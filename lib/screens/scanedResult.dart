import 'package:flutter/material.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/widgets/settingBottomSheet.dart';
import 'package:provider/provider.dart';

class scanedResult extends StatelessWidget {
  String text;
  scanedResult({required this.text});

  TextEditingController textEditingController = TextEditingController();
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
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
                height: 20,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
