import 'package:flutter/material.dart';
import 'package:imagetotext/api/pdfgenerator.dart';

alertDialog(BuildContext context, String text) {
  String name = "";
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Center(child: Text("Enter file name")),
      backgroundColor: Theme.of(context).backgroundColor,
      content: TextFormField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 1.0,
              ),
            ),
            border: const OutlineInputBorder()),
        onChanged: (value) {
          name = value;
        },
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () async {
              pdfGenerator generator = pdfGenerator();
              await generator.createPdf(text);
              await generator.savePdf(context, name);
              Navigator.pop(context);
            },
            child: const Text("Save"))
      ],
    ),
  );
}
