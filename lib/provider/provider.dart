import 'package:flutter/material.dart';

class Provider1 extends ChangeNotifier {
  int value = 0;

  void add() {
    value++;
    notifyListeners();
  }

  void sub() {
    value--;
    notifyListeners();

  }
}
