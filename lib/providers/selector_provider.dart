import 'package:flutter/material.dart';

class SelectorProvider extends ChangeNotifier {
  SelectorProvider(String state) : super();
  String _currentSelected = "";
  String get currentSelected => _currentSelected;
  void select(String selected) {
    _currentSelected = selected;
    notifyListeners();
  }
}
