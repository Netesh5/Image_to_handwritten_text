import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/drawerItem/contact.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:imagetotext/provider/themeProvider.dart';
import 'package:provider/provider.dart';

Widget drawer(context) {
  Auth auth = Auth();
  final user = Provider.of<User>(context, listen: false);
  return Drawer(
    backgroundColor: Theme.of(context).backgroundColor,
    child: SafeArea(
      child: Column(children: [
        Container(
          height: 70,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(user.displayName!)
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.black,
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),
        const ListTile(
          leading: Icon(Icons.feedback_outlined),
          title: Text("Feedback"),
        ),
        const ListTile(
          leading: Icon(Icons.star_outline_sharp),
          title: Text("Rate us"),
        ),
        GestureDetector(
          onTap: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => contactus()));
          }),
          child: const ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text("Contact us"),
          ),
        ),
        GestureDetector(
          onTap: () {
            Provider.of<themeProvider>(context, listen: false).toogleTheme();
          },
          child: ListTile(
            leading: themeProvider.isDarkThemeEnable
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            title: const Text("Theme"),
          ),
        ),
        Consumer<Auth>(
          builder: (context, googleSignout, child) => GestureDetector(
            onTap: () async {
              await auth.googleSignOut(context);
              debugPrint("logged out");
            },
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
            ),
          ),
        ),
      ]),
    ),
  );
}
