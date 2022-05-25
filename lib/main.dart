import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imagetotext/constants/loadingIndicator.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:imagetotext/provider/fontColorProvider.dart';
import 'package:imagetotext/provider/fontSizeProvider.dart';
import 'package:imagetotext/provider/heightgapslider.dart';
import 'package:imagetotext/provider/letterSpacingSilder.dart';
import 'package:imagetotext/provider/textRecongnization.dart';
import 'package:imagetotext/provider/themeProvider.dart';
import 'package:imagetotext/provider/wordSpacingSlider.dart';
import 'package:imagetotext/widgets/bottomNavbar.dart';
import 'package:imagetotext/widgets/dropDownMenu.dart';
import 'package:imagetotext/widgets/imagePicker.dart';
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
        ChangeNotifierProvider<loading>(create: (context) => loading()),
        ChangeNotifierProvider<Imagepicker>(create: (context) => Imagepicker()),
        ChangeNotifierProvider<textProvider>(
            create: (context) => textProvider()),
        ChangeNotifierProvider<themeProvider>(
            create: (context) => themeProvider()),
        ChangeNotifierProvider<bottomNavBar>(
            create: (context) => bottomNavBar()),
        ChangeNotifierProvider<dropDownMenu>(
            create: (context) => dropDownMenu()),
        ChangeNotifierProvider<fontSizeProvider>(
            create: (context) => fontSizeProvider()),
        ChangeNotifierProvider<heightgapSlider>(
            create: (context) => heightgapSlider()),
        ChangeNotifierProvider<wordSpacingSlider>(
            create: (context) => wordSpacingSlider()),
        ChangeNotifierProvider<letterSpacingSlider>(
            create: (context) => letterSpacingSlider()),
        ChangeNotifierProvider<fontColorProvider>(
            create: (context) => fontColorProvider()),
        StreamProvider<User?>.value(
          catchError: (context, error) => null,
          value: Auth().authState,
          initialData: null,
        ),
      ],
      builder: (context, child) => MaterialApp(
        darkTheme: themeProvider.darktheme,
        themeMode: context.watch<themeProvider>().currentTheme,
        theme: themeProvider.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const wrapper(),
      ),
    );
  }
}
