import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/screens/homepage.dart';
import 'package:imagetotext/screens/loginScreen.dart';
import 'package:imagetotext/screens/scanedResult.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const loginScreen();
      //return scanedResult(text: "My name is Nitesh Paudel");
    } else {
      return HomePage();
    }
  }
}
