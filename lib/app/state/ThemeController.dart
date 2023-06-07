import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get themeMode => _mode;
  void setMode(ThemeMode mode) async {
    _mode = mode;
    notifyListeners();
  }
}
