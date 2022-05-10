import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/screens/scanedResult.dart';
import 'package:imagetotext/widgets/drawer.dart';
import 'package:imagetotext/widgets/imagePicker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text(
          "Image to Text",
        ),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      drawer: drawer(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Consumer<Imagepicker>(
              builder: (context, imagepicker, child) => Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: imagepicker.imagePath.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Add one or mutiple images",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Icon(Icons.image,
                              size: 80, color: Theme.of(context).primaryColor),
                        ],
                      )
                    : Image.file(
                        File(imagepicker.imagePath),
                        fit: BoxFit.fill,
                      ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 1, //spread radius
                          blurRadius: 3, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      color: Theme.of(context).backgroundColor),
                  child: TextButton.icon(
                      onPressed: () {
                        Provider.of<Imagepicker>(context, listen: false)
                            .imagePickerCamera(context);
                      },
                      icon: const Icon(Icons.camera_alt_rounded),
                      label: const Text("Camera")),
                ),
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 1, //spread radius
                          blurRadius: 3, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                      color: Theme.of(context).backgroundColor),
                  child: TextButton.icon(
                    onPressed: () {
                      Provider.of<Imagepicker>(context, listen: false)
                          .imagePickerGallay(context);
                    },
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallery"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Consumer<textProvider>(
        builder: (context, textrecognizer, child) =>
            FloatingActionButton.extended(
          onPressed: () async {
            final result = await textrecognizer.recoginizeText(
                Provider.of<Imagepicker>(context, listen: false).imagePath,
                context);
            //debugPrint(
            //Provider.of<Imagepicker>(context, listen: false).imagePath);
            debugPrint(result);
            if (result != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => scanedResult(text: result)));
            } else {
              return;
            }
          },
          label: const Text(
            "Scan text",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 1,
        ),
      ),
    );
  }
}
