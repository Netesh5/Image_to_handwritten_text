import 'dart:io';

import 'package:flutter/material.dart';
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
                    ? Icon(Icons.image,
                        size: 80, color: Theme.of(context).primaryColor)
                    : Image.file(
                        File(imagepicker.imagePath),
                        fit: BoxFit.cover,
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
                TextButton.icon(
                    onPressed: () {
                      Provider.of<Imagepicker>(context, listen: false)
                          .imagePickerCamera(context);
                    },
                    icon: const Icon(Icons.camera_alt_rounded),
                    label: const Text("Camera")),
                TextButton.icon(
                    onPressed: () {
                      Provider.of<Imagepicker>(context, listen: false)
                          .imagePickerGallay(context);
                    },
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallary")),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => scanedResult()));
        },
        label: const Text(
          "Scan text",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 1,
      ),
    );
  }
}
