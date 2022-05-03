import 'package:flutter/material.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:provider/provider.dart';

Widget drawer() {
  Auth auth = Auth();
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          Consumer<Auth>(
            builder: (context, googleSignout, child) => GestureDetector(
              onTap: () async {
                await auth.googleSignOut(context);
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
