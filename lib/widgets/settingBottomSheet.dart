import 'dart:io';
import 'package:flutter/material.dart';

bottomSheet(context) {
  if (Platform.isIOS) {
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
                        "Setting",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline6!
                                .fontSize),
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
                ],
              ),
            ));
  } else {
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
                        "Setting",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline6!
                                .fontSize),
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
                ],
              ),
            ));
  }
}
