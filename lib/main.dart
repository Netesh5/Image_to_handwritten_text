import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:imagetotext/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
        StreamProvider(
            create: (context) =>
                Provider.of<Auth>(context, listen: false).authState,
            initialData: null),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "ubuntu",
        ),
        debugShowCheckedModeBanner: false,
        home: const wrapper(),
      ),
    );
  }
}
