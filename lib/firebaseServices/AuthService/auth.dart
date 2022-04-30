import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future googleSignin() async {
    // final GoogleSignIn signIn = GoogleSignIn(
    //     //scopes: ['email', 'https://www.googlesapis.com/auth/contacts.readonly'],
    //     );
    try {
      final GoogleSignIn signIn = GoogleSignIn(
          //scopes: ['email', 'https://www.googlesapis.com/auth/contacts.readonly'],
          );
      GoogleSignInAccount? googleSignInAccount = await signIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        try {
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
