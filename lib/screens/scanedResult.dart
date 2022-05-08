import 'package:flutter/material.dart';
import 'package:imagetotext/widgets/settingBottomSheet.dart';

class scanedResult extends StatelessWidget {
  const scanedResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        title: const Text(
          "Scaned Text",
        ),
        titleTextStyle: Theme.of(context).textTheme.headline6,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: TextFormField(
                maxLines: null,
                expands: true,
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
                  "Setting",
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}
