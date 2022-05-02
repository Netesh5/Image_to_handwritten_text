import 'package:flutter/material.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:provider/provider.dart';

Widget drawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          Consumer<Auth>(
            builder: (context, googleSignout, child) => GestureDetector(
              onTap: () {
                googleSignout.googleSignOut;
                debugPrint("logged out");
              },
              child: const ListTile(
                tileColor: Colors.indigoAccent,
                title: Text("Log out"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
