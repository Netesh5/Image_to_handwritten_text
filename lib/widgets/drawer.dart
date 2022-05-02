import 'package:flutter/material.dart';

Widget drawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              title: Text("Log out"),
            ),
          ),
        ],
      ),
    ),
  );
}
