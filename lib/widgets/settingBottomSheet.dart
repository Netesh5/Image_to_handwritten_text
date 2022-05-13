import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imagetotext/provider/fontProvider.dart';
import 'package:imagetotext/widgets/dropDownMenu.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

bottomSheet(context) {
  Object? currentIndex;
  return showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).backgroundColor,
      isScrollControlled: true,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Center(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize),
                    ),
                  ),
                  leading: GestureDetector(
                    child: const Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.done),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Provider.of<dropDownMenu>(context)
                        .dropdownButtonFormField(context) // DropdownButton(
                    //     items: const [
                    //       DropdownMenuItem(
                    //         child: Text("font"),
                    //         value: "font1",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("font"),
                    //         value: "font2",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("font"),
                    //         value: "font3",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("font"),
                    //         value: "font4",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("font"),
                    //         value: "font5",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text("font"),
                    //         value: "font6",
                    //       )
                    //     ],
                    //     value: currentIndex,
                    //     onChanged:
                    //         Provider.of<fontProvider>(context, listen: false)
                    //             .font(currentIndex))
                  ],
                )
              ],
            ),
          ));
}
