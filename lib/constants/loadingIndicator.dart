import 'package:flutter/material.dart';

class loading with ChangeNotifier {
  bool isLoading = false;
  Widget loadingIndicator(context) {
    return const CircularProgressIndicator(
      color: Colors.white,
    );
  }

  void isloading() {
    isLoading = true;
    notifyListeners();
  }
}
