import 'package:flutter/material.dart';

void errorSnackbar(BuildContext context, String e) {
  final snackBar = SnackBar(content: Text(e));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
