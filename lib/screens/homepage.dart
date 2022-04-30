import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:imagetotext/main.dart';
import 'package:imagetotext/screens/loginScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context);
    if (user != null) {
      return MyApp();
      // return Scaffold(
      //   appBar: AppBar(
      //     title: const Text("Image to Handwritten Text"),
      //   ),
      // );
    } else {
      return loginScreen();
    }
  }
}
