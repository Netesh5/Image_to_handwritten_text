import 'package:flutter/material.dart';
import 'package:imagetotext/widgets/drawer.dart';

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
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: const Icon(
                Icons.image,
                size: 80,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_rounded),
                    label: const Text("Camera")),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo),
                    label: const Text("Gallary")),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Scan text"),
        elevation: 1,
      ),
    );
  }
}
