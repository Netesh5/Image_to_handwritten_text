import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imagetotext/provider/fontProvider.dart';
import 'package:imagetotext/provider/fontSizeProvider.dart';
import 'package:imagetotext/provider/heightgapslider.dart';
import 'package:imagetotext/provider/letterSpacingSilder.dart';
import 'package:imagetotext/provider/wordSpacingSlider.dart';
import 'package:imagetotext/widgets/dropDownMenu.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

bottomSheet(context) {
  Object? currentIndex;
  double currentValue = 5;
  String fontName = "";
  String fontSize = "";
  int heightGap;
  int wordSpacing;
  int letterSpacing;
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
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                title: Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize),
                  ),
                ),
                automaticallyImplyLeading: false,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      child: const Center(
                          child: Text(
                        "Done",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
                iconTheme:
                    IconThemeData(color: Theme.of(context).iconTheme.color),
                titleTextStyle: Theme.of(context).textTheme.headline6,
                toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Choose font",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Provider.of<dropDownMenu>(context)
                                        .dropdownButtonFormField(context),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Font size",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child:
                                        Provider.of<fontSizeProvider>(context)
                                            .fontSizeFormField(),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Height gap",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Consumer<heightgapSlider>(
                                        builder:
                                            (context, heightslider, child) =>
                                                heightslider.HeightgapSlider()),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Word Spacing",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Consumer<wordSpacingSlider>(
                                      builder: (context, wordspacing, child) =>
                                          wordspacing.WordSpacinggapSlider(),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Letter spacing",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Consumer<letterSpacingSlider>(
                                        builder: ((context, letterSpacing,
                                                child) =>
                                            letterSpacing
                                                .LetterSpacingSlider())),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
}
