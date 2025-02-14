import 'package:flutter/material.dart';

class UsernameProvider extends ChangeNotifier {
  String? nama;

  void setUsername(String? input) {
    nama = input;
    notifyListeners();
  }

  void flushUsername() {
    nama = "";
    notifyListeners();
  }
}
