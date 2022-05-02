import 'package:flutter/material.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:imagetotext/screens/homepage.dart';
import 'package:imagetotext/screens/loginScreen.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    if (user != null) {
      return const HomePage();
    } else {
      return const loginScreen();
    }
  }
}
