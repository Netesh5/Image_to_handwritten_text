import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imagetotext/constants/loadingIndicator.dart';
import 'package:imagetotext/firebaseServices/AuthService/auth.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo_white.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 70,
              ),
              Consumer<Auth>(
                builder: (context, googleSignIn, child) => Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton.icon(
                      onPressed: () async {
                        await googleSignIn.googleSignin();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      label: Consumer<loading>(
                        builder: (context, value, child) => value.isLoading
                            ? value.loadingIndicator(context)
                            : const Text(
                                "continue with google",
                                style: TextStyle(color: Colors.white),
                              ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
