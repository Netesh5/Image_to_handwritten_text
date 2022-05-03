import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  Stream<User?> get authState {
    return auth.authStateChanges();
  } //for state change

  Future googleSignin() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn(); //Instance of google sign in
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
              await auth.signInWithCredential(credential);
          user = userCredential.user;
        } catch (e) {
          debugPrint(e.toString());
        }
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> googleSignOut(context) async {
    try {
      return await auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
