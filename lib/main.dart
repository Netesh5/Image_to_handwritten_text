import 'package:flutter/material.dart';
import 'package:imagetotext/screens/homepage.dart';
import 'package:imagetotext/screens/loginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ubuntu",
      ),
      debugShowCheckedModeBanner: false,
      home: loginScreen(),
    );
  }
}
